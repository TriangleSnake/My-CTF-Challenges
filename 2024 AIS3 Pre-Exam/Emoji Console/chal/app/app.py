#!/usr/local/bin/python3

import os
from flask import Flask,send_file,request,redirect,jsonify,render_template
import json
import string
def translate(command:str)->str:
    emoji_table = json.load(open('emoji.json','r',encoding='utf-8'))
    for key in emoji_table:
        if key in command:
            command = command.replace(key,emoji_table[key])
    return command.lower()

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api')
def api():
    command = request.args.get('command')
    
    if len(set(command).intersection(set(string.printable.replace(" ",''))))>0:
        return jsonify({'command':command,'result':'Invalid command'})
    command = translate(command)
    result = os.popen(command+" 2>&1").read()
    return jsonify({'command':command,'result':result})
    

if __name__ == '__main__':
    app.run('0.0.0.0',5000)

