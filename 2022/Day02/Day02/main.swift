//
//  main.swift
//  Day02
//
//  Created by Douglas Denney on 12/23/22.
//
/*
 A=Rock
 B=Paper
 C=Scissors
 X=Rock
 Y=Paper
 Z=Scissors
 0 for a loss
 3 for a draw
 6 for a win
 
 A X = 1+3=4
 A Y = 2+6=8
 A Z = 3+0=3
 B X = 1+0=1
 B Y = 2+3=5
 B Z = 3+6=9
 C X = 1+6=7
 C Y = 2+0=2
 C Z = 3+3=6
 
 The Elf finishes helping with the tent and sneaks back over to you. "Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"
 
 A=Rock
 B=Paper
 C=Scissors
 X=lose
 Y=draw
 Z=win
 0 for a loss
 3 for a draw
 6 for a win
 
 A X = 3+0=3
 A Y = 1+3=4
 A Z = 2+6=8
 B X = 1+0=1
 B Y = 2+3=5
 B Z = 3+6=9
 C X = 2+0=2
 C Y = 3+3=6
 C Z = 1+6=7
 
 */

import Cocoa

var p1score: Int = 0
var p2score: Int = 0

// get URL to the the documents directory in the sandbox
let home = FileManager.default.homeDirectoryForCurrentUser

// add a filename
let fileUrl = home
    .appendingPathComponent("GitHub/AdventOfCode/2022/Day02/Day02")
    .appendingPathComponent("day02")
    .appendingPathExtension("txt")


// make sure the file exists
guard FileManager.default.fileExists(atPath: fileUrl.path) else {
    preconditionFailure("file expected at \(fileUrl.absoluteString) is missing")
}

// open the file for reading
// note: user should be prompted the first time to allow reading from this location
guard let filePointer:UnsafeMutablePointer<FILE> = fopen(fileUrl.path,"r") else {
    preconditionFailure("Could not open file at \(fileUrl.absoluteString)")
}

// a pointer to a null-terminated, UTF-8 encoded sequence of bytes
var lineByteArrayPointer: UnsafeMutablePointer<CChar>? = nil

// see the official Swift documentation for more information on the `defer` statement
// https://docs.swift.org/swift-book/ReferenceManual/Statements.html#grammar_defer-statement
defer {
    // remember to close the file when done
    fclose(filePointer)

    // The buffer should be freed by even if getline() failed.
    lineByteArrayPointer?.deallocate()
}

// the smallest multiple of 16 that will fit the byte array for this line
var lineCap: Int = 0

// initial iteration
var bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)


while (bytesRead > 0) {
    
    // note: this translates the sequence of bytes to a string using UTF-8 interpretation
    let lineAsString = String.init(cString:lineByteArrayPointer!)
    //print ("lineAsString = \(lineAsString)")
    
    switch lineAsString {
    case "A X\n": do {
        p1score = p1score + 4
        p2score = p2score + 3
    }
    case "A Y\n": do {
        p1score = p1score + 8
        p2score = p2score + 4
    }
    case "A Z\n": do {
        p1score = p1score + 3
        p2score = p2score + 8
    }
    case "B X\n": do {
        p1score = p1score + 1
        p2score = p2score + 1
    }
    case "B Y\n": do {
        p1score = p1score + 5
        p2score = p2score + 5
    }
    case "B Z\n": do {
        p1score = p1score + 9
        p2score = p2score + 9
    }
    case "C X\n": do {
        p1score = p1score + 7
        p2score = p2score + 2
    }
    case "C Y\n": do {
        p1score = p1score + 2
        p2score = p2score + 6
    }
    case "C Z\n": do {
        p1score = p1score + 6
        p2score = p2score + 7
    }
    default:
        print("No match")
    }

    // updates number of bytes read, for the next iteration
    bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
}

print ("p1score = \(p1score)")
print ("p2score = \(p2score)")
