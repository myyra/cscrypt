// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "CScrypt",
    products: [
        .library(
            name: "CScrypt",
            type: .static,
            targets: ["CScrypt"]),
    ],
    targets: [
        .target(
            name: "CScrypt",
            dependencies: []),
        .testTarget(
            name: "CScryptTests",
            dependencies: ["CScrypt"]),
    ]
)
