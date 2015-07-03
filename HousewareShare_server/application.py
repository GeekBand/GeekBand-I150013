#coding:utf-8

from init_db import db

def create_application(app):
    db.init_app(app)
    return app


