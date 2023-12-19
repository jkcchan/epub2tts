# Specify the directory containing the .epub files
DIRECTORY="/"

# Loop through each .epub file in the specified directory
find "$DIRECTORY" -type f -name "*.epub" | while read file
do
    echo $file
    # Check if the file exists
    if [ -f "$file" ]
    then
        # Run your command on the file
        epub2tts "$file" --speaker p335

        # Check if the command was successful
        if [ $? -ne 0 ]
        then
            echo "Error processing file: $file"
            # Optionally, perform additional error handling here
            continue
        fi
    fi
done
