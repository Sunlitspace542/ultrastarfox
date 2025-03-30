from PIL import Image
import sys

def rearrange_image(input_path):
    # Open the original image
    img = Image.open(input_path)
    
    # Ensure the input image is 512x512
    if img.size != (512, 512):
        raise ValueError("Input image must be 512x512 pixels.")
    
    # Define quadrants
    quadrants = [
        (0, 0, 256, 256),   # Upper left
        (256, 0, 512, 256), # Upper right
        (0, 256, 256, 512), # Lower left
        (256, 256, 512, 512) # Lower right
    ]
    
    # Extract quadrants
    pieces = [img.crop(q) for q in quadrants]
    
    # Create a new blank image (256x1024)
    new_img = Image.new("RGBA", (256, 1024))
    
    # Paste quadrants in order
    for i, piece in enumerate(pieces):
        new_img.paste(piece, (0, i * 256))

    # Create a new file with the same name as the input file, but with _tall.png extension
    output_file = input_file.replace('.png', '_tall.png')
    
    # Save the output image
    new_img.save(output_file)

    print(f"Reformat successful. Saved as: {output_file}")

# Get the input file from the command line arguments
input_file = sys.argv[1]

# Call the function w/ input parameter
rearrange_image(input_file)
