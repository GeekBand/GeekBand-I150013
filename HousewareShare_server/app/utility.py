#coding:utf-8


from flask import jsonify


def J(_m, _d, _c, **_kwargs):
    _args = _kwargs or {}
    _kwargs["msg"] = _m
    _kwargs["code"] = _c
    _kwargs["data"] = _d or {}

    return jsonify(_kwargs)


def SJ(_m, _d=None, _c="0", **_kwargs):
    return  J(_m, _c, **_kwargs)


def FJ(_m, _d=None, _c="-1", **_kwargs):
    return  J(_m, _c, **_kwargs)





