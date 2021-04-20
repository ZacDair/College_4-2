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

import pyspark
import pyspark.streaming

import os
import shutil
import time

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
# FUNCTION my_state_update
# ------------------------------------------
def my_state_update(time_interval_list_of_collected_new_values, cur_agg_val):
    # 1. We create the output variable
    res = 0

    # 2. If this is the first time we find the key, we initialise it
    if (cur_agg_val is None):
        cur_agg_val = 0

    # 3. We update the state
    res = sum(time_interval_list_of_collected_new_values) + cur_agg_val

    # 4. We return res
    return res


# ------------------------------------------
# FUNCTION my_model
# ------------------------------------------
def my_model(ssc, monitoring_dir, result_dir, window_duration, sliding_duration, time_step_interval):
    # 1. Operation C1: textFileStream
    inputDStream = ssc.textFileStream(monitoring_dir)

    # 2. Operation T1: flatMap
    allWordsDStream = inputDStream.flatMap(process_line)

    # 3. Operation T2: map
    pairWordsDStream = allWordsDStream.map(lambda x: (x, 1))


    # 4. Operation T1: window
    # The first argument is the window duration, i.e., how many previous batches of data are considered.
    # The second argument is the sliding duration, i.e., how frequently the new DStream computes results.
    windowDStream = pairWordsDStream.window(window_duration * time_step_interval,
                                            sliding_duration * time_step_interval
                                           )

    # 5. Opetion T3: updateStateByKey, to get the increased amount of words appearing.
    solutionDStream = windowDStream.updateStateByKey(my_state_update)

    # 6. Operation P1: persist
    solutionDStream.persist(pyspark.StorageLevel.MEMORY_AND_DISK)

    # 7. Operation A1: pprint
    solutionDStream.pprint()

    # 8. Operation A2: saveAsTextFiles
    solutionDStream.saveAsTextFiles(result_dir)


# ------------------------------------------
# FUNCTION get_source_dir_file_names
# ------------------------------------------
def get_source_dir_file_names(local_False_databricks_True, source_dir, verbose):
    # 1. We create the output variable
    res = []

    # 2. We get the FileInfo representation of the files of source_dir
    fileInfo_objects = []
    if local_False_databricks_True == False:
        fileInfo_objects = os.listdir(source_dir)
    else:
        fileInfo_objects = dbutils.fs.ls(source_dir)

    # 3. We traverse the fileInfo objects, to get the name of each file
    for item in fileInfo_objects:
        # 3.1. We get a string representation of the fileInfo
        file_name = str(item)

        # 3.2. If the file is processed in DBFS
        if local_False_databricks_True == True:
            # 3.2.1. We look for the pattern name= to remove all useless info from the start
            lb_index = file_name.index("name='")
            file_name = file_name[(lb_index + 6):]

            # 3.2.2. We look for the pattern ') to remove all useless info from the end
            ub_index = file_name.index("',")
            file_name = file_name[:ub_index]

        # 3.3. We append the name to the list
        res.append(file_name)
        if verbose == True:
            print(file_name)

    # 4. We sort the list in alphabetic order
    res.sort()

    # 5. We return res
    return res


# ------------------------------------------
# FUNCTION streaming_simulation
# ------------------------------------------
def streaming_simulation(local_False_databricks_True,
                         source_dir,
                         monitoring_dir,
                         time_step_interval,
                         verbose,
                         dataset_file_names
                        ):

    # 1. We check what time is it
    start = time.time()

    time.sleep(time_step_interval * 0.1)

    # 2. We set a counter in the amount of files being transferred
    count = 0

    # 3. If verbose mode, we inform of the starting time
    if (verbose == True):
        print("Start time = " + str(start))

    # 4. We transfer the files to simulate their streaming arrival.
    for file in dataset_file_names:
        # 4.1. We copy the file from source_dir to dataset_dir
        if local_False_databricks_True == False:
            shutil.copyfile(source_dir + file, monitoring_dir + file)
        else:
            dbutils.fs.cp(source_dir + file, monitoring_dir + file)

        # 4.2. If verbose mode, we inform from such transferrence and the current time.
        if (verbose == True):
            print("File " + str(count) + " transferred. Time since start = " + str(time.time() - start))

        # 4.3. We increase the counter, as we have transferred a new file
        count = count + 1

        # 4.4. We wait the desired transfer_interval until next time slot.
        time_to_wait = (start + (count * time_step_interval)) - time.time()
        if (time_to_wait > 0):
            time.sleep(time_to_wait)


# ------------------------------------------
# FUNCTION create_ssc
# ------------------------------------------
def create_ssc(sc,
               time_step_interval,
               monitoring_dir,
               result_dir,
               window_duration,
               sliding_duration
              ):

    # 1. We create the new Spark Streaming context acting every time_step_interval.
    ssc = pyspark.streaming.StreamingContext(sc, time_step_interval)

    # 2. We model the data processing to be done each time_step_interval.
    my_model(ssc, monitoring_dir, result_dir, window_duration, sliding_duration, time_step_interval)

    # 3. We return the ssc configured and modelled.
    return ssc


# ------------------------------------------
# FUNCTION my_main
# ------------------------------------------
def my_main(sc,
            local_False_databricks_True,
            source_dir,
            monitoring_dir,
            checkpoint_dir,
            result_dir,
            time_step_interval,
            verbose,
            window_duration,
            sliding_duration
           ):

    # 1. We get the names of the files of our dataset
    dataset_file_names = get_source_dir_file_names(local_False_databricks_True, source_dir, verbose)

    # 2. We setup the Spark Streaming context.
    # This sets up the computation that will be done when the system receives data.
    ssc = pyspark.streaming.StreamingContext.getActiveOrCreate(checkpoint_dir,
                                                               lambda: create_ssc(sc,
                                                                                  time_step_interval,
                                                                                  monitoring_dir,
                                                                                  result_dir,
                                                                                  window_duration,
                                                                                  sliding_duration
                                                                                 )
                                                               )

    # 3. We start the Spark Streaming Context in the background to start receiving data.
    #    Spark Streaming will start scheduling Spark jobs in a separate thread.
    ssc.start()
    ssc.awaitTerminationOrTimeout(time_step_interval)

    # 5. We simulate the streaming arrival of files (i.e., one by one) from source_dir to monitoring_dir.
    streaming_simulation(local_False_databricks_True,
                         source_dir,
                         monitoring_dir,
                         time_step_interval,
                         verbose,
                         dataset_file_names
                        )

    # 6. We stop the Spark Streaming Context
    ssc.stop(False)
    if (not sc._jvm.StreamingContext.getActive().isEmpty()):
        sc._jvm.StreamingContext.getActive().get().stop(False)


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

    # 1.1. We specify the time interval each of our micro-batches (files) appear for its processing.
    time_step_interval = 5

    # 1.2. We configure verbosity during the program run
    verbose = False

    # 1.3. window_duration, i.e., how many previous batches of data are considered on each window.
    window_duration = 3

    # 1.4. sliding duration, i.e., how frequently the new DStream computes results.
    sliding_duration = 2

    # 2. Local or Databricks
    local_False_databricks_True = True

    # 3. We set the path to my_dataset, my_monitoring, my_checkpoint and my_result
    my_local_path = "../../../../"
    my_databricks_path = "/"

    source_dir = "FileStore/tables/3_Spark_Streaming_Libs/3_1_Spark_Streaming/my_dataset/"
    monitoring_dir = "FileStore/tables/3_Spark_Streaming_Libs/3_1_Spark_Streaming/my_monitoring/"
    checkpoint_dir = "FileStore/tables/3_Spark_Streaming_Libs/3_1_Spark_Streaming/my_checkpoint/"
    result_dir = "FileStore/tables/3_Spark_Streaming_Libs/3_1_Spark_Streaming/my_result/"

    if local_False_databricks_True == False:
        source_dir = my_local_path + source_dir
        monitoring_dir = my_local_path + monitoring_dir
        checkpoint_dir = my_local_path + checkpoint_dir
        result_dir = my_local_path + result_dir
    else:
        source_dir = my_databricks_path + source_dir
        monitoring_dir = my_databricks_path + monitoring_dir
        checkpoint_dir = my_databricks_path + checkpoint_dir
        result_dir = my_databricks_path + result_dir

    # 4. We remove the directories
    if local_False_databricks_True == False:
        # 4.1. We remove the monitoring_dir
        if os.path.exists(monitoring_dir):
            shutil.rmtree(monitoring_dir)

        # 4.2. We remove the result_dir
        if os.path.exists(result_dir):
            shutil.rmtree(result_dir)

        # 4.3. We remove the checkpoint_dir
        if os.path.exists(checkpoint_dir):
            shutil.rmtree(checkpoint_dir)
    else:
        # 4.1. We remove the monitoring_dir
        dbutils.fs.rm(monitoring_dir, True)

        # 4.2. We remove the result_dir
        dbutils.fs.rm(result_dir, True)

        # 4.3. We remove the checkpoint_dir
        dbutils.fs.rm(checkpoint_dir, True)

    # 5. We re-create the directories again
    if local_False_databricks_True == False:
        # 5.1. We re-create the monitoring_dir
        os.mkdir(monitoring_dir)

        # 5.2. We re-create the result_dir
        os.mkdir(result_dir)

        # 5.3. We re-create the checkpoint_dir
        os.mkdir(checkpoint_dir)
    else:
        # 5.1. We re-create the monitoring_dir
        dbutils.fs.mkdirs(monitoring_dir)

        # 5.2. We re-create the result_dir
        dbutils.fs.mkdirs(result_dir)

        # 5.3. We re-create the checkpoint_dir
        dbutils.fs.mkdirs(checkpoint_dir)

    # 6. We configure the Spark Context
    sc = pyspark.SparkContext.getOrCreate()
    sc.setLogLevel('WARN')
    print("\n\n\n")

    # 7. We call to our main function
    my_main(sc,
            local_False_databricks_True,
            source_dir,
            monitoring_dir,
            checkpoint_dir,
            result_dir,
            time_step_interval,
            verbose,
            window_duration,
            sliding_duration
           )
