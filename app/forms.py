from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import InputRequired, Regexp


class LoginForm(FlaskForm):
    userid = StringField('User ID', validators=[InputRequired(), Regexp('^62[0-9]{7}$', message= "User ID is the same as student ID.") ])
    password = PasswordField('Password', validators=[InputRequired()])


