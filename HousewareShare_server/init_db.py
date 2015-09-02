#coding:utf-8

import sqlalchemy
print dir(sqlalchemy)
from flask.ext.sqlalchemy import  SQLAlchemy

db = SQLAlchemy()

__all__ = ['db']