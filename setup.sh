#!/bin/bash

# Substation Maintenance Chatbot - Setup Script

echo "🔧 Setting up Substation Maintenance Chatbot..."
echo "================================================"

# Check Python version
python_version=$(python --version 2>&1)
if [[ $python_version == *"Python 3."* ]]; then
    echo "✅ Python found: $python_version"
else
    echo "❌ Python 3.8+ required. Please install Python 3.8 or higher."
    exit 1
fi

# Create virtual environment
echo "📦 Creating virtual environment..."
cd backend
python -m venv venv

# Activate virtual environment
echo "🔄 Activating virtual environment..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate
else
    source venv/bin/activate
fi

# Install Python dependencies
echo "📥 Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Download NLTK data
echo "📚 Downloading NLTK data..."
python -c "
import nltk
import ssl
try:
    _create_unverified_https_context = ssl._create_unverified_context
except AttributeError:
    pass
else:
    ssl._create_default_https_context = _create_unverified_https_context
nltk.download('punkt')
print('NLTK data downloaded successfully')
"

# Test BERT model loading
echo "🤖 Testing BERT model loading..."
python -c "
from transformers import AutoTokenizer, AutoModel
print('Loading BERT model...')
tokenizer = AutoTokenizer.from_pretrained('bert-base-uncased')
model = AutoModel.from_pretrained('bert-base-uncased')
print('✅ BERT model loaded successfully')
"

# Setup frontend (if Node.js is available)
echo "🌐 Setting up frontend..."
cd ../frontend

if command -v npm &> /dev/null; then
    echo "📦 Installing Node.js dependencies..."
    npm install
    echo "✅ Frontend setup complete"
else
    echo "⚠️  Node.js not found. You can still use the frontend by opening index.html directly."
fi

echo ""
echo "🎉 Setup complete!"
echo "================================================"
echo ""
echo "To start the application:"
echo ""
echo "1. Backend (Terminal 1):"
echo "   cd backend"
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    echo "   venv\\Scripts\\activate"
else
    echo "   source venv/bin/activate"
fi
echo "   cd app"
echo "   python main.py"
echo ""
echo "2. Frontend (Terminal 2):"
echo "   cd frontend"
if command -v npm &> /dev/null; then
    echo "   npm start"
else
    echo "   Open index.html in your web browser"
fi
echo ""
echo "Then open http://localhost:3000 in your browser"
echo ""
echo "Happy maintaining! 🔧⚡"