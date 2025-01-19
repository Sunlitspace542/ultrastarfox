import sys

def pad_file(input_file):
    # Open the input file in binary mode
    with open(input_file, 'rb') as file:
        # Read the content of the input file
        content = file.read()

    # Calculate the padding size
    padding_size = 0x200 - len(content)

    # Pad the content with 0x00 bytes
    padded_content = content + bytes([0x00] * padding_size)

    # Create a new file with the same name as the input file, but with .col extension
    output_file = input_file.replace('.pal', '.col')

    # Write the padded content to the output file
    with open(output_file, 'wb') as file:
        file.write(padded_content)

    print(f"Palette padded successfully. Padded palette saved as: {output_file}")

if __name__ == "__main__":
    # Check if the correct number of arguments is provided
    if len(sys.argv) != 2:
        print("Usage: python padpal.py <input_file>")
        sys.exit(1)

    # Get the input file from the command line arguments
    input_file = sys.argv[1]

    # Call the pad_file function with the input file
    pad_file(input_file)
