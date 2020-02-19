
####################
# Creating Vectors #
####################

# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# The variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector) <-   days_vector
names(roulette_vector) <- days_vector


######################
# Calculating Totals #
######################

A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector + B_vector

# Print out total_vector
total_vector

# Poker and roulette winnings from Monday to Friday:
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Total winnings with poker
total_poker <- sum(poker_vector)

# Total winnings with roulette
total_roulette <-  sum(roulette_vector)

# Total winnings overall
total_week <- sum(total_roulette, total_poker)

# Print out total_week
total_week

####################
# Vector Selection #
####################

# To select elements of a vector (and later matrices, data frames, ...), 
# you can use square brackets. Between the square brackets, you indicate what elements to select.
# NOTE: R uses index of 1 (unlike Python, which begins at 0)
# NOTE: selection includes the first and last references (unlike Python, which does not include the last ref)

# Poker and roulette winnings from Monday to Friday:
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Define a new variable based on W
poker_wednesday <- poker_vector[3]

# To select multiple elements from a vector, you can add square brackets at the end of it.
# You can indicate between the brackets what elements should be selected.

# Define a new variable based on  T, W, and Th
poker_midweek <- poker_vector[c(2:4)]

# Another way to tackle the previous exercise is by using the names of the vector elements (Monday, Tuesday, ...) 

poker_vector["Monday"]

# Select poker results for Monday, Tuesday and Wednesday
poker_start <- poker_vector[c("Monday", "Tuesday", "Wednesday")] # NOTE: Using : did not work

###########################
# Selection by Comparison #
###########################

# Which days did you make money on poker?
selection_vector <- poker_vector > 0

# Output:
# Monday   Tuesday Wednesday  Thursday    Friday 
#     TRUE     FALSE      TRUE     FALSE      TRUE

# You can select the desired elements, by putting selection_vector between the square brackets that follow poker_vector:
poker_winning_days <- poker_vector[selection_vector]

# Output:
#   Monday Wednesday    Friday 
#      140        20       240


############
# Matrices #
############

# In R, a matrix is a collection of elements of the same data type (numeric, character, or logical) 
# arranged into a fixed number of rows and columns. 
# Since you are only working with rows and columns, a matrix is called two-dimensional.

# Construct a matrix with 3 rows that contain the numbers 1 up to 9
matrix(1:9, byrow = TRUE, nrow = 3)

# Output:
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9

# In the matrix() function:

# The first argument is the collection of elements that R will arrange into the rows and columns of the matrix. 
# Here, we use 1:9 which is a shortcut for c(1, 2, 3, 4, 5, 6, 7, 8, 9).
# The argument byrow indicates that the matrix is filled by the rows. 
# The third argument nrow indicates that the matrix should have three rows.

#################################
# Combine vectors into a matrix #
#################################

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create box_office vector that is combo of the 3 above
box_office <- c(new_hope, empire_strikes, return_jedi)

# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, byrow = TRUE, nrow = 3)

###################
# Naming a Matrix #
###################

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix) <- region

# Name the rows with titles
rownames(star_wars_matrix) <- titles

# Print out star_wars_matrix
star_wars_matrix

# Output:
#                              US non-US
# A New Hope              460.998  314.4
# The Empire Strikes Back 290.475  247.9
# Return of the Jedi      309.306  165.8

############
# Row Sums #
############

# In R, the function rowSums() conveniently calculates the totals for each row of a matrix. 
# This function creates a new vector:

# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)

# Output:
#             A New Hope The Empire Strikes Back      Return of the Jedi 
#                775.398                 538.375                 475.106

###################
# Adding a column #
###################

# You can add a column or multiple columns to a matrix with the cbind() function, 
# which merges matrices and/or vectors together by column. For example:

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)

# Output:

#                             US non-US worldwide_vector
# A New Hope              460.998  314.4          775.398
# The Empire Strikes Back 290.475  247.9          538.375
# Return of the Jedi      309.306  165.8          475.106

# NOTE: worldwide_vector goes from a vector shown as a row to a vector column based on the # of items

################
# Adding a row #
################

# Given:

# > star_wars_matrix
#                            US non-US
# A New Hope              461.0  314.4
# The Empire Strikes Back 290.5  247.9
# Return of the Jedi      309.3  165.8

# > star_wars_matrix2
#                         US non-US
# The Phantom Menace   474.5  552.5
# Attack of the Clones 310.7  338.7
# Revenge of the Sith  380.3  468.5

# Combine both Star Wars trilogies in one matrix
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)

# Output:
#                            US non-US
# A New Hope              461.0  314.4
# The Empire Strikes Back 290.5  247.9
# Return of the Jedi      309.3  165.8
# The Phantom Menace      474.5  552.5
# Attack of the Clones    310.7  338.7
# Revenge of the Sith     380.3  468.5


                         
                         



