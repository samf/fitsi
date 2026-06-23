import ArgumentParser
import FITS
import Foundation

struct Scan: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Read FITS files and print a one-line summary of each."
    )

    @Argument(help: "FITS file(s) to scan.")
    var files: [String]

    func run() throws {
        for path in files {
            try scan(path: path)
        }
    }

    private func scan(path: String) throws {
        guard FileManager.default.isReadableFile(atPath: path) else {
            throw FitsiError("cannot read file '\(path)'")
        }
        let url = URL(fileURLWithPath: path)
        guard let fits = try FitsFile.read(contentsOf: url) else {
            throw FitsiError("'\(path)' is not a valid FITS file")
        }
        let cards = fits.prime.headerUnit.count
        print("\(path): read \(cards) header card(s) from primary HDU, \(fits.HDUs.count) extension HDU(s)")
    }
}

struct FitsiError: Error, CustomStringConvertible {
    let description: String
    init(_ message: String) { self.description = message }
}
