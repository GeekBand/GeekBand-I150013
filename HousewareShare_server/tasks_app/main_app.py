#coding:utf-8

import sys
from flask import  Flask
import os
from application import create_application
from celery import Celery

sys.path.append(os.getcwd() + "/../")

app = Flask(__name__)
app.config["CELERY_BROKER_URL"] = "redis://localhost:6379/0"
app.config["CELERY_RESULT_BACKEND"] = "redis://localhost:6379/0"

create_application(app)
celery = Celery(app.name, broker=app.config["CELERY_BROKER_URL"])
celery.config.update(app.config)


# def init_celery(app):
#     celery = Celery(app.import_name, broker=app.config["CELERY_BROKER_URL"])
#     celery.config.update(app.config)
#     TaskBase = celery.Task
#     class ContextTask(TaskBase):
#         abstract = True
#         def __call__(self, *args, **kwargs):
#             with app.app_context():
#                 return TaskBase.__call__(self, args, kwargs)
#     celery.Task = ContextTask
#     return celery

if __name__ == "__main__":
    app.run(host="localhost", port=6000, debug=True)





