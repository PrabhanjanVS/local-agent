# Retail Pitch Generator with Gemini-2.0
A location-based retail shop idea generator, powered by Google's Gemini-2.0 model, deployed via GitHub Actions and Docker.

## 🚀  Overview
This app suggests tailored retail shop ideas (name, concept, real-time insights) for a given location using Gemini-2.0. The deployment pipeline automates testing, containerization, and deployment to an EC2 instance.

## ⚙️ Tech Stack
Backend: Python (Flask/FastAPI) + Google AI SDK (Gemini-2.0)

Infra: Docker, GitHub Actions, AWS EC2

# Key Components:
.github/workflows/deploy.yml:

Triggers on push to main.

Runs pytest/linters.

Builds/pushes Docker image (to ECR/Docker Hub).

SSH into EC2 to deploy the updated container.

## 📦 Pipeline Architecture  
graph LR
  A[Code Push] --> B[GitHub Actions]
  B --> C{Lint/Test}
  C --> D[Build Docker Image]
  D --> E[Push to Registry]
  E --> F[Deploy to EC2]
  F --> G[Run Container]


# Challenges & Improvements
## Challenges Faced:
EC2 Permission Issues: Fixed by adding the GitHub runner’s SSH key to EC2’s authorized_keys.

Docker Cache: Optimized with multi-stage builds to reduce image size.

# Future Improvements:
Add Kubernetes (EKS) for scaling.

Implement Prometheus for monitoring resource usage.

Blue-green deployments to minimize downtime.