import pandas as pd 
from bs4 import BeautifulSoup
import requests 

year = 2018

champ_pnts_url = f'https://www.racefans.net/{year}-f1-season/{year}-f1-statistics/{year}-f1-championship-points/'
qual_data_url = f'https://www.racefans.net/{year}-f1-season/{year}-f1-statistics/{year}-f1-qualifying-data/'
penalties_url = f'https://www.racefans.net/{year}-f1-season/{year}-f1-statistics/{year}-f1-retirements-penalties/'
race_data_url = f'https://www.racefans.net/{year}-f1-season/{year}-f1-statistics/{year}-f1-race-data/'
pitstops_url = f'https://www.racefans.net/{year}-f1-season/{year}-f1-statistics/{year}-f1-strategy-pit-stops/'

def Extract_table(table, df_name_str):
    df_name_str = f"{df_name_str}_{year}"
    columns = table.find_all('th')
    if len(columns) == 0:
        thead = table.find('thead')
        if thead:
            columns = thead.find_all('td')
        else:
            columns = table.find_all('tr')[0].find_all('td')
    Columns = [i.text.strip() for i in columns]
    df = pd.DataFrame(columns = Columns)
    rows_data = table.find_all('tr')[1:]  # skip the header row
    for row in rows_data:
        row_dt = row.find_all('td')
        if len(row_dt) != len(Columns):
            print(f"Error: Row has incorrect number of columns for year {year}")
            continue
        ind_row_data = [i.text.strip() for i in row_dt]
        df.loc[len(df)] = ind_row_data
        df.to_csv(f"C:/Users/user/Desktop/Houdini/Datasets/F1_data2015-2021/{df_name_str}.csv", index=False)
  
# Championship data
page = requests.get(champ_pnts_url)
soup = BeautifulSoup(page.text, 'html')
tables = soup.find_all('table')
driver = tables[0]
team = tables[1]
    
Extract_table(driver, 'driver_df') # Driver data
Extract_table(team, "team_df")     # Team data

# Qualifying data

page = requests.get(qual_data_url)
soup = BeautifulSoup(page.text, 'html')
tables = soup.find_all('table')
Qualifying = soup.find_all('table')[0]
start_pos = soup.find_all('table')[1]
teammate_comp = soup.find_all('table')[2]
Qualis = soup.find_all('table')[3]

Extract_table(Qualifying, 'Qualifying_df')
Extract_table(start_pos, 'start_pos_df')
Extract_table(teammate_comp, 'teammate_comp_df')
Extract_table(Qualis, 'Qualis_df')

page = requests.get(qual_data_url)
soup = BeautifulSoup(page.text, 'html')
tables = soup.find_all('table')
retirements = soup.find_all('table')[0]
penalties = soup.find_all('table')[1]

Extract_table(retirements, 'retirements_df')
Extract_table(penalties, 'penalties_df')

page = requests.get(race_data_url)
soup = BeautifulSoup(page.text, 'html')
tables = soup.find_all('table')
laps_per_pos = soup.find_all('table')[0]
start_and_fin = soup.find_all('table')[1]
laps_led = soup.find_all('table')[2]
pos_change_lap_one = soup.find_all('table')[3]

Extract_table(laps_per_pos, 'laps_per_pos')
Extract_table(start_and_fin, 'start_and_fin')
Extract_table(laps_led, 'laps_led')
Extract_table(pos_change_lap_one, 'pos_change_lap_one')

page = requests.get(pitstops_url)
soup = BeautifulSoup(page.text, 'html')
tables = soup.find_all('table')
pit_stops = soup.find_all('table')[0]
Fastest_pitstops = soup.find_all('table')[1]
Tyres = soup.find_all('table')[2]

Extract_table(pit_stops, 'pit_stops')
Extract_table(Fastest_pitstops, 'Fastest_pitstops')
Extract_table(Tyres, 'Tyres')