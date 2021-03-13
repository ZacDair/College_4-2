#!/usr/bin/python
# --------------------------------------------------------
#
# PYTHON PROGRAM DEFINITION
#
# The knowledge a computer has of Python can be specified in 3 levels:
# (1) Prelude knowledge --> The computer has it by default.
# (2) Borrowed knowledge --> The computer gets this knowledge from 3rd party libraries defined by others
#                            (but imported by us in this program).
# (3) Generated knowledge --> The computer gets this knowledge from the current functions defined by us in this program.
#
# When launching in a terminal the command:
# user:~$ python3 this_file.py
# our computer first processes this PYTHON PROGRAM DEFINITION section of the file.
# On it, our computer enhances its Python knowledge from levels (2) and (3) with the imports and current functions
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
    content = line.strip().split("\t")
    tripData = content[1].split(" @ ")
    tripData[0] = str(tripData[0]).replace("(", "")
    tripData[-1] = str(tripData[-1]).replace(")", "")
    return tripData


# ------------------------------------------
# FUNCTION my_reduce
# ------------------------------------------
def my_reduce(my_input_stream, my_output_stream, my_reducer_input_parameters):
    # Input param operations
    pass

    # Initialize a list to store the trip results
    truckTrips = []
    prevTrip = []
    # Cycle through each line of the input stream
    for line in my_input_stream:

        # Extract trip data from the line
        tripData = processLine(line)

        # Compare stop and start stations and time (4 elements equal 1 trip)
        i = 0
        while i < len(tripData):
            if len(prevTrip) != 0:
                # Store the trip details [start time, stop time, start location, stop location]
                currentTrip = [tripData[i], tripData[i+1], tripData[i+2], tripData[i+3]]

                if prevTrip[3] != currentTrip[2]:
                    # Store the trip
                    truckTrips.append([prevTrip[1], prevTrip[3], currentTrip[0], currentTrip[2]])

            # store prev trip
            prevTrip = [tripData[i], tripData[i+1], tripData[i+2], tripData[i+3]]

            i += 4

    for x in truckTrips:
        res = "By_Truck" + "\t" + "(" + str(x[0]) + ", " + str(x[1]) + ", " + str(x[2]) + ", " + str(x[3]) + ")" + "\n"
        my_output_stream.write(res)


# Helper function to extract the trip length to use as a key in sorting
def getTime(ourList):
    return ourList[0], ourList[2]
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

    # 1.1. If we call the program from the console then we collect the arguments from it
    if (len(sys.argv) > 1):
        file_name = sys.argv[1]

    # 2. Local or Hadoop
    local_False_hadoop_True = False

    # 3. We set the path to my_dataset and my_result
    my_input_stream = sys.stdin
    my_output_stream = sys.stdout

    if (local_False_hadoop_True == False):
        my_input_stream = "../../my_results/A01_Part6/2_my_sort_simulation/" + file_name
        my_output_stream = "../../my_results/A01_Part6/3_my_reduce_simulation/reduce_" + file_name[5:]

    # 4. my_reducer.py input parameters
    my_reducer_input_parameters = []

    # 5. We call to my_main
    my_map(my_input_stream, my_output_stream, my_reducer_input_parameters)
