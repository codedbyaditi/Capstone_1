@echo off
echo Starting Substation Maintenance Chatbot Backend...

cd /d "E:\projects\Capstone project\substation-maintenance-chatbot\backend"
call venv\Scripts\activate.bat
echo Virtual environment activated

cd app
echo Starting Flask server...
python main.py