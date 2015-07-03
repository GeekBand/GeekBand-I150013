#coding:utf-8

import sys
from flask import  Flask
import os
from application import create_application

sys.path.append(os.getcwd() + "/../")

app = Flask(__name__)

create_application(app)

if __name__ == "__main__":
    app.run(host="localhost", port=5000, debug=True)





