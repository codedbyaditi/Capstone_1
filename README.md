# Substation Maintenance Assistant

An interactive, single-folder Flask application for substation equipment maintenance assistance. The app provides BERT-style semantic retrieval (Sentence-Transformers with TF‑IDF fallback), a responsive chat UI, quick actions, and a built-in knowledge base.

## Features
- Chat assistant for procedures, limits, troubleshooting, safety, and test equipment.
- Semantic retrieval via `sentence-transformers` if available; automatic TF‑IDF fallback (`scikit-learn`).
- Integrated UI served by Flask: avatars, gradient bubbles, confidence badges, alternatives chips.
- Knowledge Base modal with topics; suggestions and equipment buttons.
- Clear Chat and Export to JSON; theme toggle with persistence.

## Project Structure
```
substation_bot/
  run.py
  backend/
    requirements.txt
    app/
      main.py
      templates/
        index.html
      static/
        js/
          chat.js
          main.js
          ui.js
        styles/
          main.css
    models/
      bert_bot.py
      knowledge_base.py
```

## Prerequisites
- Windows with PowerShell 5.1 (or later)
- Python 3.9+ recommended

## Quick Start (Windows PowerShell)
```powershell
# 1) Create and activate a virtual environment
cd "E:\projects\Capstone project\substation_bot\backend"
python -m venv .venv
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\.venv\Scripts\Activate.ps1

# 2) Install dependencies
pip install -r requirements.txt

# 3) Run the app from the project root
cd "E:\projects\Capstone project\substation_bot"
python run.py
```
Open: `http://127.0.0.1:5000/`

### Minimal install (if heavy packages fail on Windows)
```powershell
pip install flask==2.3.2 flask-cors==4.0.0 scikit-learn>=1.3.0
```
This uses TF‑IDF fallback for retrieval while keeping the app functional.

## UI Overview
- Header: Knowledge Base, Help, Settings, Theme toggle.
- Sidebar:
  - Equipment Types: inserts typical queries (Transformer, Circuit Breaker, Surge Arrester, CT).
  - Quick Actions: red gradient buttons for common tasks (Oil BDV, Contact Resistance, Leakage Current, CT Ratio).
  - System Status + Suggestions.
- Chat Panel:
  - Send via button or Enter.
  - Avatars and animated bubbles; bot detail card with confidence, sources, and clickable alternatives.
  - Clear Chat resets to a welcome message.
  - Export Chat downloads `substation_chat_export.json`.

## API Endpoints
- `GET /` — serves the UI.
- `GET /health` — health check.
- `POST /chat` — chat with the assistant.
- `GET /knowledge-base` — list of KB topics.
- `GET /suggestions` — starter suggestions.

### `POST /chat` request
```json
{ "message": "How to perform transformer oil BDV test?" }
```

### `POST /chat` response (example)
```json
{
  "response": "Procedure: ... Acceptable Limits: ... Safety: ...",
  "confidence": 0.85,
  "intent": "procedure",
  "match": { "equipment": "Transformer", "category": "Testing" },
  "sources": ["IEC 60156"],
  "alternatives": [
    { "query": "Troubleshooting overheating transformer" },
    { "query": "Leakage current measurement" }
  ]
}
```

## Configuration & Content
- Knowledge Base entries: `backend/models/knowledge_base.py`.
- Bot logic & retrieval: `backend/models/bert_bot.py`.
- Flask API & routes: `backend/app/main.py`.
- UI: `backend/app/templates/index.html`, `backend/app/static/js/*`, `backend/app/static/styles/main.css`.

## Troubleshooting
- Run from the project root: `substation_bot`. If you see `exit code 1`, you may be in the wrong directory.
- On Windows, large packages (e.g., `torch`, `faiss-cpu`) can be slow or fail; use the minimal install above.
- After code changes, hard-refresh the browser to reload static assets.
- Theme state persists in `localStorage`. If visual glitches occur, toggle theme and refresh.

## Development Tips
- To add topics, extend `KB_ENTRIES` in `knowledge_base.py` with `equipment`, `category`, `query`, `procedure`, `acceptable_limits`, `safety`, and `sources`.
- Improve accuracy: install `sentence-transformers` and choose a stronger model (e.g., `all-MiniLM-L6-v2`). You can also add hybrid retrieval with BM25 or a reranker.

## License
Internal/educational use unless specified otherwise.
