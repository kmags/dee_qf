
'''
Purpose: Tidy up column names on data file before importing to db tbl

'''


import pandas as pd
import os

os.getcwd

### Import csv file
df =  pd.read_csv('DataEngineerDataSet.csv', low_memory=False)


### change column names tp lowercase, replace ' ' with '_'
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_').str.replace('(', '').str.replace(')', '')


#df.head()
#df.shape
#df.info()


### Export as new csv
df.to_csv('DataEngineerDataSet_fix_col.csv')