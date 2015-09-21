#coding:utf-8

from models import db

def register_database(app):
    app.config["SQLALCHEMY_DATABASE_URI"] = ""

    db.init_app(app)
    db.app = app

    # db.create_all(bind=None)
    return app
