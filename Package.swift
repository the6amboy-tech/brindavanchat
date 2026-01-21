// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "brindavanchat",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "brindavanchat",
            targets: ["brindavanchat"]
        ),
    ],
    dependencies:[
        .package(path: "localPackages/Arti"),
        .package(path: "localPackages/BitLogger"),
        .package(url: "https://github.com/21-DOT-DEV/swift-secp256k1", exact: "0.21.1")
    ],
    targets: [
        .executableTarget(
            name: "brindavanchat",
            dependencies: [
                .product(name: "P256K", package: "swift-secp256k1"),
                .product(name: "BitLogger", package: "BitLogger"),
                .product(name: "Tor", package: "Arti")
            ],
            path: "brindavanchat",
            exclude: [
                "Info.plist",
                "Assets.xcassets",
                "brindavanchat.entitlements",
                "brindavanchat-macOS.entitlements",
                "LaunchScreen.storyboard",
                "ViewModels/Extensions/README.md"
            ],
            resources: [
                .process("Localizable.xcstrings")
            ]
        ),
        .testTarget(
            name: "brindavanchatTests",
            dependencies: ["brindavanchat"],
            path: "brindavanchatTests",
            exclude: [
                "Info.plist",
                "README.md"
            ],
            resources: [
                .process("Localization"),
                .process("Noise")
            ]
        )
    ]
)
