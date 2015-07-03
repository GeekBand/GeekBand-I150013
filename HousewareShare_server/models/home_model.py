#coding:utf-8

from models import db

class ModelHome(db.Model):

    __tablename__ = "model_home"
    home_name = db.Column(db.String(32), primary_key=True)
    home_create_datetime = db.Column(db.DateTime, nullable=False)
    home_create_name = db.Column(db.DateTime, nullable=False)