// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Cast3D",
    platforms: [
        .macOS(.v11),
        .iOS(.v15),
    ],
    products: [
        .library(name: "Cast3D", targets: ["Cast3D"]),
    ],
    targets: [
        .target(name: "Cast3D"),
        .testTarget(name: "Cast3DTests", dependencies: ["Cast3D"], resources: [.copy("Casts/")]),
    ]
)
