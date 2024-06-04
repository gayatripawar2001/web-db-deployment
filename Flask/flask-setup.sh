#!/bin/bash
sudo apt update
sudo apt install -y python3 python3-venv
mkdir flaskapp_gunicorn
cd flaskapp_gunicorn
python3 -m venv venv_gunicorn
source venv_gunicorn/bin/activate
pip install flask 
pip install psycopg2
cat <<EOF > app.py
from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello():
    return 'Hello world!!!'
if __name__ == '__main__':
    app.run()
EOF