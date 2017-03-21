from flask import Flask, session, redirect, url_for, escape, request, render_template
from flask import Response
from flask_sqlalchemy import SQLAlchemy
from werkzeug.wsgi import LimitedStream
from flask import jsonify


app = Flask(__name__)
app.debug = True
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = 1;
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@127.0.0.1/loadlevel'

db = SQLAlchemy(app)

class StreamConsumingMiddleware(object):

    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        stream = LimitedStream(environ['wsgi.input'],
                               int(environ['CONTENT_LENGTH'] or 0))
        environ['wsgi.input'] = stream
        app_iter = self.app(environ, start_response)
        try:
            stream.exhaust()
            for event in app_iter:
                yield event
        finally:
            if hasattr(app_iter, 'close'):
                app_iter.close()

app.wsgi_app = StreamConsumingMiddleware(app.wsgi_app)



		

class Users(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    login = db.Column(db.String(255), index = True, unique = True)
    password = db.Column(db.String(255), index = True, unique = True)
    def __repr__(self):
        return '<User %r>' % (self.login)
    
class Maps(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(255), index = True, unique = True)
    def __repr__(self):
        return '<User %r>' % (self.name)
		
class Objects(db.Model):
    __tablename__ = 'objects'
    id = db.Column(db.Integer, primary_key=True)
    maps_id = db.Column(db.Integer, index = True)
    type = db.Column(db.Integer)
    x = db.Column(db.Float)
    y = db.Column(db.Float)

    def __init__(self, maps_id=None, type=None, x=0, y=0):
        self.maps_id = maps_id
        self.type = type
		self.x = x
		self.y = y

def check_login(l,p):    
    admin = Users.query.filter_by(login=l, password=p).first()
    if admin is not None:
        return 1
    return 0
	
def check_user():
    if 'username' in session:
        return 1
    return 0

@app.route('/')
def index(name=None):
    
    maps = Maps.query.all()
    
    return render_template('index.html', name=maps)


@app.route('/scene/<int:post_id>', methods=['GET', 'POST'])
def show_scene(post_id):
    
    if request.method == 'POST':
		u = Objects(post_id, request.values['type'], request.values['x'], request.values['y'])
		db.session.add(u)
		db.session.commit()
		data = {
			'type' : request.values['type'],
			'x' : request.values['x'],
			'y' : request.values['y']
		};
		resp = Response(data, status=200, mimetype='application/json')
		resp = jsonify(data)
		return resp


    return render_template('scene.html', post_id=post_id)



@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('index'))



@app.route('/login', methods=['GET', 'POST'])
def login(name=None):

    if request.method == 'POST':
        if check_login(request.form['login'], request.form['password']) :
            session['username'] = request.form['login']
        return redirect(url_for('index'))
    
    if request.method == 'GET':
        if check_user() :
            return redirect(url_for('index'))
    
    return render_template('login.html')

if __name__ == '__main__':
    app.run(threaded=True)