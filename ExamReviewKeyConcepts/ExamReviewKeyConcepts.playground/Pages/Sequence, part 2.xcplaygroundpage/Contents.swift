//: [Previous](@previous) / [Next](@next)
//: # Sequence, part 2
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Exercise
 Attempt to reproduce this image:
 
 ![Panda](panda.png "Panda")
 */
// Create the canvas
let canvas = Canvas(width: 300, height: 300)

// Draw panda main body
canvas.fillColor = Color.white
canvas.borderColor = Color.black
canvas.defaultBorderWidth = 2
canvas.drawEllipse(centreX: canvas.width / 2, centreY: canvas.height / 2, width: 100, height: 100)

// Your code below...
/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView