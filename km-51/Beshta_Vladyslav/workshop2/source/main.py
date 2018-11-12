"""
Створити два словника Message and Messenger
"""
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

message_dictionary = {
    "message_id": "1",
    "from_user": "38096",
    "to_user": "38067",
    "messenger_name": "Telegram",
    "massage_time": '2018-10-10',
    "status": "received",
    "content": "Hello my friend"
}

messenger_dictionary = {
    "messenger_name": "Telegram",
    "version": "3"
}


@app.route('/api/<action>', methods=['GET'])
def apiget(action):
    if action == "message":
        return render_template("message.html", message=message_dictionary)

    elif action == "messenger":
        return render_template("messenger.html", messenger=messenger_dictionary)

    elif action == "all":
        return render_template("all.html", message=message_dictionary, messenger=messenger_dictionary)

    else:
        return render_template("404.html", action_value=action)


@app.route('/api', methods=['POST'])
def apipost():
    if request.form["action"] == "message_update":

        message_dictionary["message_id"] = request.form["message_id"]
        message_dictionary["from_user"] = request.form["from_user"]
        message_dictionary["to_user"] = request.form["to_user"]
        message_dictionary["messenger_name"] = request.form["messenger_name"]
        message_dictionary["massage_time"] = request.form["massage_time"]
        message_dictionary["status"] = request.form["status"]
        message_dictionary["content"] = request.form["content"]

        return redirect(url_for('apiget', action="all"))

    elif request.form["action"] == "messenger_update":

        messenger_dictionary["messenger_name"] = request.form["messenger_name"]
        messenger_dictionary["version"] = request.form["version"]

        return redirect(url_for('apiget', action="all"))


if __name__ == '__main__':
    app.run()


