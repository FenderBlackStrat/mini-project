from flask import Flask, render_template, request, redirect, url_for
import pg8000

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        level = request.form["level"]

        return redirect(url_for("timetable", level=level))
    return render_template("index.html")

@app.route("/timetable", methods=["GET"])
def timetable():
    level = request.args.get("level")

    if not level:
        return "Level is required.", 400

    try:
        conn = pg8000.connect(user="student", password="student_pass", host="postgres_container", port=5432, database="murodjon")
        cur = conn.cursor()

        query = "SELECT * FROM timetable WHERE level = %s;"
        cur.execute(query, (level,))
        rows = cur.fetchall()

        message = "No data found for this level." if not rows else None
    except Exception as e:
        return f"Error: {e}", 500

    return render_template("timetable.html", data=rows, level=level, message=message)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
