@echo off
REM Substation Maintenance Chatbot - Windows Setup Script

echo 🔧 Setting up Substation Maintenance Chatbot...
echo ================================================

REM Check Python version
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python not found. Please install Python 3.8 or higher.
    pause
    exit /b 1
)

echo ✅ Python found
python --version

REM Create virtual environment
echo 📦 Creating virtual environment...
cd backend
python -m venv venv

REM Activate virtual environment
echo 🔄 Activating virtual environment...
call venv\Scripts\activate

REM Install Python dependencies
echo 📥 Installing Python dependencies...
python -m pip install --upgrade pip
pip install -r requirements.txt

REM Download NLTK data
echo 📚 Downloading NLTK data...
python -c "import nltk; nltk.download('punkt'); print('NLTK data downloaded successfully')"

REM Test BERT model loading
echo 🤖 Testing BERT model loading...
python -c "from transformers import AutoTokenizer, AutoModel; print('Loading BERT model...'); tokenizer = AutoTokenizer.from_pretrained('bert-base-uncased'); model = AutoModel.from_pretrained('bert-base-uncased'); print('✅ BERT model loaded successfully')"

REM Setup frontend
echo 🌐 Setting up frontend...
cd ..\frontend

where npm >nul 2>&1
if %errorlevel% equ 0 (
    echo 📦 Installing Node.js dependencies...
    npm install
    echo ✅ Frontend setup complete
) else (
    echo ⚠️  Node.js not found. You can still use the frontend by opening index.html directly.
)

echo.
echo 🎉 Setup complete!
echo ================================================
echo.
echo To start the application:
echo.
echo 1. Backend (Command Prompt 1):
echo    cd backend
echo    venv\Scripts\activate
echo    cd app
echo    python main.py
echo.
echo 2. Frontend (Command Prompt 2):
echo    cd frontend
where npm >nul 2>&1
if %errorlevel% equ 0 (
    echo    npm start
) else (
    echo    Open index.html in your web browser
)
echo.
echo Then open http://localhost:3000 in your browser
echo.
echo Happy maintaining! 🔧⚡
pause