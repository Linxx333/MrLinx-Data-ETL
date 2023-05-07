
import pandas as pd
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait   # es para esperar
from selenium.webdriver.common.by import By
import time as t
import warnings
warnings.filterwarnings('ignore')

opciones=Options()

opciones.add_experimental_option('excludeSwitches', ['enable-automation'])
opciones.add_experimental_option('useAutomationExtension', False)
opciones.headless=False    # si True, no aperece la ventana (headless=no visible)
opciones.add_argument('--start-maximized')         # comienza maximizado

PATH = ChromeDriverManager().install() 

def set_column_names(x):
   x.columns = x.iloc[0]
   x = x.drop(0,axis = 0)
   x = x.reset_index(drop = True)
   return x


def scrapeo_equipos_jugadores(url,year,time):

    driver = webdriver.Chrome(PATH,options= opciones) 
    driver.get(url)

    t.sleep(2)

    equipos = driver.find_elements(By.TAG_NAME,'a')
    url_teams = []
    teams = []
    teams_ndplayers = []
    for i in equipos:
        try:
            if 'SuperLiga' in i.get_attribute('href') or 'LVP' in i.get_attribute('href'):
                url_teams.append(i.get_attribute('href'))
                teams.append(i.text)
        except:
            continue

    for i in range(len(url_teams)):
        driver.get(url_teams[i])

        t.sleep(2)


        jugadores = driver.find_elements(By.TAG_NAME,'a')
        players = []
        players.append(teams[i])
        for i in jugadores:
            try:
                if 'player' in i.get_attribute('href'):
                    players.append(i.text)
            except:
                continue
        players.append(str(year) + ' ' + str(time))
        players.pop(1)
        teams_ndplayers.append(players)
    superliga = pd.DataFrame(teams_ndplayers)

    return superliga
        