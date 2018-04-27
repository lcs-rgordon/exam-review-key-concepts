//: [Previous](@previous) / [Next](@next)
//: # Exercise - Loops and Conditionals
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Exercise
 
 Each image is exactly 400 pixels wide by 600 pixels tall.
 
 Your goal is to precisely reproduce this image (the underlying image, not the planning grid):
 
 ![sloan-no-grid.png](sloan-no-grid.png "The Jesus and Mary Chain")
 ![sloan-with-grid.png](sloan-with-grid.png "The Jesus and Mary Chain")
 
 By precisely reproducing this image, you will demonstrate your understanding of:
 
 * sequence (order of statements in a program)
 * iteration (use of loops)
 * conditional (if statements)
 
 You can use the **Digital Color Meter** app (already installed on your Mac) to find specific colours as RGB (red-green-blue) codes.
 
 You [can use this site](http://www.workwithcolor.com/color-converter-01.htm) to convert colours to HSB to use with the Canvas class.

 Or, if you wish, you may use the color constants created below.

 */

// Create a new canvas
let canvas = Canvas(width: 442, height: 642, quality: .Ultra)

// Move the origin
canvas.translate(byX: 21, byY: 21)

// COLOR CONSTANTS
let deepOrange = Color(hue: 12, saturation: 78, brightness: 92, alpha: 100)
let lightBlue = Color(hue: 195, saturation: 63, brightness: 92, alpha: 100)
let neonGreen = Color(hue: 107, saturation: 61, brightness: 93, alpha: 100)

// 1. BACKGROUND

// Set the background color
canvas.fillColor = deepOrange

// Draw rectangle for background
canvas.drawShapesWithBorders = false
canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: 400, height: 600)

// 2. DRAW ALTERNATING LINES
for x in stride(from: 0, through: 350, by: 50) {
    
    // Choose the colour for the bar
    let remainder = x % 100
    
    // Use blue when horizontal position is evenly
    // divisible by 100
    if remainder == 0 {
        
        // Set colour blue
        canvas.fillColor = lightBlue
        
        // Draw lower
        canvas.drawRectangle(bottomLeftX: x, bottomLeftY: 0, width: 50, height: 350)
        
    } else {
        
        // Set colour green
        canvas.fillColor = neonGreen
        
        // Draw higher
        canvas.drawRectangle(bottomLeftX: x, bottomLeftY: 50, width: 50, height: 350)
        
    }
    
    
}

// 3. HEADLINE TEXT
canvas.textColor = Color.white
canvas.drawText(message: "sloan", size: 96, x: 150, y: 400, kerning: -2)

// 4. SUBHEADING TEXT

// Set subheadline kerning (space between letters)
let kerningSubHeadline : Float = -0.5

// Date and time
canvas.drawText(message: "saturday", size: 10, x: 15, y: 570, kerning: kerningSubHeadline)
canvas.drawText(message: "december 19 1992", size: 10, x: 15, y: 555, kerning: kerningSubHeadline)
canvas.drawText(message: "9 pm", size: 10, x: 15, y: 540, kerning: kerningSubHeadline)

// Performers
canvas.drawText(message: "with", size: 10, x: 150, y: 570, kerning: kerningSubHeadline)
canvas.drawText(message: "thrush hermit", size: 10, x: 150, y: 555, kerning: kerningSubHeadline)
canvas.drawText(message: "the quahogs", size: 10, x: 150, y: 540, kerning: kerningSubHeadline)

// Location
canvas.drawText(message: "camaro's cafe", size: 10, x: 275, y: 570, kerning: kerningSubHeadline)
canvas.drawText(message: "halifax", size: 10, x: 275, y: 555, kerning: kerningSubHeadline)
canvas.drawText(message: "nova scotia", size: 10, x: 275, y: 540, kerning: kerningSubHeadline)

// 4. PLANNING GRID

// Move origin back for grid
canvas.translate(byX: -21, byY: -21)

// Draw a white border around to cut off edges of poster again
canvas.drawShapesWithBorders = false
canvas.drawShapesWithFill = true
canvas.fillColor = Color.white
canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: 21, height: 642) // Left
canvas.drawRectangle(bottomLeftX: 21, bottomLeftY: 0, width: 400, height: 21) // Bottom
canvas.drawRectangle(bottomLeftX: 421, bottomLeftY: 0, width: 21, height: 642) // Right
canvas.drawRectangle(bottomLeftX: 21, bottomLeftY: 621, width: 400, height: 21) // Top


// Grid in white
canvas.lineColor = Color.black

// Vertical lines
for x in stride(from: 21, through: 421, by: 50) {
    canvas.drawLine(fromX: x, fromY: 21, toX: x, toY: canvas.height - 21)
    canvas.drawText(message: String(x - 21), size: 9, x: x, y: 5)
}

// Horizontal lines
for y in stride(from: 21, through: 621, by: 50) {
    canvas.drawLine(fromX: 21, fromY: y, toX: canvas.width - 21, toY: y)
}

// Labels in black
canvas.lineColor = Color.black

// Axis labels
canvas.drawText(message: "x", size: 12, x: 431, y: 21)
canvas.drawText(message: "y", size: 12, x: 31, y: 626)

// Draw vertical axis labels
canvas.rotate(by: 90)
for x in stride(from: 21, through: 621, by: 50) {
    canvas.drawLine(fromX: x, fromY: 21, toX: x, toY: canvas.height - 21)
    canvas.drawText(message: String(x - 21), size: 9, x: x, y: -20)
}


// Put image on clipboard
canvas.copyToClipboard()

/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView

