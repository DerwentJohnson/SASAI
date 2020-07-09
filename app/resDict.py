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
            cur.close()
            return "The current dean of the faculty of "+faculty+" "+queryDetails[0]+" "+queryDetails[1]

    def credit_check(studentID):
        cur = db.connection.cursor()
        credit = cur.execute("student_credits(620088317)")
        if credit > 0:
            queryDetails = cur.fetchone()
            return "You currently have "+ queryDetails+" credits."
        return "I'm sorry, I could not access this information."

    def credits_for_degree(params):
        print(params)
        cur = db.connection.cursor()
        credit = cur.execute("")
        return"OK"

    def getHOD(params):
        print(params)
        cur = db.connection.cursor()
        query = cur.execute()
        if query > 0:
            queryDetails = cur.fetchone()
            return queryDetails

    def getLecturer(params):
        print(params)
        cur = db.connection.cursor()
        query = cur.execute("")
        if query > 0:
            queryDetails = cur.fetchone()
            return queryDetails

    dispatcher = {'DeanSearch': deansearch,'CreditsRequiredDegree':credits_for_degree,'CreditCheck':credit_check,'HOD':getHOD,'Lecturer':getLecturer}