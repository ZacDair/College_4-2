
# --------------------------------------------------------
#           PYTHON PROGRAM
# Here is where we are going to define our set of...
# - Imports
# - Global Variables
# - Functions
# ...to achieve the functionality required.
# When executing > python 'this_file'.py in a terminal,
# the Python interpreter will load our program,
# but it will execute nothing yet.
# --------------------------------------------------------

# ------------------------------------------
# FUNCTION parse_in
# ------------------------------------------
def parse_in(input_name):
    # Try to read the file
    try:
        file = open(input_name, "r")
        # Get the file contents
        lines = file.readlines()

        # By counting the lines and contents
        delimiter = ' '
        matrix = []

        # Pop the line of meta data out
        lines.pop(0)

        # Loop through each line, removing the \n and splitting by the delimiter
        for line in lines:
            line = line.replace('\n', '')
            matrix.append(line.split(delimiter))

        # Length of the matrix is the number of rows, length of an entry is the number of columns
        num_rows = len(matrix)
        num_cols = len(matrix[0])

        print("num_rows =>", num_rows)
        print("num_cols =>", num_cols)
        print(matrix)

        return [num_rows, num_cols, matrix]

    except FileNotFoundError:
        print("Sorry the file: ", input_name, " could not be found")
        exit(1)


# ------------------------------------------
# FUNCTION solve
# ------------------------------------------
def solve(my_data):
    numRows = my_data[0]
    numCols = my_data[1]
    matrix = my_data[2]
    # List of relative coordinates of the 8 possible neighbours [[x1, y1], [x2, y2], ... [x8, y8]]
    neighbourPositions = [[-1, -1], [0, -1], [1, -1],
                          [-1,  0],          [1,  0],
                          [-1,  1], [0,  1], [1,  1]]

    # Loop through each row, and each column of the matrix (essentially each cell)
    # At each cell check each possible neighbour position, count occurrences of x (mines)
    solvedMatrix = matrix
    rowIndex = 0
    for row in matrix:
        colIndex = 0
        for cell in row:
            if cell != 'x':
                if cell == 'o':
                    solvedMatrix[rowIndex][colIndex] = 0
                for pos in neighbourPositions:
                    try:
                        if (numRows > rowIndex+pos[0] >= 0) and (numCols > colIndex + pos[1] >= 0):
                            if matrix[rowIndex+pos[0]][colIndex+pos[1]] == 'x':
                                solvedMatrix[rowIndex][colIndex] += 1

                    except IndexError:
                        print("Index error: [Neighbour Pos: ", pos, ", Matrix Pos: ", rowIndex, ",", colIndex, "]")
            colIndex += 1
        rowIndex += 1

    return [numRows, numCols, solvedMatrix]


# ------------------------------------------
# FUNCTION parse_out
# ------------------------------------------
def parse_out(output_name, my_solution):
    try:
        outputFile = open(output_name, 'w')
        numCols = my_solution[1]
        solvedMatrix = my_solution[2]
        for row in solvedMatrix:
            colIndex = 0
            for cell in row:
                # If the cell is the last in the row add a \n
                if colIndex == numCols-1:
                    delimiter = "\n"

                # else add a space between the cells
                else:
                    delimiter = " "

                # Output the string contents of the cell and the delimiter
                outputFile.write(str(cell)+delimiter)
                colIndex += 1
        outputFile.close()
    except FileNotFoundError:
        print("Sorry the file: ", input_name, " could not be found")
        exit(1)


# ------------------------------------------
# FUNCTION my_main
# ------------------------------------------
def my_main(input_name, output_name):
    # 1. We do the parseIn from the input file
    my_data = parse_in(input_name)

    # 2. We do the strategy to solve the problem
    my_solution = solve(my_data)

    # 3. We do the parse out to the output file
    parse_out(output_name, my_solution)


# ---------------------------------------------------------------
#           PYTHON EXECUTION
# This is the main entry point to the execution of our program.
# It provides a call to the 'main function' defined in our
# Python program, making the Python interpreter to trigger
# its execution.
# ---------------------------------------------------------------
if __name__ == '__main__':
    # 1. Name of input and output files
    input_name = "input_1.txt"
    #input_name = "input_2.txt"
    output_name = "output.txt"

    # 2. Main function
    my_main(input_name, output_name)





