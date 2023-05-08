
import pandas as pd
import numpy as np
import re
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
        players.append(str(year) + ' ' + str(time))
        for i in jugadores:
            try:
                if 'player' in i.get_attribute('href'):
                    players.append(i.text)
            except:
                continue
        print(players)
        players.pop(2)
        teams_ndplayers.append(players)
    superliga = pd.DataFrame(teams_ndplayers)

    return superliga

def pasar_a_nan(x):
    if x == '-':
        x = np.nan
    return x

def limpiar_simbolo(x):
    try:
        x = x[:-1]
        x = float(x)
        return x
    except:
        return x
def quitar_coma(x):
       try:
              x = re.sub(r',', '', x)
              return x
       except:
              return x
       

      countries =  {'TW': 'Taiwan', 'TR': 'Turkey', 'KR': 'South Korea', 'NL':'Netherlands', 'CN': 'China', 'BG':'Bulgary', 'PS':'Palestine', 'EE':'Estonia', 'RU':'Russia',
       'KW':'Kuwait', 'RO':'Romania', 'US':'USA', 'BA':'Bosniabosnia and herzegovina','Unknown':'Unknown', 'AU':'Australia',
       'CL':'Chile', 'EG':'Egypt', 'VN':'Vietnam', 'MK':'North Macedonia', 'FI':'Finland', 'SY':'Syria', 'GR':'Greece', 'NO':'Norway', 'CR':'Costa Rica',
       'VE':'Venezuela', 'DK':'Denmark', 'RS', ' HR', ' UY', ' NZ', ' AT', ' SK', ' PH',
       ' GB', ' LB', ' IT', ' SI', ' TN', ' JO', ' DO', ' LT', ' UA',
       ' HK', ' HU', ' MO', ' BY', ' MX', ' BE', ' CY', ' CH', ' ME',
       ' PE', ' PF', ' DZ', ' AE', ' LV', ' MN', ' AL', ' MY', ' IE',
       ' AM', ' MA', ' IL', ' EC', ' ZA', ' SG', ' CO', ' MD', ' IS',
       ' LU', ' TH', ' ID'}


        