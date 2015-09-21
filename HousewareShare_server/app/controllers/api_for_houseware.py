#coding:utf-8

from flask import Blueprint, request, jsonify
from ..utility import FJ, SJ

api_for_houseware = Blueprint("api_for_houseware", __name__, url_prefix="/api/houseware/")