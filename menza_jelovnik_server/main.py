from flask import Flask
from scrape import Dan, dani

app = Flask(__name__)
app.config["JSON_AS_ASCII"] = False
app.config['JSON_SORT_KEYS'] = False


@app.route("/danas")
def danas():
    return {
        "RUCAK" : {
            "1" : Dan(dani[0]).rucak(1),
            "2" : Dan(dani[0]).rucak(2),
            "3" : Dan(dani[0]).rucak(3),
            "VEGE" : Dan(dani[0]).rucak(4),
            "DODATNO" : Dan(dani[0]).rucak(5),
    },
        "VECERA" : {
            "1" : Dan(dani[0]).vecera(1),
            "2" : Dan(dani[0]).vecera(2),
            "3" : Dan(dani[0]).vecera(3),
            "VEGE" : Dan(dani[0]).vecera(4),
            "DODATNO" : Dan(dani[0]).vecera(5),
        }
    }

@app.route("/sutra")
def sutra():
    return {
        "RUCAK" : {
            "1" : Dan(dani[1]).rucak(1),
            "2" : Dan(dani[1]).rucak(2),
            "3" : Dan(dani[1]).rucak(3),
            "VEGE" : Dan(dani[1]).rucak(4),
            "DODATNO" : Dan(dani[1]).rucak(5),
    },
        "VECERA" : {
            "1" : Dan(dani[1]).vecera(1),
            "2" : Dan(dani[1]).vecera(2),
            "3" : Dan(dani[1]).vecera(3),
            "VEGE" : Dan(dani[1]).vecera(4),
            "DODATNO" : Dan(dani[1]).vecera(5),
        }
    }

@app.route("/preksutra")
def preksutra(): 
    return {
        "RUCAK" : {
            "1" : Dan(dani[2]).rucak(1),
            "2" : Dan(dani[2]).rucak(2),
            "3" : Dan(dani[2]).rucak(3),
            "VEGE" : Dan(dani[2]).rucak(4),
            "DODATNO" : Dan(dani[2]).rucak(5),
        },
        "VECERA" : {
            "1" : Dan(dani[2]).vecera(1),
            "2" : Dan(dani[2]).vecera(2),
            "3" : Dan(dani[2]).vecera(3),
            "VEGE" : Dan(dani[2]).vecera(4),
            "DODATNO" : Dan(dani[2]).vecera(5),
        }
    }

