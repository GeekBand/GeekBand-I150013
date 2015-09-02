#coding:utf-8


def J(_m, _c="0", **_kwargs):
    _args = _kwargs or {}
    _kwargs["msg"] = _m
    _kwargs["code"] = _c

    return _kwargs


if __name__ == "__main__":
    a = {"ddd":2321, "cccc":5555, "5555":"5555", 9999:"ffffs"}
    print J("test", a)
