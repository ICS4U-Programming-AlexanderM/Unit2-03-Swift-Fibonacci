import Foundation
//  Created by Alexander Matheson
//  Created on 2023-Apr-17
//  Version 1.0
//  Copyright (c) 2023 Alexander Matheson. All rights reserved.
//
//  This program calculates a number in the fibonacci sequence based off of a chosen term number.

// Enum for error checking
enum InputError: Error {
  case InvalidInput
}

// Input in separate function for error checking
func convert(strUnconverted: String) throws -> Int {
  guard let numConverted = Int(strUnconverted.trimmingCharacters(in: CharacterSet.newlines)) else {
    throw InputError.InvalidInput
  }
  return numConverted
}

// This function finds the max run for each line.
func fibSequence(number: Int) -> Int {
  if number == 1 {
    return 0
  } else if number == 2 {
    return 1
  } else {
    return fibSequence(number: number - 1) + fibSequence(number: number - 2)
  }
}

// Read in lines from input.txt.
let inputFile = URL(fileURLWithPath: "input.txt")
let inputData = try String(contentsOf: inputFile)
let lineArray = inputData.components(separatedBy: .newlines)

// Open the output file for writing.
let outputFile = URL(fileURLWithPath: "output.txt")

// Call function to find run and print to output file.
var fibString = ""
for position in lineArray {
  let term = try convert(strUnconverted: position)

  // Check if number is negative.
  if term <= 0 {
    print("Number must be positive.")
  } else {
    let numInSequence = fibSequence(number: term)
    print(numInSequence)

    // Write results to output 
    fibString = fibString + "\(numInSequence)\n"
    try fibString.write(to: outputFile, atomically: true, encoding: .utf8)
  }
}
