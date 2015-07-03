#coding:utf-8

# import sys
from flask import  Flask, request, g
# import os
import logging
from application import register_database

# sys.path.append(os.getcwd() + "/../")

def register_blueprints(app):
    from .controllers.api_for_user import api_for_user
    from .controllers.api_for_home import api_for_home
    from .controllers.api_for_houseware import api_for_houseware

    [app.register_blueprint(_) for _ in [api_for_home, api_for_houseware, api_for_user]]

def register_hooks(app):

    @app.before_request
    def before_request():
        pass

    @app.after_request
    def after_request():
        pass


def register_logger(app):
    if app.debug:
        return
    handler = logging.StreamHeandler()
    handler.setLevel(logging.ERROR)
    app.logger.addHandler(handler)


def create_application(app):
    register_database(app)

    register_blueprints(app)
    register_hooks(app)
    return app







