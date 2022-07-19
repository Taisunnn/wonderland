'''
This python script will load csv contents to a mysql database hosted by azure
'''

import pandas as pd
from sqlalchemy import create_engine
import os

DATABASE = "big_data"

print("Connecting to Database...")

ssl_args = {'ssl_ca':'/Users/tyson/new_projects/powertwo/DigiCertGlobalRootCA.crt.pem'}
engine = create_engine(f'mysql+pymysql://{CONNECTION STRING}/{DATABASE}', connect_args=ssl_args)

print("Connection Successful!")

print("Reading Files and loading data...")

files = os.listdir("/Users/tyson/new_projects/powertwo/docs")

for file in files:
    df = pd.read_csv(f"/Users/tyson/new_projects/powertwo/docs/{file}", index_col=False)
    df.to_sql(f'{file}', con=engine, if_exists='append', index=False)

print("Data Loaded!")

