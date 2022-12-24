//
//  main.swift
//  Day04
//
//  Created by Douglas Denney on 12/23/22.
//

import Cocoa

var p1score: Int = 0
var p2score: Int = 0
var mod: Int = 1
var str1: String = ""
var str2: String = ""
var str3: String = ""

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

while (bytesRead > 0) {
    
    // note: this translates the sequence of bytes to a string using UTF-8 interpretation
    let lineAsString = String.init(cString:lineByteArrayPointer!).trimmingCharacters(in: .newlines)
    if (mod % 3 == 1) {
        str1 = lineAsString
    }
    if (mod % 3 == 2) {
        str2 = lineAsString
    }
    if (mod % 3 == 0) {
        str3 = lineAsString
        for c in str1 {
            if str2.contains(c) && str3.contains(c) {
                //print("ELFBADGES: The magic letter is \(c) for the values //\(str1) and \(str2) and \(str3)")
                if c.asciiValue! > 96 {
                    p2score = p2score + Int(c.asciiValue!)-96
                }
                else {
                    p2score = p2score + Int(c.asciiValue!)-64+26
                }
                break
            }
        }
    }
    mod = mod + 1
    //print ("lineAsString = \(lineAsString)")

    let halfLength = lineAsString.count / 2

    let index = lineAsString.index(lineAsString.startIndex, offsetBy: halfLength)
    let beginning = lineAsString[..<index]
    let end = lineAsString[index...]
    //print ("beginning = \(beginning), count=\(beginning.count)")
    //print ("end = \(end), count=\(end.count)")
    
    for char in beginning {
        if end.contains(char) {
            //print("Found \(char), \(String(describing: char.asciiValue))")
            if char.asciiValue! > 96 {
                //print("Value=\(char.asciiValue!-96)")
                p1score = p1score + Int(char.asciiValue!)-96
            }
            else {
                //print("Value=\(char.asciiValue!-64+26)")
                p1score = p1score + Int(char.asciiValue!)-64+26
            }
            break
        }
    }

    //print("==========================")
    // updates number of bytes read, for the next iteration
    bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
}

print ("p1score = \(p1score)")
print ("p2score = \(p2score)")


