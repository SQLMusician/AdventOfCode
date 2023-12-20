//
//  main.swift
//  Day01
//
//  Created by Douglas Denney on 12/19/23.
//

/*

answer for part 1: 54331
answer for part 2: ?

*/

import Cocoa

func findFirstAndLastDigits(in string: String) -> (first: Int?, last: Int?) {
    let digits = string.filter { $0.isNumber }
    let firstDigit = digits.first?.wholeNumberValue
    let lastDigit = digits.last?.wholeNumberValue
    return (firstDigit, lastDigit)
}

func convertSpelledOutNumbersToDigits(in string: String) -> String {
    let numberWords = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var result = string
    for (index, word) in numberWords.enumerated() {
        result = result.replacingOccurrences(of: word, with: "\(index)")
    }
    return result
}

var total = 0
var totalT = 0

// get URL to the the documents directory in the sandbox
let home = FileManager.default.homeDirectoryForCurrentUser

// add a filename
let fileUrl = home
    .appendingPathComponent("GitHub/AdventOfCode/2023/Day01/Day01")
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
    let (firstDigitT, lastDigitT) = findFirstAndLastDigits (in: lineAsString)
    let lineWithDigits = convertSpelledOutNumbersToDigits (in: lineAsString)
    let (firstDigit, lastDigit) = findFirstAndLastDigits (in: lineWithDigits)
    let twoDigitNumber = String(format: "%02d", (firstDigit ?? 0) * 10 + (lastDigit ?? 0))
    let twoDigitNumberT = String(format: "%02d", (firstDigitT ?? 0) * 10 + (lastDigitT ?? 0))
    if (Int(twoDigitNumber) != Int(twoDigitNumberT)) {
        print ("line=\(lineAsString); lineDigits=\(lineWithDigits); twoDigits=\(twoDigitNumber); twoDigitsT=\(twoDigitNumberT)")
    }
  
    total = total + (Int(twoDigitNumber) ?? 0)
    totalT = totalT + (Int(twoDigitNumberT) ?? 0)
    // for debugging, can print it
    //print("line = \(lineAsString); bytesRead = \(bytesRead)")
    
    // updates number of bytes read, for the next iteration
    bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
}

print ("Total: \(total); TotalT: \(totalT)")
