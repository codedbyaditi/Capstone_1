import sys, os

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
os.chdir(ROOT_DIR)  # ensure relative paths inside backend code resolve
sys.path.insert(0, ROOT_DIR)

from backend.app.main import app

if __name__ == '__main__':
    print('Starting integrated Substation Maintenance Assistant...')
    print(f'Working directory: {os.getcwd()}')
    app.run(host='127.0.0.1', port=5000, debug=False)
