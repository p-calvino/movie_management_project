import json

from flask import Flask, render_template
from flask_mysqldb import MySQL
from flask import request

app = Flask("MovieApp")

app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "Pablo80%"
app.config["MYSQL_DB"] = "movie_db"

mysql = MySQL(app)

@app.route("/")
# Just to test that flask is working with Hello World
def hello_world():
    return "<p>Hello World!</p>"

@app.route("/movies/")
def list_movies():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * FROM movies_tbl;"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return json.dumps(data) # Return data as a string

@app.route("/movies-table/")
def list_movie_table(): 
    cursor = mysql.connection.cursor()
    query_string = "SELECT * FROM movies_tbl;"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return render_template("movies.html", movies_data=data) # Return data as rendered html template

@app.route("/new-movie/")
def new_movie(): 
    cursor = mysql.connection.cursor()
    d_query_string = "SELECT * FROM directors_tbl;"
    a_query_string = "SELECT * FROM main_actors_tbl;"
    cursor.execute(d_query_string)
    directors_data = cursor.fetchall()
    cursor.execute(a_query_string)
    actors_data = cursor.fetchall()
    cursor.close()
    return render_template("add-movie.html",
        directors_data=directors_data,
        actors_data=actors_data
    ) # Return data as rendered html template

@app.route('/add-new-movie/', methods=['POST'])
def add_new_movie():
    cursor = mysql.connection.cursor()

    # Collect info from Form
    title = request.form['movietitle']
    release_year = request.form['releaseyear']
    director_id = request.form['directorSelect']
    actor_id = request.form['actorSelect']

    # INSERT new movie inside the table movie_tbl
    movie_query_string = "INSERT INTO movies_tbl VALUES(null, %s, %s, %s);"
    cursor.execute(movie_query_string, (title, release_year, director_id))
    new_movie_id = cursor.lastrowid

    # INSERT into the table movie_actors_tbl
    movie_actor_query_string = "INSERT INTO movie_actors_tbl VALUES(%s, %s);"
    cursor.execute(movie_actor_query_string, (new_movie_id, actor_id))
    mysql.connection.commit()
    cursor.close()
    return list_movie_table()

@app.route('/delete-movie/', methods=['POST'])
def delete_movie():
    cursor = mysql.connection.cursor()
    id = request.form['delete']
    alter_string = "ALTER TABLE `movie_actors_tbl` DROP FOREIGN KEY `movie_actors_tbl_ibfk_1`; ALTER TABLE `movie_actors_tbl` ADD CONSTRAINT `movie_actors_tbl_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies_tbl`(`id`) ON DELETE CASCADE ON UPDATE CASCADE; ALTER TABLE `movie_actors_tbl` DROP FOREIGN KEY `movie_actors_tbl_ibfk_2`; ALTER TABLE `movie_actors_tbl` ADD CONSTRAINT `movie_actors_tbl_ibfk_2` FOREIGN KEY (`main_actor_id`) REFERENCES `main_actors_tbl`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;"
    cursor.execute(alter_string)
    delete_query_string = f"DELETE FROM movies_tbl WHERE id={id}"
    cursor.execute(delete_query_string)
    mysql.connection.commit()
    cursor.close()
    return list_movie_table()

if __name__ == "__main__":
    app.run(host="127.0.0.1", debug=True)
