#!/bin/bash

# Function to display script usage/help information
function display_usage() {
  # hint: you will have multiple echo statements here
  echo ""
}

# Check if no arguments are provided.
# If so, display usage information and exit


# Initialize variables (you don't need to change this part)
filename=""
output_dir=""
action=""

# Process command-line options and arguments

        # option f
            filename=

        # option o
            output_dir=
        # option t
            action=
        # option h
            # display usage and exit
        # any other option
            echo "Invalid option: -a"
            # display usage and exit
        # no argument
            echo "Option -a requires an argument."
            # display usage and exit

# Check if all required switches are provided (f, o, t are required. since each of these sets a variable, you can use those variables to know if the option was provided)
    echo "Error: Missing required options."
    # display usage and exit

# Check if the -t switch has a valid argument
    echo "Error: Invalid action type. Supported types are 'process' and 'analyze'."
    # exit

# Check if the specified input filename exists and is a regular file
    echo "Error: Input file '$filename' does not exist or is not a regular file."
    # exit

# Check if the specified output directory exists and is a directory
    echo "Error: Output directory '$output_dir' does not exist."
    # exit

# Perform the selected action based on the user input
# if action is process
    # You don't actually need to do anything here, just echo the message
    echo "Processing task will be performed on '$filename' and the results will be stored in '$output_dir'."
# else if action is analyze
    # You don't actually need to do anything here, just echo the message
    echo "Analysis will be performed on '$filename' and the report will be stored in '$output_dir'."
