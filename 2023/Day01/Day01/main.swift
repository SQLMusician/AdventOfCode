//
//  main.swift
//  Day01
//
//  Created by Douglas Denney on 12/19/23.
//

/*

 Part 1: Calibration value = 54331
 Part 2: Calibration value = 54518

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
    /*
     This was not obvious in the instructions for this second part. But,
     the text sometimes contains words that are fully baked in my opinion.
     For example, "oneight", which is really "one" and "eight". So the
     puzzle really needs to have a few replaces, as outlined below, which
     didn't allow it to work until I added these. Then it gave the right
     answer, or the answer expected by the program.
     */
    result = result.replacingOccurrences(of: "oneight", with: "18")
    result = result.replacingOccurrences(of: "twone", with: "21")
    result = result.replacingOccurrences(of: "fiveight", with: "58")
    result = result.replacingOccurrences(of: "threeight", with: "38")
    result = result.replacingOccurrences(of: "nineight", with: "98")
    result = result.replacingOccurrences(of: "eighthree", with: "83")
    result = result.replacingOccurrences(of: "eightwo", with: "82")
    for (index, word) in numberWords.enumerated() {
        result = result.replacingOccurrences(of: word, with: "\(index)")
    }
    return result
}

var part1Total = 0
var part2Total = 0

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
    let lineAsString = String.init(cString:lineByteArrayPointer!).trimmingCharacters(in: .whitespacesAndNewlines)
    
    // do whatever you need to do with this single line of text
    let (firstDigit1, lastDigit1) = findFirstAndLastDigits (in: lineAsString)
    let twoDigitNumber1 = String(format: "%02d", (firstDigit1 ?? 0) * 10 + (lastDigit1 ?? 0))
    
    let lineWithDigits2 = convertSpelledOutNumbersToDigits (in: lineAsString)
    let (firstDigit2, lastDigit2) = findFirstAndLastDigits (in: lineWithDigits2)
    let twoDigitNumber2 = String(format: "%02d", (firstDigit2 ?? 0) * 10 + (lastDigit2 ?? 0))


    //print ("<==================>\r")
    //print ("twoDigitNumber1 = \(twoDigitNumber1) | twoDigitNumber2 = \(twoDigitNumber2) | lineAsString    = \(lineAsString) | lineWithDigits2 = \(lineWithDigits2)\r")
    print ("\(twoDigitNumber1) | \(twoDigitNumber2) | \(lineAsString) | lineWithDigits2 = \(lineWithDigits2)\r")
  
    part1Total = part1Total + (Int(twoDigitNumber1) ?? 0)
    part2Total = part2Total + (Int(twoDigitNumber2) ?? 0)
    
    // updates number of bytes read, for the next iteration
    bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
}

print ("Part1 Total: \(part1Total); Part2 Total: \(part2Total)")

/*
 
 From ChatGPT
 
 import Foundation

 func extractDigitsAndCalculateSum(from fileURL: URL) -> Int {
     do {
         // Read all lines from the file
         let content = try String(contentsOf: fileURL, encoding: .utf8)
         let lines = content.components(separatedBy: .newlines)

         // Calculate the sum of first and last digits for each line
         var sum = 0
         for line in lines {
             // Ignore empty lines
             if !line.isEmpty {
                 // Extract the first and last digits
                 if let firstDigit = line.first?.wholeNumberValue, let lastDigit = line.last?.wholeNumberValue {
                     // Combine the digits into a two-digit number
                     let combinedNumber = firstDigit * 10 + lastDigit

                     // Add the combined number to the sum
                     sum += combinedNumber
                 }
             }
         }

         return sum
     } catch {
         print("Error reading the file:", error)
         return 0
     }
 }

 // Replace "input.txt" with the actual file name or path
 if let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt") {
     let result = extractDigitsAndCalculateSum(from: fileURL)
     print("Sum of combined digits:", result)
 } else {
     print("Input file not found")
 }

 */

/*
 More from ChatGPT
 
 import Foundation

 func extractDigitsAndCalculateSum(from fileURL: URL) -> Int {
     do {
         // Read all lines from the file
         let content = try String(contentsOf: fileURL, encoding: .utf8)
         let lines = content.components(separatedBy: .newlines)

         // Define a mapping of number words to digits
         let numberWordsToDigits: [String: Int] = [
             "one": 1, "two": 2, "three": 3, "four": 4, "five": 5,
             "six": 6, "seven": 7, "eight": 8, "nine": 9
         ]

         // Calculate the sum of first and last digits for each line
         var sum = 0
         for line in lines {
             // Ignore empty lines
             if !line.isEmpty {
                 // Extract the first and last digits, considering number words
                 let firstDigit: Int
                 if let firstChar = line.first {
                     if let digit = firstChar.wholeNumberValue {
                         firstDigit = digit
                     } else {
                         // Check if the first word in the line represents a number
                         let word = String(firstChar)
                         if let digit = numberWordsToDigits[word] {
                             firstDigit = digit
                         } else {
                             // Default to 0 if it's neither a digit nor a recognized number word
                             firstDigit = 0
                         }
                     }
                 } else {
                     // Default to 0 for an empty line
                     firstDigit = 0
                 }

                 let lastDigit: Int
                 if let lastChar = line.last {
                     if let digit = lastChar.wholeNumberValue {
                         lastDigit = digit
                     } else {
                         // Check if the last word in the line represents a number
                         let word = String(lastChar)
                         if let digit = numberWordsToDigits[word] {
                             lastDigit = digit
                         } else {
                             // Default to 0 if it's neither a digit nor a recognized number word
                             lastDigit = 0
                         }
                     }
                 } else {
                     // Default to 0 for an empty line
                     lastDigit = 0
                 }

                 // Combine the digits into a two-digit number
                 let combinedNumber = firstDigit * 10 + lastDigit

                 // Add the combined number to the sum
                 sum += combinedNumber
             }
         }

         return sum
     } catch {
         print("Error reading the file:", error)
         return 0
     }
 }

 // Replace "input.txt" with the actual file name or path
 if let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt") {
     let result = extractDigitsAndCalculateSum(from: fileURL)
     print("Sum of combined digits:", result)
 } else {
     print("Input file not found")
 }

 */
