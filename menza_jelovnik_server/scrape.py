import requests
from bs4 import BeautifulSoup

url = "http://www.scvz.unizg.hr/varazdin/prehrana/tjedna-ponuda-jela/g62"
r = requests.get(url)
r.encoding = "utf-8"

r = r.text

soup = BeautifulSoup(r,"html5lib")

#Lista dana, 0 = danas, 1 = sutra, 2 = preksutra
dani = soup.find_all("div",{"class":"listDescription"})


class Dan():
    def __init__(self, dan):
        self.dan = dan

    #Vraća ručak u trenutnom danu ovisno o broju 1-4 (4=VEGE) ---- 5=DODATNA JELA
    def rucak(self, redniBroj):
        try:
            rucak = self.dan.find("tbody")
            rucak = rucak.find_all("tr")
            if len(rucak) == 5:
                rucak = rucak[redniBroj-1]
            elif len(rucak) == 6:
                rucak = rucak[redniBroj]
            rucak = rucak.find_all("td")[1].text
            rucak = rucak.replace("\n","").split("  ")
            rucak = [x for x in rucak if x != "" and len(x) > 1]
            rucak = [x.strip() for x in rucak]
            return rucak
        except:
            return None
    
    #Vraća večeru u trenutnom danu ovisno o broju 1-4 (4=VEGE) ---- 5=DODATNA JELA
    def vecera(self,redniBroj):
        try:
            vecera = self.dan.find("tbody")
            vecera = vecera.find_all("tr")
            if len(vecera) == 5:
                vecera = vecera[redniBroj - 1]
            elif len(vecera) == 6:
                vecera = vecera[redniBroj]
            vecera = vecera.find_all("td")[2].text
            vecera = vecera.replace("\n","").replace("\xa0","").split("  ")
            vecera = [x for x in vecera if x != "" and len(x) > 1]
            vecera = [x.strip() for x in vecera]
            return vecera
        except:
            return None

