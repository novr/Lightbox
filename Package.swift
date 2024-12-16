// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Lightbox",
    products: [
        .library(
            name: "Lightbox",
            targets: ["Lightbox"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Lightbox",
            dependencies: [],
            path: "Source"
        )
    ],
    swiftLanguageModes: [.v6]
)
