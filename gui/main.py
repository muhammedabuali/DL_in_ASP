from flask import Flask,request,session,redirect,render_template,url_for
from flask_cors import CORS
from asp import run_query

app = Flask(__name__)
CORS(app)

@app.route('/')
def welcome():
    return 'Hello, World!'

@app.route('/post', methods=['POST'])
def request_data():
    config = request.get_json()
    print(config)
    conceptFeatures = config["conceptFeatures"]
    roleFeatures = config["roleFeatures"]
    tboxType = config["tboxType"]
    res = run_query(config)
    return res
