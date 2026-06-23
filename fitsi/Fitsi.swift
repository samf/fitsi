import ArgumentParser

@main
struct Fitsi: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "fitsi",
        abstract: "Tools for working with FITS files.",
        version: fitsiVersion,
        subcommands: [Scan.self]
    )
}
