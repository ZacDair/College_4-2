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
import pyspark
import shutil
import os

# ------------------------------------------
# FUNCTION process_line
# ------------------------------------------
def process_line(line):
    # 1. We create the output variable
    res = []

    # 2. We set the line to be split by " "
    line = line.replace("\n", "")
    line = line.strip()
    line = line.rstrip()
    line = line.replace("\t", " ")

    # 3. We get rid of chars not being either a letter or a " "
    index = len(line) - 1

    # 3.1. We traverse all characters
    while (index >= 0):
        # 3.1.1. We get the ord of the character at position index
        char_val = ord(line[index])

        # 3.1.2. If (1) char_val is not " " and (2) char_val is not an Upper Case letter and (3) char_val is not a Lower Case letter
        if ( ( char_val != 32) and ((char_val < 65) or (char_val > 90)) and ((char_val < 97) or (char_val > 122)) ):
            # 3.1.2.1. We remove the index from the sentence
            line = line[:index] + line[(index+1):]
        # 3.1.3. If the character was an upper case letter
        elif ((char_val >= 65) and (char_val <= 90)):
            # 3.1.3.1. We add it as lower case
            line = line[:index] + chr(char_val + 32) + line[(index + 1):]

        # 3.1.4. We continue with the next index
        index = index - 1

    # 4. We get the list of words
    res = line.split(" ")

    index = len(res) - 1

    # 4.1. We traverse the words
    while (index >= 0):
        # 4.1.1. If it is empty, we remove it
        if (res[index] == ''):
            del res[index]

        # 4.1.2. We continue with the next word
        index = index - 1

    # 5. We return res
    return res

# ------------------------------------------
# FUNCTION my_main
# ------------------------------------------
def my_main(sc, my_dataset_dir, my_result_dir):

    inputRDD = sc.textFile(my_dataset_dir)

    allWordsRDD = inputRDD.flatMap(process_line)

    pairWordsRDD = allWordsRDD.map(lambda x: (x, 1))

    countRDD = pairWordsRDD.reduceByKey(lambda x, y: x + y)

    solutionRDD = countRDD.sortBy(lambda x: x[1] * (-1))

    solutionRDD.saveAsTextFile(my_result_dir)

# --------------------------------------------------------
#
# PYTHON PROGRAM EXECUTION
#
# Once our computer has finished processing the PYTHON PROGRAM DEFINITION section its knowledge is set.
# Now its time to apply this knowledge.
#
# When launching in a terminal the command:
# user:~$ python3 this_file.py
# our computer finally processes this PYTHON PROGRAM EXECUTION section, which:
# (i) Specifies the function F to be executed.
# (ii) Define any input parameter such this function F has to be called with.
#
# --------------------------------------------------------
if __name__ == '__main__':
    # 1. We use as many input arguments as needed
    pass

    # 2. Local or Databricks
    local_False_databricks_True = False

    # 3. We set the path to my_dataset and my_result
    my_local_path = "../../../"
    my_databricks_path = "/"

    my_dataset_dir = "FileStore/tables/1_Spark_Core/my_dataset/"
    my_result_dir = "FileStore/tables/1_Spark_Core/my_result"

    if local_False_databricks_True == False:
        my_dataset_dir = my_local_path + my_dataset_dir
        my_result_dir = my_local_path + my_result_dir
    else:
        my_dataset_dir = my_databricks_path + my_dataset_dir
        my_result_dir = my_databricks_path + my_result_dir

    # 4. We remove my_result directory
    if local_False_databricks_True == False:
        if os.path.exists(my_result_dir):
            shutil.rmtree(my_result_dir)
    else:
        dbutils.fs.rm(my_result_dir, True)

    # 5. We configure the Spark Context
    sc = pyspark.SparkContext.getOrCreate()
    sc.setLogLevel('WARN')
    print("\n\n\n")

    # 6. We call to our main function
    my_main(sc, my_dataset_dir, my_result_dir)
