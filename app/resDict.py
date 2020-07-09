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
        #Gives a credit breakdown of given course
        degree = params['any']
        cur = db.connection.cursor()
        credit = cur.execute("SELECT total_credits,incourse_credits,foundation_credits,level_1_credits,advanced_credits from degree_info where degree_name LIKE %s",["%"+degree+"%"])
        if credit > 0 :
            queryDetails = cur.fetchone()
            cur.close()
            print(queryDetails)
            return"You need "+str(queryDetails[0])+" to qualify for a "+degree+"\n You will need "+queryDetails[1]+" in course credits, "+queryDetails[2]+" foundation credits, "+queryDetails[3]+" level 1 credits and "+queryDetails[4]+" advanced credits."
        return "I apologize but I am unable to find the degree name: "+degree

    # Returns the name of the head of the given department
    def getHOD(params):
        department = params['any']
        cur = db.connection.cursor()
        query = cur.execute("select lecturer.lecturer_firstname, lecturer.lecturer_lastname, lecturer.prefix from lecturer join department_lecturers on lecturer.lecturer_id = department_lecturers.lecturer_id join department_info on department_info.Department_id = department_lecturers.Department_id where Dept_name like (%s)",["%"+department+"%"])
        if query > 0:
            queryDetails = cur.fetchone()
            return "The head of the "+department+" is "+queryDetails[0]+" "+queryDetails[1]
        return "We do not currently have information on the "+department

    def getLecturer(params):
        print(params['COURSECODE'])
        course_code = params['COURSECODE']
        cur = db.connection.cursor()
        query = cur.execute("select lecturer.lecturer_firstname, lecturer.lecturer_lastname,lecturer.prefix from lecturer join teaches on lecturer.lecturer_id = teaches.lecturer_id where teaches.course_code = %s",[course_code])
        if query > 0:
            queryDetails = cur.fetchone()
            print(queryDetails)
            return "The Lecturer for "+course_code+" is "+queryDetails[2]+" "+queryDetails[0]+" "+queryDetails[1]
        return"The information you have requested is currently not available"
        
    dispatcher = {'DeanSearch': deansearch,'CreditsRequiredDegree':credits_for_degree,'CreditCheck':credit_check,'HOD':getHOD,'Lecturer':getLecturer}