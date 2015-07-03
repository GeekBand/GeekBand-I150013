#coding:utf-8

from flask import  Blueprint, jsonify, request
from ..utility import SJ, FJ

api_for_user = Blueprint("user", __name__, url_prefix="/user/")


@api_for_user.route("/user", methods=["POST"])
def add_new_user():

    new_user = ModelUser(request.post)
    if not user_user:
        return FJ("传递的用户信息错误!")

    avalid_info = new_user.is_avalid_user()
    if not avalid_info[0]:
        return FJ(avalid_info[1])

    _user = db.session.query(ModelUser).filter(ModelUser.user_name == new_user.user_name).first()
    if _user:
        return FJ("当前用户已经存在!")

    #TODO:邮件激活
    db.session.add(new_user)
    db.session.commit()

    return SJ("注册用户成功")



@api_for_user.route("/user/<string:_user_name>", methods=["GET"])
def get_user(_user_name):
    user = db.session.query(ModelUser).filter(ModelUser.user_name == _user_name).first()

    if not user:
        return FJ("找不到当前用户!", 404)

    return SJ("获取用户信息成功")


@api_for_user.route("/user/<string:_user_name>", methods=["POST"])
def edit_user(_user_name):
    user = db.session.query(ModelUser).filter(ModelUser.user_name == _user_name).first()

    if not user:
        return FJ("找不到当前用户!", 404)

    user.update(request.json)
    db.session.add(user)

    return  SJ("修改用户信息成功!")


