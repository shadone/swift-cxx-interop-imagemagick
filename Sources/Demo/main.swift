// The Swift Programming Language
// https://docs.swift.org/swift-book

import Imagemagick
import CxxStdlib

// Example program from https://imagemagick.org/script/magick++.php#documentation
// It reads an image, crops it, and writes it to disk in the PNG image format.

func main() {
    let programPath = CommandLine.arguments[0]
    guard CommandLine.arguments.count == 3 else {
        print("Missing arguments")
        print("app <input-file> <output-file>")
        return
    }
    let inputFile = CommandLine.arguments[1]
    let outputFile = CommandLine.arguments[2]
    print(inputFile)

    Magick.InitializeMagick(programPath)

    // Construct the image object. Seperating image construction from the
    // the read operation ensures that a failure to read the image file
    // doesn't render the image object useless.
    var image = Magick.Image();

    // Read a file into image object
    image.read(std.string(inputFile))

    // Crop the image to specified size (width, height, xOffset, yOffset)
    image.crop(Magick.Geometry(100, 100, 100, 100));

    // Write the image to a file
    image.write(std.string(outputFile));
}

main()
