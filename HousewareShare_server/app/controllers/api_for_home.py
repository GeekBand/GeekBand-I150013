#coding:utf-8

from flask import Blueprint, request, jsonify
from ..models.home_model import  HomeModel
from ..utiltiy import  SJ, FJ

api_for_home = Blueprint("api_for_home", __name__, url_prefix="/home")


@api_for_home.route("/home", methods=["POST"])
def add_new_home():
    pass


@api_for_home.route("/home/<string:_home_name>", methods=["GET"])
def get_home_info(_home_name):
    pass


@api_for_home("/home/<string:_home_name>", methods=["PUT"])
def edit_home_info(_home_name):
    pass


@api_for_home("/home/")
def invent_user_join_home():
    pass