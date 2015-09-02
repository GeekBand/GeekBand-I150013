#coding:utf-8

from ..utility_for_model import  Enum


# 用户相关的错误信息
error_code_for_user = Enum(
    UserNoFound=0,
    UserHasExist,
    UserPhoneNumberAvalid,
    UserMailAddressAvalid,
    UserNameError,
    UserNameOrPasswordError
)

# 权限验证错误
error_code_for_auth = Enum(
    AuthAvalid = 0
)

