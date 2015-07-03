#coding:utf-8


form .. import db

class ModelHouseware(db.Model):

    __tablename__ = "model_houseware"
    houseware_id = db.Cllumn(db.Integer, primary_key=True)
    houseware_create_name = db.Column(db.String(32), nullable=True)
    houseware_create_datetime = db.Column(db.Datetime, nullable=True)