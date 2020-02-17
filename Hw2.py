# -*- coding: utf-8 -*-
"""
Created on Sat Sep  7 23:07:14 2019

@author: karud
"""

import numpy
import pandas

# Create blank board, b

b = [ [ "[]", "[]", "[]"], [ "[]", "[]", "[]"], [ "[]", "[]", "[]"] ]

bf = pandas.DataFrame( b, index = ['1', '2', '3'], columns = ['A', 'B', 'C'])

# Starting Considerations

i = 1
bPos = [ 'A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
bTaken = []


print(bf)

while i < 10:
    
    # Determine the player
    
    if (i % 2) == 0:
        Player = 'O'
    else:
        Player = 'X'

    # User inputs position and board adjusts
    
    position = input("Choose a position: ")

    # Ensure user inputs a valid position
    
    while (position not in bPos):
        print("Can you read? Enter a VALID position")
        position = input("Choose a position: ")
        
    # Ensures spot is not taken
    
    while (position in bTaken):
        print("Hellooo that spot is taken. Enter a VALID position")
        position = input("Choose a position: ")
        
    bTaken.append(position)
        
    # The correct column and row are selected by parsing through the input
        
    posCol = position[0]
    posRow = position[1]

    bf[ posCol ][ posRow ] = Player

    print(bf)
    
    # Check to see if there is a winner
    
    if bf[posCol].nunique() == 1 or bf.loc[posRow].nunique() == 1:
        print("Congrats!", Player, "wins!")
        break
    elif bf["B"]["2"] == Player:
        if ( bf["A"]["1"] == Player and bf["C"]["3"] == Player ) or ( bf["C"]["1"] == Player and bf["A"]["3"] == Player ):
            print("Congrats!", Player, "wins!")
            break
        else:
            i = i + 1
    else:
        i = i + 1
    
    
    
if i == 10:   
    print("Game over. It's a tie!")