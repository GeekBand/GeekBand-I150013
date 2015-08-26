#encoding:utf-8

from flask import  Flask, jsonify, request

app = Flask(__name__)


@app.route("/index", methods=["GET"])
def index():
    return jsonify({"msg":"这是测试服务器脚本.", "code":0})


@app.route("/method/code/<int:code>/msg/<string:msg>", methods=["GET"])
def test_get_method(code, msg):
    return jsonify({"msg":msg, "args": request.args, "code":code})

@app.route("/method/code/<int:code>/msg/<string:msg>", methods=["POST"])
def test_post_method(code, msg):
    return jsonify({"msg":msg, "args":request.args, "post":request.json, "code":code})

@app.route("/method/code/<int:code>/msg/<string:msg>", methods=["PUT"])
def test_put_method(code, msg):
    return jsonify({"msg":msg,  "args":request.args, "post":request.json, "code":code})

@app.route("/method/code/<int:code>/msg/<string:msg>", methods=["DELETE"])
def test_delete_method(code, msg):
    return jsonify({"msg":msg,  "args":request.args, "code":code})

if __name__ == "__main__":
    app.run(host="localhost", port=5000)