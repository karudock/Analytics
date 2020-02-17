# -*- coding: utf-8 -*-
"""
Created on Sat Sep  7 17:12:07 2019

@author: karud
"""

import sys
import csv

sys.path.insert( 1, 'C:/Users/karud/Documents/Python' )

from forecastiopy import *

api_key = '47e53dbbd6dd7ad11529caa800965e7c'
loc = [\
  [ "Anchorage, Alaska", 61.2181, -149.9003 ],\
  [ "Buenos Aires, Argentia", -34.6037, -58.3816 ],\
  [ "Sao Jose dos Campos, Brazil", -23.2237, -45.9009 ],\
  [ "San José, Costa Rica", 9.9281, -84.0907 ],\
  [ "Nanaimo, Canada", 49.1659, -123.9401],\
  [ "Ningbo, China",29.8683, 121.5440 ],\
  [ "Giza, Egypt", 30.0131, 31.2089], \
  [ "Mannheim, Germany", 49.4875, 8.4660 ],\
  [ "Hyderabad, India", 17.3850, 78.4867 ],\
  [ "Tehran, Iran", 35.6892, 51.3890 ],\
  [ "Bishkek, Kyrgyzstan", 42.8746, 74.5698 ],\
  [ "Riga, Latvia", 56.9496, 24.1052], \
  [ "Quetta, Pakistan", 30.1798, 66.9750],\
  [ "Warsaw, Poland", 52.2297, 21.0122 ],\
  [ "Dhahran, Saudia Arabia", 26.2361, 50.0393 ],\
  [ "Madrid, Spain", 40.4168, -3.7038 ],\
  [ "Oldham, United Kingdom", 53.5409, -2.1114 ]\
]

# Begin csv file with headers

csvData = [['City', 'Min 1', 'Max 1', 'Min 2', 'Max 2', 'Min 3', 'Max 3', 'Min 4', 'Max 4', 'Min 5', 'Max 5', 'Min Avg', 'Max Avg']]


# Loop through the lists using elem

for elem in loc:
    City = { 'lat': elem[1], 'lon' : elem[2] }
    
    weather = ForecastIO.ForecastIO( api_key, latitude=City[ 'lat' ], longitude=City[ 'lon' ] )

    # Begin a list with all values per city, where first column is the city name 
    
    newRow = [elem[0]]
    
    # To calculate Min Avg and Max Avg, first calculate the sum:
    
    minSum = 0
    
    maxSum = 0
    

    daily = FIODaily.FIODaily( weather )
    for day in range( 2, 7 ):
        
        # Keep track of day
        
            val = daily.get( day )

            # Add a new item to the list for each min and max value

            newRow.append( str( val[ 'temperatureMin' ]))            
            newRow.append( str( val[ 'temperatureMax' ]))
            
            # Calculate Min Sum and Max Sum
            
            minSum = minSum + val[ 'temperatureMin' ]
            maxSum = maxSum + val[ 'temperatureMax' ]
            
            
   
    # Now to add Min Avg and Max Avg to newROw
    
    newRow.append( str( round((minSum / 5),2)))           
    newRow.append( str( round((maxSum / 5),2)))
    
    # Now that all the values have been added to the newrow list, we can add newrow to csvData
    
    csvData.append(newRow)
    

# Finally, to create a .csv file

with open('temp.csv', 'w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerows(csvData)
csvFile.close()