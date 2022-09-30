import json
from flask import Flask, render_template
from flask_mysqldb import MySQL

app = Flask("MovieApp")

app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "Pablo80%"
app.config["MYSQL_DB"] = "movie_db"

mysql = MySQL(app)

@app.route("/")
def hello_world():
    return "<p>Hello World!</p>"

@app.route("/movies/")
def list_movie_table():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * FROM movies_tbl"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return json.dumps(data)

list_of_queries = [
    "SELECT * FROM movies_tbl",
    "SELECT * FROM main_actors_tbl WHERE year_of_birth < 1980"]

@app.route("/movies-table/")
def list_movie_page():
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM movies_tbl")
        data = cursor.fetchall()
        cursor.execute("SELECT * FROM main_actors_tbl WHERE year_of_birth < 1980")
        data2 = cursor.fetchall()
        cursor.close()
        #return json.dumps(data)
        return render_template("movies.html", movies_data = data, actors_data = data2)

# def list_actors_page():
#         cursor = mysql.connection.cursor()
#         cursor.execute("SELECT * FROM main_actors_tbl WHERE year_of_birth < 1980")
#         data = cursor.fetchall()
#         cursor.close()
#         #return json.dumps(data)
#         return render_template("movies.html", actors_data = data)

if __name__ == "__main__":
    app.run(host = "127.0.0.1")
