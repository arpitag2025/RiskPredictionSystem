from flask import Flask, jsonify, request, render_template
from google.cloud import bigquery
from datetime import datetime
import numpy as np
from sklearn.ensemble import IsolationForest

app = Flask(__name__)

# -------------------------
# Home Route
# -------------------------
@app.route('/')
def home():
    return render_template("index.html")


# -------------------------
# Health Check
# -------------------------
@app.route('/health')
def health():
    return jsonify({
        "status": "running",
        "service": "healthcare-risk-api",
        "timestamp": datetime.now().isoformat()
    })


# -------------------------
# Helper: Risk Classification
# -------------------------
def classify_risk(risk_score):
    if risk_score > 50000:
        return "HIGH"
    elif risk_score > 20000:
        return "MEDIUM"
    else:
        return "LOW"


# -------------------------
# Analyze Endpoint with Filtering + ML
# -------------------------
@app.route('/analyze')
def analyze():
    client = bigquery.Client()

    try:
        state = request.args.get('state')

        query = """
        SELECT 
          provider_state,
          provider_name,
          average_total_payments,
          average_medicare_payments
        FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
        """

        job_config = None

        if state:
            query += " WHERE provider_state = @state"
            job_config = bigquery.QueryJobConfig(
                query_parameters=[
                    bigquery.ScalarQueryParameter("state", "STRING", state.upper())
                ]
            )

        query += " ORDER BY average_total_payments DESC LIMIT 100"

        query_job = client.query(query, job_config=job_config)

        results = []
        risk_scores = []

        for row in query_job:
            risk_score = float(row.average_total_payments - row.average_medicare_payments)
            risk_scores.append(risk_score)

            results.append({
                "state": row.provider_state,
                "hospital": row.provider_name,
                "total_payment": float(row.average_total_payments),
                "medicare_payment": float(row.average_medicare_payments),
                "risk_score": risk_score,
                "risk_level": classify_risk(risk_score)
            })

        # ML anomaly detection using Isolation Forest
        if len(risk_scores) >= 2:
            X = np.array(risk_scores).reshape(-1, 1)
            model = IsolationForest(contamination=0.10, random_state=42)
            labels = model.fit_predict(X)

            for i, label in enumerate(labels):
                results[i]["ml_anomaly"] = bool(label == -1)
        else:
            for item in results:
                item["ml_anomaly"] = False

        return jsonify({
            "status": "success",
            "count": len(results),
            "timestamp": datetime.now().isoformat(),
            "data": results
        })

    except Exception as e:
        return jsonify({
            "status": "error",
            "message": str(e)
        })


# -------------------------
# Summary Endpoint with Metrics
# -------------------------
@app.route('/summary')
def summary():
    client = bigquery.Client()

    try:
        query = """
        SELECT 
          provider_state,
          provider_name,
          average_total_payments,
          average_medicare_payments
        FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
        ORDER BY average_total_payments DESC
        LIMIT 500
        """

        query_job = client.query(query)

        risk_scores = []
        high = 0
        medium = 0
        low = 0

        for row in query_job:
            risk_score = float(row.average_total_payments - row.average_medicare_payments)
            risk_scores.append(risk_score)

            risk_level = classify_risk(risk_score)

            if risk_level == "HIGH":
                high += 1
            elif risk_level == "MEDIUM":
                medium += 1
            else:
                low += 1

        total = len(risk_scores)

        if total == 0:
            return jsonify({
                "status": "error",
                "message": "No records found"
            })

        return jsonify({
            "status": "success",
            "timestamp": datetime.now().isoformat(),
            "metrics": {
                "total_providers": total,
                "average_risk_score": float(np.mean(risk_scores)),
                "median_risk_score": float(np.median(risk_scores)),
                "standard_deviation": float(np.std(risk_scores)),
                "minimum_risk_score": float(np.min(risk_scores)),
                "maximum_risk_score": float(np.max(risk_scores)),
                "high_risk_percent": float((high / total) * 100),
                "distribution": {
                    "high": high,
                    "medium": medium,
                    "low": low
                }
            }
        })

    except Exception as e:
        return jsonify({
            "status": "error",
            "message": str(e)
        })


# -------------------------
# High Risk Providers with Rule-Based + ML Detection
# -------------------------
@app.route('/high-risk')
def high_risk():
    client = bigquery.Client()

    try:
        query = """
        SELECT 
          provider_state,
          provider_name,
          average_total_payments,
          average_medicare_payments,
          (average_total_payments - average_medicare_payments) AS risk_score
        FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
        ORDER BY risk_score DESC
        LIMIT 100
        """

        query_job = client.query(query)

        providers = []
        risk_scores = []

        for row in query_job:
            risk_score = float(row.risk_score)
            risk_scores.append(risk_score)

            providers.append({
                "state": row.provider_state,
                "hospital": row.provider_name,
                "total_payment": float(row.average_total_payments),
                "medicare_payment": float(row.average_medicare_payments),
                "risk_score": risk_score,
                "risk_level": classify_risk(risk_score)
            })

        # ML anomaly detection
        if len(risk_scores) >= 2:
            X = np.array(risk_scores).reshape(-1, 1)
            model = IsolationForest(contamination=0.10, random_state=42)
            labels = model.fit_predict(X)

            for i, label in enumerate(labels):
                providers[i]["ml_anomaly"] = bool(label == -1)
        else:
            for item in providers:
                item["ml_anomaly"] = False

        high_risk_providers = [
            provider for provider in providers
            if provider["risk_level"] == "HIGH" or provider["ml_anomaly"] is True
        ]

        return jsonify({
            "status": "success",
            "count": len(high_risk_providers),
            "timestamp": datetime.now().isoformat(),
            "high_risk_providers": high_risk_providers
        })

    except Exception as e:
        return jsonify({
            "status": "error",
            "message": str(e)
        })


# -------------------------
# Run App
# -------------------------
if __name__ == '__main__':
    print("RUNNING FINAL APP WITH METRICS + ML")
    app.run(host='0.0.0.0', port=8080, debug=True)
