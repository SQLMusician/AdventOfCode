//
//  main.swift
//  Day01
//
//  Created by Douglas Denney on 12/21/22.
//

/*

answer for part 1: 74394
answer for part 2: 212836

top 3 high values
68579
69863
74394


Part 1: Highest Value = 74394
Part 2: Top 3 are, 74394, 69863, 68391
Part 2: Top 3 values = 212648
*/

import Cocoa

var curtot: Int = 0
var h1: Int = 0
var h2: Int = 0
var h3: Int = 0

// get URL to the the documents directory in the sandbox
let home = FileManager.default.homeDirectoryForCurrentUser

// add a filename
let fileUrl = home
    .appendingPathComponent("GitHub/AdventOfCode/2022/Day01/Day01")
    .appendingPathComponent("day01")
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
    
    // do whatever you need to do with this single line of text
    if (bytesRead == 1) {
        if (curtot > h1) {
            h1 = curtot
        }
        else {
            if (curtot > h2) {
                h2 = curtot
            }
            else {
                if (curtot > h3) {
                    h3 = curtot
                }
            }
        }
        curtot = 0
    }
    else {
        curtot = curtot + (lineAsString as NSString).integerValue
        //curtot = curtot + (Int(lineAsString) ?? 0 )
        //print("curtot = \(curtot)")
    }
    // for debugging, can print it
    //print("line = \(lineAsString); bytesRead = \(bytesRead)")
    
    // updates number of bytes read, for the next iteration
    bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
}

print ("h1 = \(h1)")
print ("h1+h2+h3 = \(h1+h2+h3)")
