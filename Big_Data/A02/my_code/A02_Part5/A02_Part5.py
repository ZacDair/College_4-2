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
import pyspark.sql.functions

# ------------------------------------------
# FUNCTION my_main
# ------------------------------------------
def my_main(spark, my_dataset_dir, source_node):
    # 1. We define the Schema of our DF.
    my_schema = pyspark.sql.types.StructType(
        [pyspark.sql.types.StructField("source", pyspark.sql.types.IntegerType(), False),
         pyspark.sql.types.StructField("target", pyspark.sql.types.IntegerType(), False),
         pyspark.sql.types.StructField("weight", pyspark.sql.types.IntegerType(), False)
         ])

    # 2. Operation C1: 'read' to create the DataFrame from the dataset and the schema
    inputDF = spark.read.format("csv") \
        .option("delimiter", " ") \
        .option("quote", "") \
        .option("header", "false") \
        .schema(my_schema) \
        .load(my_dataset_dir)

    # ------------------------------------------------
    # START OF YOUR CODE:
    # ------------------------------------------------

    # Remember that the entire work must be done “within Spark”:
    # (1) The function my_main must start with the creation operation 'read' above loading the dataset to Spark SQL.
    # (2) The function my_main must finish with an action operation 'collect', gathering and printing by the screen the result of the Spark SQL job.
    # (3) The function my_main must not contain any other action operation 'collect' other than the one appearing at the very end of the function.
    # (4) The resVAL iterator returned by 'collect' must be printed straight away, you cannot edit it to alter its format for printing.

    # Type all your code here. Use as many Spark SQL operations as needed.

    # Get the nodes connected to the source node
    neighbours = inputDF.filter("source == " + str(source_node))
    neighbours.persist()

    # Create a dataframe for the results using a row for each node
    resultDF = inputDF.select("source").filter("source == " + str(source_node)).withColumn("cost", pyspark.sql.functions.lit(0)).distinct().withColumn("path", pyspark.sql.functions.lit(source_node))
    resultDF.persist()

    # While we have neighbours/nodes to check, keep running
    while resultDF.count() != inputDF.select("source").distinct().count():

        # Combine with the neighbours with the results to get the costs per path
        costsDF = neighbours.join(resultDF, "source", "left").withColumn("updated_cost", pyspark.sql.functions.col("weight") + pyspark.sql.functions.col("cost"))\
            .withColumn("updated_path", pyspark.sql.functions.concat_ws("-", resultDF["path"], neighbours["target"]))
        costsDF.persist()

        # Drop extra columns
        costsDF = costsDF.drop("cost").drop("weight").drop("path").drop("source")

        # Sort the DF by path cost
        orderedDF = costsDF.sort("updated_cost", ascending=True)
        costsDF.unpersist()

        # Pick node at the top (the one with the shortest path)
        bestNode = orderedDF.limit(1).withColumnRenamed("target", "node")
        bestNode.persist()

        # Copy of the best node for joining
        bestNodeC = bestNode.withColumnRenamed("node", "source").withColumnRenamed("updated_cost", "cost").withColumnRenamed("updated_path", "path")
        bestNodeC.persist()

        # Add the bestNode path cost and path string to the resultDF
        resultDF = resultDF.union(bestNodeC).sort("source", ascending=True)

        # Drop the extra columns
        bestNode.drop("updated_cost").drop("updated_path")

        # Find the nodes that are the target of our current best node
        new_neighbours = bestNode.join(inputDF, bestNode["node"] == inputDF["source"], "left")
        new_neighbours.persist()
        new_neighbours = new_neighbours.drop("node").drop("updated_cost").drop("updated_path")

        # Append our new nodes to the DataFrame to be analysed
        neighbours = neighbours.union(new_neighbours)

        # Only add neighbours that aren't pointing to the best node and aren't pointing to a node we already went to
        neighbours = neighbours.join(bestNode, bestNode["node"] == neighbours["target"], "left_anti").withColumnRenamed("source", "src")
        neighbours = neighbours.join(resultDF, neighbours["target"] == resultDF["source"], "left_anti").withColumnRenamed("src", "source")

        bestNode.unpersist()
        bestNodeC.unpersist()
        new_neighbours.unpersist()

    solutionDF = resultDF.withColumnRenamed("source", "id")












    # ------------------------------------------------
    # END OF YOUR CODE
    # ------------------------------------------------

    # Operation A1: 'collect' to get all results
    resVAL = solutionDF.collect()
    for item in resVAL:
        print(item)

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
    source_node = 1

    # 2. Local or Databricks
    local_False_databricks_True = False

    # 3. We set the path to my_dataset and my_result
    my_local_path = "../../"
    my_databricks_path = "/FileStore/tables/"

    my_dataset_dir = "my_datasets/my_dataset_3/"

    if local_False_databricks_True == False:
        my_dataset_dir = my_local_path + my_dataset_dir
    else:
        my_dataset_dir = my_databricks_path + my_dataset_dir

    # 4. We configure the Spark Session
    spark = pyspark.sql.SparkSession.builder.getOrCreate()
    spark.sparkContext.setLogLevel('WARN')
    print("\n\n\n")

    # 5. We call to our main function
    my_main(spark, my_dataset_dir, source_node)
