#!/usr/bin/python
# --------------------------------------------------------
#
# PYTHON PROGRAM DEFINITION
#
# The knowledge a computer has of Python can be specified in 3 levels:
# (1) Prelude knowledge --> The computer has it by default.
# (2) Borrowed knowledge --> The computer gets this knowledge from 3rd party libraries defined by others
#                            (but imported by us in this program).
# (3) Generated knowledge --> The computer gets this knowledge from the new functions defined by us in this program.
#
# When launching in a terminal the command:
# user:~$ python3 this_file.py
# our computer first processes this PYTHON PROGRAM DEFINITION section of the file.
# On it, our computer enhances its Python knowledge from levels (2) and (3) with the imports and new functions
# defined in the program. However, it still does not execute anything.
#
# --------------------------------------------------------

# ------------------------------------------
# IMPORTS
# ------------------------------------------
import sys
import codecs


# Helper function to process the line
def processLine(line):
    data = line.strip().split("\t")
    counts = data[1].split(",")
    bikeId = int(counts[0].replace("(", ""))
    totalDuration = int(counts[1])
    totalTrips = int(counts[2].replace(")", ""))
    return bikeId, totalDuration, totalTrips


# ------------------------------------------
# FUNCTION my_reduce
# ------------------------------------------
def my_reduce(my_input_stream, my_output_stream, my_reducer_input_parameters):

    # Extract the top_n_bikes param
    numBikes = my_reducer_input_parameters[0]

    # Initialize the current bikeID, duration and trip count
    currentBikeID = 0
    currentTotalDuration = 0
    currentTripCount = 0

    # Initialize a dictionary to store the bike results
    resDict = {}

    # Cycle through each line of the input stream
    for line in my_input_stream:

        # Extract the id, duration and trip count per line (per bike entry)
        bikeID, totalDuration, tripCount = processLine(line)

        if bikeID != currentBikeID:
            if currentBikeID != 0:
                resDict[currentBikeID] = [currentTotalDuration, currentTripCount]

            currentBikeID = bikeID
            currentTotalDuration = 0
            currentTripCount = 0

        currentTotalDuration += totalDuration
        currentTripCount += tripCount

    if currentBikeID != 0:
        resDict[currentBikeID] = [currentTotalDuration, currentTripCount]

    # Sort the bikes by trip duration and output to a file
    orderedBikes = sorted(resDict.items(), key=getTripLength, reverse=True)
    for i in range(numBikes):
        res = str(orderedBikes[i][0]) + "\t" + "(" + str(orderedBikes[i][1][0]) + "," + str(orderedBikes[i][1][1]) + ")" + "\n"
        my_output_stream.write(res)


# Helper function to extract the trip length to use as a key in sorting
def getTripLength(ourList):
    return ourList[1]
# ---------------------------------------------------------------
#           PYTHON EXECUTION
# This is the main entry point to the execution of our program.
# It provides a call to the 'main function' defined in our
# Python program, making the Python interpreter to trigger
# its execution.
# ---------------------------------------------------------------
if __name__ == '__main__':
    # 1. We collect the input values
    file_name = "sort_1.txt"
    top_n_bikes = 10

    # 1.1. If we call the program from the console then we collect the arguments from it
    if (len(sys.argv) > 1):
        file_name = sys.argv[1]

    # 2. Local or Hadoop
    local_False_hadoop_True = False

    # 3. We set the path to my_dataset and my_result
    my_input_stream = sys.stdin
    my_output_stream = sys.stdout

    if (local_False_hadoop_True == False):
        my_input_stream = "../../my_results/A01_Part5/2_my_sort_simulation/" + file_name
        my_output_stream = "../../my_results/A01_Part5/3_my_reduce_simulation/reduce_" + file_name[5:]

    # 4. my_reducer.py input parameters
    my_reducer_input_parameters = []
    my_reducer_input_parameters.append( top_n_bikes )

    # 5. We call to my_main
    my_map(my_input_stream, my_output_stream, my_reducer_input_parameters)
