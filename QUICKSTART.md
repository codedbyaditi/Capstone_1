# Quick Start Guide - Substation Maintenance Chatbot

## 🚀 Quick Setup (Windows)

### Option 1: Automated Setup
1. Open PowerShell as Administrator
2. Navigate to the project directory
3. Run: `.\setup.bat`
4. Follow the prompts

### Option 2: Manual Setup

#### Backend Setup
```powershell
# Navigate to backend
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Test the setup
python test_bot.py

# Start the server
cd app
python main.py
```

#### Frontend Setup
```powershell
# Navigate to frontend (new terminal)
cd frontend

# Option A: With Node.js
npm install
npm start

# Option B: Direct browser
# Simply open index.html in your web browser
```

## 🧪 Testing the Installation

1. **Test Backend**: Run `python backend/test_bot.py`
2. **Test API**: Visit `http://127.0.0.1:5000/health`
3. **Test Frontend**: Open `http://localhost:3000` or `frontend/index.html`

## 💬 Sample Queries to Try

### Procedures
- "How to perform transformer oil BDV test?"
- "Steps for circuit breaker contact resistance measurement"
- "Surge arrester leakage current test procedure"

### Troubleshooting
- "What to do if transformer oil temperature is high?"
- "Circuit breaker timing issues"
- "High leakage current in surge arrester"

### Safety & Standards
- "Safety guidelines for transformer testing"
- "IEC standards for circuit breaker testing"
- "Required PPE for substation maintenance"

## 🔧 System Requirements

- **Python**: 3.8 or higher
- **RAM**: Minimum 4GB (8GB recommended)
- **Disk Space**: 2GB for models and dependencies
- **Browser**: Chrome, Firefox, Safari, Edge (latest versions)

## 🆘 Troubleshooting

### Common Issues

1. **"Import Error: No module named torch"**
   ```powershell
   pip install torch torchvision torchaudio
   ```

2. **"BERT model download failed"**
   - Check internet connection
   - Ensure sufficient disk space (1GB+)
   - Try running with administrator privileges

3. **"Frontend not loading"**
   - Verify backend is running on port 5000
   - Check if any antivirus/firewall is blocking
   - Try opening index.html directly

4. **"Voice input not working"**
   - Use HTTPS or localhost
   - Grant microphone permissions
   - Ensure browser supports Web Speech API

### Getting Help

1. Check the main README.md for detailed documentation
2. Run the test script: `python backend/test_bot.py`
3. Check backend logs in the console
4. Verify all dependencies are installed correctly

## 🎯 Key Features to Explore

1. **Equipment Types**: Click on different equipment in the sidebar
2. **Quick Actions**: Use preset buttons for common queries
3. **Voice Input**: Click the microphone icon (if available)
4. **Knowledge Base**: Browse available procedures and standards
5. **Export Chat**: Download your conversation history
6. **Dark Mode**: Toggle between light and dark themes

## 📱 Mobile Usage

The interface is responsive and works on mobile devices:
- Touch-friendly buttons and inputs
- Collapsible sidebar for small screens
- Optimized text sizing and spacing

## 🔒 Security Notes

- The chatbot runs locally on your machine
- No data is sent to external servers (except for initial model downloads)
- All conversations stay on your local system
- Safe for confidential maintenance procedures

---

**Ready to start?** Run the setup script and begin chatting about substation maintenance! 🔧⚡