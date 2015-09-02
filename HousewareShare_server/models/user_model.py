#coding:utf-8
from . import db



class ModelUser(db.Model):

    __tablename__ = "model_user"
    user_name = db.Column(db.String(32), primary_key=True)
    user_local_name = db.Column(db.String(128), nullable=True)
    user_phone_number = db.Column(db.String(24), nullable=True)
    user_phone_number_prefix = db.Column(db.String(8), nullable=True)
    user_pic_name = db.Column(db.String(32), nullable=True)
    user_is_active = db.Column(db.Boolean, default=False)
    user_password = db.Column(db.String(40), nullable=False)
    user_gender = db.Column(db.String(8), nullable=False)


    def auth_password(self):
        return self.user_password

    def create_password(self):
        return  self.user_password[::-2]

    def exist(self):
        return ModelUser.query.filter(ModelUser.user_name==self.user_name).first()




class ModelAccess(db.Model):

    __tablename__ = "model_access"

    access_id = db.Column(db.Integer, primary_key=True)
    access_master_type = db.Column(db.String(32))
    access_master_id = db.Column(db.String(32))
    access_action_type = db.Column(db.String(32))
    access_action_id = db.Column(db.String(32))
    access_type = db.Column(db.String(32))

class ModelRole(db.Model):

    __tablename__ = "model_role"
    role_name = db.Column(db.String(32), primary_key=True)
    role_describe = db.Column(db.String(128), nullable=True)
    role_create_datetime = db.Column(db.DateTime)
    role_create_user_name = db.Column(db.String(32))

class ModelRoleUser(db.Model):
    __tablename__ = "model_role_user"

    ru_role_name = db.Column(db.String(32), primary_key=True)
    ru_user_name = db.Column(db.String(32), primary_key=True)

    ru_create_user_name = db.Column(db.String(32))
    ru_create_datetime = db.Column(db.DateTime)



class ModelSystemMenu(db.Model):
    __tablename__ = "model_system_menu"
    menu_name = db.Column(db.String(32), primary_key=True)
    menu_local_name = db.Column(db.String(32))
    menu_url = db.Column(db.String(128))
    menu_parent_name = db.Column(db.String(32))
    menu_order_number = db.Column(db.Integer)
    menu_icon_name = db.Column(db.String(128))



class ModelSystemButton(db.Model):
    __tablename__ = "model_system_button"
    button_name = db.Column(db.String(32), primary_key=True)
    button_local_name = db.Column(db.String(32))
    button_url = db.Column(db.String(128))
