# this is where the decisions are made

from app import app, db

class resultDict():

    

    def deansearch(params):
        faculty = params["Faculty"]
        #create cursor
        cur = db.connection.cursor()
        queryresponse = cur.execute("SELECT dean_firstname,dean_lastname FROM faculty_info WHERE faculty_name = %s",[faculty])

        if queryresponse > 0:
            queryDetails = cur.fetchone()
            
            return "The current dean of the faculty of "+faculty+" "+queryDetails[0]+" "+queryDetails[1]

    def credit_check(studentID):
        cur = db.connection
        credit = cur.execute()

    dispatcher = {'DeanSearch': deansearch}