// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftBox",
    platforms: [
        .iOS(.v12), .macOS(.v10_13), .tvOS(.v12), .watchOS(.v5)
    ],

    products: [
        .library(name: "SwiftBox", targets: ["SwiftBox"]),
    ],

    dependencies: [
        // None
    ],

    targets: [
        .target(
            name: "SwiftBox",
            dependencies: [],
            path: "Sources"
        )
    ]
)
