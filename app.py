#!/usr/bin/env python

import os
from flask import Flask, render_template

app = Flask(__name__)


@app.route("/")
def homepage():
    return render_template('layout.html', background=os.getenv('BACKGROUND', '#fcf1ca'))


@app.route("/healthz")
def health():
    return "OK"


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port="5000")

