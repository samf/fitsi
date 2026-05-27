// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "fitsi",
    dependencies: [
        .package(url: "https://github.com/samf/fitscore.git", revision: "5419a16d2dfa945caaa95402650811ac7c8cb6fc"),
    ],
    targets: [
        .executableTarget(
            name: "fitsi",
            dependencies: [
                .product(name: "FITSCore", package: "fitscore"),
            ],
            path: "fitsi"
        )
    ]
)
