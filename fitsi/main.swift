//
//  main.swift
//  fitsi
//
//  Created by Sam Falkner on 5/26/26.
//

import Foundation
import FITS

let arguments = CommandLine.arguments
let programName = (arguments.first as NSString?)?.lastPathComponent ?? "fitsi"

guard arguments.count == 2 else {
    FileHandle.standardError.write(Data("Usage: \(programName) [-V | --version] <file>\n".utf8))
    exit(1)
}

if arguments[1] == "-V" || arguments[1] == "--version" {
    print("v\(fitsiVersion)")
    exit(0)
}

let path = arguments[1]

guard FileManager.default.isReadableFile(atPath: path) else {
    FileHandle.standardError.write(Data("\(programName): cannot read file '\(path)'\n".utf8))
    exit(1)
}

let url = URL(fileURLWithPath: path)

do {
    guard let fits = try FitsFile.read(contentsOf: url) else {
        FileHandle.standardError.write(Data("\(programName): '\(path)' is not a valid FITS file\n".utf8))
        exit(1)
    }
    let cards = fits.prime.headerUnit.count
    print("\(path): read \(cards) header card(s) from primary HDU, \(fits.HDUs.count) extension HDU(s)")
} catch {
    FileHandle.standardError.write(Data("\(programName): error reading '\(path)': \(error.localizedDescription)\n".utf8))
    exit(1)
}

