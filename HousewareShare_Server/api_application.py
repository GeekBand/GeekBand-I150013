#coding:utf-8

from flask import  Flask
from app.main_app import create_application

app = Flask(__name__)
create_application(app)


if __name__ == "__main__":
    app.run(host="localhost", port=5000, debug=True)