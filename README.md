# 🚀 SmartHire X — AI Career Readiness & Placement Intelligence Platform

[![Build Status](https://github.com/BallariVinuthna/Smart_Hire/actions/workflows/deploy.yml/badge.svg)](https://github.com/BallariVinuthna/Smart_Hire/actions)
[![Java 17](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.3-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![React](https://img.shields.io/badge/React-19-blue.svg)](https://react.dev/)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED.svg)](https://www.docker.com/)

**SmartHire X** is an enterprise-grade AI-powered career readiness and placement intelligence platform. It bridges the gap between academic education and industry expectations by providing AI interview simulations, ATS resume analysis, dynamic skill gap roadmaps, and recruiter placement dashboards.

---

## 🏗️ Architecture & Technology Stack

- **Frontend**: React 19, Vite, Framer Motion, Lucide Icons, Canvas Confetti
- **Backend**: Java 17, Spring Boot 3.2.3, Spring Data JPA, Spring Security with JWT
- **AI & RAG Engine**: Google Gemini API, Spring AI, Pinecone Vector Database
- **Database**: H2 (embedded, zero-configuration) or MySQL / PostgreSQL
- **Containerization & Deployment**: Docker (multi-stage build), Docker Compose, Render Blueprint

---

## ⚙️ Environment Variables

Create a `.env` file in the root directory (based on `.env.example`):

| Variable | Description | Default |
|---|---|---|
| `PORT` / `SERVER_PORT` | Application HTTP Port | `8080` |
| `AI_PROVIDER` | AI engine to use (`gemini`, `heuristic`, `openai`) | `gemini` |
| `GEMINI_API_KEY` | Google Gemini API Key from Google AI Studio | Required for AI features |
| `PINECONE_API_KEY` | Pinecone Vector Database API Key | Required for RAG vector search |
| `PINECONE_INDEX_NAME` | Pinecone index name | `ai-rag-documents` |
| `PINECONE_ENVIRONMENT`| Pinecone environment region | `us-east-1` |
| `PINECONE_NAMESPACE`  | Pinecone namespace | `default` |
| `JWT_SECRET`          | Secret key for signing JWT tokens | Default generated key |
| `GITHUB_CLIENT_ID`    | (Optional) GitHub OAuth App Client ID | - |
| `GITHUB_CLIENT_SECRET`| (Optional) GitHub OAuth App Client Secret | - |
| `MYSQL_URL`           | (Optional) MySQL connection URL | Defaults to embedded H2 |

---

## 🐳 Quick Start with Docker & Docker Compose

The easiest way to run the entire unified application (Frontend + Backend in a single container):

### Using Docker Compose
```bash
# 1. Clone the repository
git clone https://github.com/BallariVinuthna/Smart_Hire.git
cd Smart_Hire

# 2. Copy the environment file and set your keys
cp .env.example .env

# 3. Build and launch
docker compose up --build
```
Access the application at `http://localhost:8080`.

### Using Standalone Docker
```bash
# Build the Docker image
docker build -t smarthire .

# Run container with environment variables
docker run -p 8080:8080 \
  -e GEMINI_API_KEY="your_gemini_api_key" \
  -e PINECONE_API_KEY="your_pinecone_api_key" \
  smarthire
```

---

## ☁️ Cloud Deployment

### Deploying to Render
1. Fork or push to your GitHub repository.
2. Sign in to [Render](https://render.com/).
3. Click **New +** > **Blueprint** (or **Web Service** with Docker).
4. Connect this repository:
   - Render automatically reads [`render.yaml`](render.yaml) and [`Dockerfile`](Dockerfile).
5. In the Render Environment tab, add your:
   - `GEMINI_API_KEY`
   - `PINECONE_API_KEY`
6. Deploy! Render will build the React frontend, package the Spring Boot JAR, and start the service with automatic health checks on `/health`.

### Deploying to Railway / Koyeb / Fly.io / AWS
This repository includes a multi-stage `Dockerfile` that packages both frontend and backend into an executable Spring Boot service listening on `${PORT:-8080}`. Any container-compatible platform can deploy it directly.

---

## 💻 Local Development Setup

If you wish to develop frontend and backend separately:

### 1. Run Backend
```bash
cd smarthire-backend
mvn clean spring-boot:run
```
The backend API starts on `http://localhost:8080`.
- Health endpoint: `http://localhost:8080/health`
- H2 Database Console: `http://localhost:8080/h2-console`

### 2. Run Frontend
```bash
cd smarthire-frontend
npm install
npm run dev
```
The Vite development server runs on `http://localhost:5173` and proxies `/api` calls directly to `http://localhost:8080`.

---

## 🔍 Health & Verification
Once deployed, check system status:
```bash
curl http://localhost:8080/health
```
Expected response:
```json
{
  "status": "UP",
  "service": "SmartHire X Backend",
  "timestamp": "2026-10-03T22:10:43"
}
```

---

## 📄 License
This project is open-source under the MIT License.
