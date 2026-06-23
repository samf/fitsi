// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "fitsi",
    dependencies: [
        .package(url: "https://github.com/samf/fitscore.git", revision: "84c8d48a5968bc14ac49d593a3302e103493bdab"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
    ],
    targets: [
        .executableTarget(
            name: "fitsi",
            dependencies: [
                .product(name: "FITSCore", package: "fitscore"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            path: "fitsi"
        ),
        .testTarget(
            name: "fitsiTests",
            dependencies: ["fitsi"],
            path: "Tests/fitsiTests"
        )
    ]
)
