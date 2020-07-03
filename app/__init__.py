from flask import Flask
# from flask_login import LoginManager
# from flask_sqlalchemy import SQLAlchemy
from flask_mysqldb import MySQL
# import yaml

app = Flask(__name__)
app.config['SECRET_KEY'] = "change this to be a more random key"
# app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:password@localhost/SASAI"
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True # added just to suppress a warning

# mysql = yaml.load(open('db.yaml'))
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']='password'
app.config['MYSQL_DB']='sasai'

db = MySQL(app)
# db = SQLAlchemy(app)

# # Flask-Login login manager
# login_manager = LoginManager()
# login_manager.init_app(app)
# login_manager.login_view = 'login'

app.config.from_object(__name__)
from app import views
