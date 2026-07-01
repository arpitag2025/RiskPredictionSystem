#  Risk Prediction System

A cloud-native healthcare analytics platform built on Google Cloud Platform that predicts patient health risk using machine learning. This project demonstrates an end-to-end MLOps workflow including cloud infrastructure provisioning, data processing, model deployment, and scalable API services.

---

## Overview

Healthcare organizations generate massive amounts of patient data, but transforming that data into actionable insights requires scalable infrastructure and machine learning.

This project provides a cloud-based solution capable of:

- Predicting patient health risk using machine learning
- Processing healthcare datasets on Google Cloud
- Serving predictions through REST APIs
- Deploying infrastructure using Infrastructure as Code (Terraform)
- Monitoring cloud resources for reliability and scalability

The project was developed as part of a Cloud Computing course to demonstrate production-style cloud architecture and machine learning deployment.

---

## Architecture

Google Cloud Platform

- Cloud Run
- Vertex AI
- Cloud Storage
- BigQuery
- Cloud Logging
- Docker
- Terraform

Machine Learning

- Python
- Scikit-learn
- Pandas
- NumPy

Development

- Git
- GitHub
- REST APIs

---

## Features

- Cloud-native healthcare analytics pipeline
- Machine learning risk prediction
- Infrastructure as Code using Terraform
- Docker containerization
- REST API deployment with Cloud Run
- Cloud monitoring and logging
- Scalable cloud architecture
- Automated infrastructure provisioning

---

## Technologies Used

### Languages

- Python

### Cloud

- Google Cloud Platform (GCP)
- Vertex AI
- Cloud Run
- BigQuery
- Cloud Storage
- Cloud Logging

### DevOps

- Docker
- Terraform
- Git
- GitHub

### Machine Learning

- Scikit-learn
- Pandas
- NumPy

---

## Repository Structure

```
RiskPredictionSystem/
│
├── backend/
├── frontend/
├── terraform/
├── models/
├── notebooks/
├── docs/
└── README.md
```

---

## Deployment Status

The application is **not currently deployed**.

This project was originally deployed on Google Cloud during development. After completing the project, the cloud infrastructure was intentionally taken offline to avoid ongoing charges associated with Google Cloud services such as Cloud Run, Vertex AI, Cloud Storage, and BigQuery. Terraform configuration and deployment scripts remain in the repository, allowing the entire environment to be recreated with a valid Google Cloud account and credentials. Running cloud resources continuously can incur costs, so the infrastructure was shut down after the project was completed. :contentReference[oaicite:0]{index=0}

---

## Future Improvements

- CI/CD with GitHub Actions
- User authentication
- Live healthcare dashboards
- Expanded prediction models
- Model retraining pipeline
- Explainable AI (SHAP)
- Kubernetes deployment
- Real-time streaming data

---

## Author

**Arpita Godbole**

Computer Science Graduate  
Minor in Data Science  
California State University San Marcos

LinkedIn:
https://www.linkedin.com/in/arpitagodbole04

---

## License

This project was created for educational purposes.
