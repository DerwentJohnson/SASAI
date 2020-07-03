from . import db


class Student(db.Model):

    __tablename__ = 'student'

    id = db.Column(db.String(9), primary_key=True)
    password = db.Column(db.String(255), nullable=False)

    def is_authenticated(self):
        return True

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    # def get_id(self):
    #     try:
    #         return unicode(self.id)  # python 2 support
    #     except NameError:
    #         return str(self.id)  # python 3 support



    def __repr__(self):
        return '<User %r>' % (self.userid)
