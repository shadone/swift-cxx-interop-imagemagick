// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImagemagickCxxInterop",
    platforms: [
        .macOS(.v13),
    ],
    targets: [
        .executableTarget(
            name: "Demo",
            dependencies: [
                "Imagemagick",
            ],
            cxxSettings: [
                .define("MAGICKCORE_HDRI_ENABLE=1"),
                .define("MAGICKCORE_QUANTUM_DEPTH=16"),
            ],
            swiftSettings: [
                .interoperabilityMode(.Cxx),
            ]
        ),
        .systemLibrary(
            name: "Imagemagick",
            pkgConfig: "Magick++",
            providers: [
                .brew(["imagemagick"]),
            ]
        ),
    ]
)
