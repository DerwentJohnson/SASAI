"""
Flask Documentation:     http://flask.pocoo.org/docs/
Jinja2 Documentation:    http://jinja.pocoo.org/2/documentation/
Werkzeug Documentation:  http://werkzeug.pocoo.org/documentation/
This file creates your application.
"""

from app import app, db
from flask import render_template, request, make_response, jsonify,session
import dialogflow
import requests
import json
import os
import bcrypt
from app.forms import LoginForm
from app.resDict import resultDict


###
# Routing for your application.
###

def getResponse(intent,params):
    print(intent)
    if intent in resultDict.dispatcher:
        return resultDict.dispatcher[intent](params)
    else:
        return "I'm sorry, I could not find an adequate response for your question"
    


def detect_intent_texts(project_id, session_id, text, language_code):
    session_client = dialogflow.SessionsClient()
    session = session_client.session_path(project_id, session_id)
    if text:
        text_input = dialogflow.types.TextInput(text=text, language_code=language_code)
        query_input = dialogflow.types.QueryInput(text=text_input)
        response = session_client.detect_intent(session=session, query_input=query_input)
        return response.query_result.fulfillment_text

@app.route('/send_message', methods=['POST'])
def send_message():
    message = request.form['message']
    project_id = os.getenv('DIALOGFLOW_PROJECT_ID')
    fullfillment_text = detect_intent_texts(project_id, "unique", message, 'en')
    response_text = {"message": fullfillment_text}
    return jsonify(response_text)


@app.route('/webhook',methods=['POST'])
def webhook():
    data = request.get_json(silent=True)
    intent = data["queryResult"]["intent"]["displayName"]
    parameters = data["queryResult"]["parameters"]
    response = getResponse(intent,parameters)
    reply = {"fulfillmentText":response}
    return jsonify(reply)
    """Render the website's chat page."""
    return render_template('chatbot.html')

@app.route('/chat',methods=['GET','POST'])
def chat():
    return render_template('chatbot.html')

@app.route("/login-page", methods=["GET", "POST"])
def login():
    form = LoginForm()
    if request.method=='POST':
        userid= request.form['userid']
        password= request.form['password']
        

        cur = db.connection.cursor()
        cur.execute('SELECT * from student where student_id = %s',[userid])
        user = cur.fetchone()
        cur.close()

        if len(user) > 0 :
            
            if user[3] == password:
                print(user[1])
            # if bcrypt.hashpw(password, user['password'].encode('utf-8')) == user['password'].encode('utf-8'):
                session['username'] = user[1] + user[2]
                session['userid'] = user[0]
                return render_template('chatbot.html')
        else:
            return "ID or password incorrect"
    return render_template("login-page.html", form=form)



@app.route('/<file_name>.txt')
def send_text_file(file_name):
    """Send your static text file."""
    file_dot_text = file_name + '.txt'
    return app.send_static_file(file_dot_text)


@app.after_request
def add_header(response):
    """
    Add headers to both force latest IE rendering engine or Chrome Frame,
    and also to cache the rendered page for 10 minutes.
    """
    response.headers['X-UA-Compatible'] = 'IE=Edge,chrome=1'
    response.headers['Cache-Control'] = 'public, max-age=0'
    return response


@app.errorhandler(404)
def page_not_found(error):
    """Custom 404 page."""
    return render_template('404.html'), 404


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port="8080")
