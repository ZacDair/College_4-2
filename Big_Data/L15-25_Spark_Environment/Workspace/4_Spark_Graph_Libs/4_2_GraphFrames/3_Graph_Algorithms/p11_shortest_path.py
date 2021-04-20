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

# ------------------------------------------------
# IMPORTS
# ------------------------------------------------
import codecs
import time
import os

# ------------------------------------------------
# FUNCTION read_graph_from_folder
# ------------------------------------------------
def read_graph_from_file(my_dataset_dir):
    # 1. We create the output variable
    res = ()

    # 1.1. We output the number of nodes
    num_nodes = 0

    # 1.2. We output the connections per node
    edges_per_node = {}

    # 2. We list the files from the directory my_dataset_dir
    list_of_files = os.listdir(my_dataset_dir)
    if ('.DS_Store' in list_of_files):
        list_of_files.remove('.DS_Store')
    list_of_files.sort()

    # 3. We traverse the files one by one
    for file in list_of_files:
        # 3.1. We open the file for reading
        my_input_stream = codecs.open(my_dataset_dir + file, "r", encoding='utf-8')

        # 3.2. We traverse the file
        for line in my_input_stream:
            # 3.2.1. We parse the line
            (source_node, target_node, weight) = tuple(map(int, line.strip().split(" ")))

            # 3.2.2. We search for new nodes appearing in the line
            for node_name in [source_node, target_node]:
                # 3.2.2.1. If the node has not appeared before
                if node_name not in edges_per_node:
                    # I. We associate the new node with an empty list of edges
                    edges_per_node[node_name] = []

                    # II. We increase the number of different nodes found so far
                    num_nodes += 1

            # 3.2.3. We populate the edges of source_node
            edges_per_node[source_node].append( (source_node, target_node, weight) )

        # 3.3. We close the file
        my_input_stream.close()

    # 4. We assign res
    res = (num_nodes, edges_per_node)

    # 5. We return res
    return res

# ------------------------------------------
# FUNCTION get_best_edge_candidate
# ------------------------------------------
def get_best_edge_candidate(shortest_path_per_node, edge_candidates):
    # 1. We create the output variable (initially assigned to the first candidate)
    res = ()

    # 1.1. We output the best source_node
    selected_candidate = edge_candidates[0]
    best_source_node = selected_candidate[0]

    # 1.2. We output the best target_node
    best_target_node = selected_candidate[1]

    # 1.3. We output the best cost
    best_cost = shortest_path_per_node[best_source_node][0] + selected_candidate[2]

    # 2. We traverse the rest of edge_candidates to get the one with best cost
    for selected_candidate in edge_candidates[1:]:
        # 2.1. We compute the new info associated to the candidate
        new_source_node = selected_candidate[0]
        new_target_node = selected_candidate[1]
        new_cost = shortest_path_per_node[new_source_node][0] + selected_candidate[2]

        # 2.2. If new_cost improves best_cost, we update it
        if (new_cost < best_cost):
            best_source_node = new_source_node
            best_target_node = new_target_node
            best_cost = new_cost

    # 3. We assign res
    res = (best_source_node, best_target_node, best_cost)

    # 4. We return res
    return res

# ------------------------------------------
# FUNCTION compute_dijkstra_shortest_path
# ------------------------------------------
def compute_dijkstra_shortest_path(source_node,
                                   edges_per_node
                                  ):

    # 0. Preconditions for the Dijkstra Algorithm to work

    #    I. We ensure that the source_node exists in the graph
    assert(source_node in edges_per_node)

    #    II. We ensure all edges have positive cost
    for node_name in edges_per_node:
        for edge in edges_per_node[node_name]:
            assert(edge[2] > 0)

    # 1. We create the output variable
    res = {}

    # 2. We initialise res
    #    We set the shortest path for each node to "not computed yet" --> (impossible cost -1)
    #    We set the shortest path for source node to "computed" --> (cost 0, empty path)
    for node_name in edges_per_node:
        res[node_name] = (-1, "")
    res[source_node] = (0, str(source_node))

    # 3. We maintain the set of edges under consideration (source_node, target_node, edge_weight)
    #    We initialise it with the edges from source_node
    edge_candidates = edges_per_node[source_node][:]

    # 4. We search for the shortest path for all target nodes t for which a path source_node --> t exists.
    while (edge_candidates != []):
        # 4.1. We pick the best edge candidate
        (best_source_node, best_target_node, best_cost) = get_best_edge_candidate(res, edge_candidates)

        # 4.2. We update the shortest_path for best_target_node

        # 4.2.1. We compute such path as the one to best_source_node plus the edge best_source_node --> best_target_node
        best_path = res[best_source_node][1] + "-" + str(best_target_node)

        # 4.2.2. We set the info for the node
        res[best_target_node] = (best_cost, best_path)

        # 4.3. We remove all edge_candidates pointing to best_target_node
        edge_candidates = list( filter(lambda item : item[1] != best_target_node, edge_candidates) )

        # 4.4. We add all new edges to become candidates

        # 4.4.1. We get the edges from 'best_target_node', to see all the edges departing from it
        potential_new_candidates = edges_per_node[best_target_node]

        # 4.4.2. We filter just these edges bringing us to nodes for which we have not found a shortest path yet.
        new_candidates = list( filter(lambda item : res[item[1]][0] == -1, potential_new_candidates) )

        # 4.4.3 We append such new edges in the desired format
        edge_candidates.extend(new_candidates)

    # 5. We return res
    return res

# ------------------------------------------
# FUNCTION print_results
# ------------------------------------------
def print_results(num_nodes, shortest_path_per_node):
    # 1. We print the number of nodes
    print("Num Nodes = " + str(num_nodes))

    # 2. We get the shortest paths in sorted order
    cost_per_node = [ (shortest_path_per_node[node][0], shortest_path_per_node[node][1], node) for node in shortest_path_per_node ]
    cost_per_node.sort()

    # 3. We print them
    index = 1
    for item in cost_per_node:
        print("Rank=" + str(index) + "; Node=" + str(item[2]) + "; Cost=" + str(item[0]) + "; Path=" + str(item[1]))
        index += 1

# ------------------------------------------
# FUNCTION my_main
# ------------------------------------------
def my_main(my_dataset_dir, source_node):
    # 1. We read the graph from the file
    (num_nodes, edges_per_node) = read_graph_from_file(my_dataset_dir)

    # 2. We compute the shortest paths to each node
    shortest_path_per_node = compute_dijkstra_shortest_path(source_node, edges_per_node)

    # 3. We get the shortest paths in sorted order
    cost_per_node = [ (shortest_path_per_node[node][0], shortest_path_per_node[node][1], node) for node in shortest_path_per_node ]
    cost_per_node.sort()

    # 4. We print them
    for item in cost_per_node:
        print("id=" + str(item[2]) + "; cost=" + str(item[0]) + "; path=" + str(item[1]))

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
    # 1. We get the input values
    source_node = 1

    # 2. Local or Databricks
    local_False_databricks_True = False

    # 3. We set the path to my_dataset and my_result
    my_local_path = "../../../../"
    my_databricks_path = "/"

    my_dataset_dir = "FileStore/tables/4_Spark_Graph_Libs/my_dataset_3/"

    if local_False_databricks_True == False:
        my_dataset_dir = my_local_path + my_dataset_dir
    else:
        my_dataset_dir = my_databricks_path + my_dataset_dir

    # 3. We call to my_main
    my_main(my_dataset_dir, source_node)
