//
//  main.swift
//  fitsi
//
//  Created by Sam Falkner on 5/26/26.
//

import Foundation

let arguments = CommandLine.arguments
let programName = (arguments.first as NSString?)?.lastPathComponent ?? "fitsi"

guard arguments.count == 2 else {
    FileHandle.standardError.write(Data("Usage: \(programName) <file>\n".utf8))
    exit(1)
}

let path = arguments[1]

guard FileManager.default.isReadableFile(atPath: path) else {
    FileHandle.standardError.write(Data("\(programName): cannot read file '\(path)'\n".utf8))
    exit(1)
}

print("hello world")

