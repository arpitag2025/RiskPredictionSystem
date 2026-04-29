from flask import Flask, jsonify, request
from google.cloud import bigquery
from datetime import datetime
from flask import render_template

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
# Analyze Endpoint (with filtering)
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

        # Add filtering
        if state:
            query += f" WHERE provider_state = '{state}'"

        query += " ORDER BY average_total_payments DESC LIMIT 100"

        query_job = client.query(query)

        results = []
        for row in query_job:
            risk_score = row.average_total_payments - row.average_medicare_payments

            # classify risk level
            if risk_score > 50000:
                risk_level = "HIGH"
            elif risk_score > 20000:
                risk_level = "MEDIUM"
            else:
                risk_level = "LOW"

            results.append({
                "state": row.provider_state,
                "hospital": row.provider_name,
                "total_payment": float(row.average_total_payments),
                "medicare_payment": float(row.average_medicare_payments),
                "risk_score": float(risk_score),
                "risk_level": risk_level
            })

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
    print(len(results))

# -------------------------
# Summary Endpoint
# -------------------------
@app.route('/summary')
def summary():
    client = bigquery.Client()

    try:
        query = """
        SELECT 
          provider_state,
          AVG(average_total_payments) AS avg_payment
        FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
        GROUP BY provider_state
        ORDER BY avg_payment DESC
        LIMIT 100
        """

        results = client.query(query)

        return jsonify({
            "status": "success",
            "timestamp": datetime.now().isoformat(),
            "summary": [dict(row) for row in results]
        })

    except Exception as e:
        return jsonify({
            "status": "error",
            "message": str(e)
        })

# -------------------------
# High Risk Providers
# -------------------------
@app.route('/high-risk')
def high_risk():
    client = bigquery.Client()

    try:
        query = """
        SELECT 
          provider_name,
          (average_total_payments - average_medicare_payments) AS risk_score
        FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
        ORDER BY risk_score DESC
        LIMIT 100
        """

        results = client.query(query)

        return jsonify({
            "status": "success",
            "timestamp": datetime.now().isoformat(),
            "high_risk_providers": [dict(row) for row in results]
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
    print("RUNNING FINAL APP")
    app.run(host='0.0.0.0', port=8080, debug=True)
