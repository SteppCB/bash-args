#!/bin/bash

# Function to display script usage/help information
function display_usage() {
  echo "Usage: $0 -f <filename> -o <output_dir> -t <type>"
  echo "Options:"
  echo "  -f <filename>      Specify the input filename."
  echo "  -o <output_dir>    Specify the output directory."
  echo "  -t <type>          Specify the type of action: 'process' or 'analyze'."
  echo "  -h                 Display this help message."
  echo ""
  echo "Examples:"
  echo "  $0 -f input.txt -o /output/dir -t process"
  echo "  $0 -f input.csv -o /output/dir -t analyze"
}

# Check if no arguments are provided
if [ $# -eq 0 ]; then
  display_usage
  exit 1
fi

# Initialize variables
filename=""
output_dir=""
action=""

# Process command-line options and arguments
while getopts ":f:o:t:h" opt; do
  case ${opt} in
    f)
      filename="$OPTARG"
      ;;
    o)
      output_dir="$OPTARG"
      ;;
    t)
      action="$OPTARG"
      ;;
    h)
      display_usage
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      display_usage
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      display_usage
      exit 1
      ;;
  esac
done

# Check if all required switches are provided (-f, -o, -t are required)
if [ -z "$filename" ] || [ -z "$output_dir" ] || [ -z "$action" ]; then
  echo "Error: Missing required options."
  display_usage
  exit 1
fi

# Check if the -t switch has a valid argument
if [[ "$action" != "process" && "$action" != "analyze" ]]; then
  echo "Error: Invalid action type. Supported types are 'process' and 'analyze'."
  exit 1
fi

# Check if the specified input filename exists and is a regular file
if [ ! -f "$filename" ]; then
  echo "Error: Input file '$filename' does not exist or is not a regular file."
  exit 1
fi

# Check if the specified output directory exists and is a directory
if [ ! -d "$output_dir" ]; then
  echo "Error: Output directory '$output_dir' does not exist."
  exit 1
fi

# Perform the selected action based on the user input
if [ "$action" == "process" ]; then
  echo "Processing task will be performed on '$filename' and the results will be stored in '$output_dir'."
  
  # Simple Processing Task: Count words in the file
  word_count=$(wc -w < "$filename")
  output_file="$output_dir/process_report.txt"
  echo "The file '$filename' contains $word_count words." > "$output_file"
  echo "Processing complete. Report saved in '$output_file'."

elif [ "$action" == "analyze" ]; then
  echo "Analysis will be performed on '$filename' and the report will be stored in '$output_dir'."
  
  # Simple Analysis Task: Count rows and columns in a CSV file
  if [[ "$filename" == *.csv ]]; then
    row_count=$(awk 'END {print NR}' "$filename")
    column_count=$(head -n 1 "$filename" | awk -F, '{print NF}')
    output_file="$output_dir/analysis_report.txt"
    echo "The CSV file '$filename' contains $row_count rows and $column_count columns." > "$output_file"
    echo "Analysis complete. Report saved in '$output_file'."
  else
    echo "Error: Analysis can only be performed on CSV files."
    exit 1
  fi
fi
