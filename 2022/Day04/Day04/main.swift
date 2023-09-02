//
//  main.swift
//  Day04
//
//  Created by Douglas Denney on 12/23/22.
//

import Cocoa

var p1score: Int = 0
var p2score: Int = 0
var linecount: Int = 0

// get URL to the the documents directory in the sandbox
let home = FileManager.default.homeDirectoryForCurrentUser

// add a filename
let fileUrl = home
    .appendingPathComponent("GitHub/AdventOfCode/2022/Day04/Day04")
    .appendingPathComponent("day04")
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
linecount += 1
while (bytesRead > 0) {
    
    // note: this translates the sequence of bytes to a string using UTF-8 interpretation
    let lineAsString = String.init(cString:lineByteArrayPointer!).trimmingCharacters(in: .newlines)
    
    let assignments = lineAsString.components(separatedBy: ",")
    let range1 = assignments.first!.components(separatedBy: "-")
    let range2 = assignments.last!.components(separatedBy: "-")
    
    if (range1.first! as NSString).integerValue >= (range2.first! as NSString).integerValue && (range1.last! as NSString).integerValue <= (range2.last! as NSString).integerValue {
        p1score += 1
    } else {
        if (range2.first! as NSString).integerValue >= (range1.first! as NSString).integerValue && (range2.last! as NSString).integerValue <= (range1.last! as NSString).integerValue {
            p1score += 1
        }
    }
    
    // find all the rows where there is no overlap
    if (range1.last! as NSString).integerValue < (range2.first! as NSString).integerValue || (range1.first! as NSString).integerValue > (range2.last! as NSString).integerValue {
        p2score += 1
    }
    // updates number of bytes read, for the next iteration
    bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
    linecount += 1
}

print ("p1score = \(p1score)")
print ("linecount = \(linecount)")
// p2score is found by find all rows where there is no overlap at all
// and then subtracting that from the total number of rows in the data
// set, which is 1000.
print ("p2score = \(p2score)")
print ("linecount - p2score -1 = \(linecount - p2score - 1)")


