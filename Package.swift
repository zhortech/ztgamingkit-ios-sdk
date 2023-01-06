// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZTGamingKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZTGamingKit",
            targets: ["ZTGamingKitSDK"]
        )
    ],
    dependencies: [
        .package(
            name: "ZTCoreKit", 
            url: "https://github.com/zhortech/ztcorekit-ios-sdk.git",
            from: "1.1.61"
        )
    ],
    targets: [
        .target(
            name: "ZTGamingKitSDK",
            dependencies: [
                .product(
                    name: "ZTCoreKit",
                    package: "ZTCoreKit"
                ),
                .target(
                    name: "ZTGamingKit"
                )
            ],
            path: "Sources/ZTGamingKitSDK"
        ),
        .binaryTarget(
            name: "ZTGamingKit",
            path: "Sources/ZTGamingKit.xcframework"
        )
    ],
    swiftLanguageVersions: [.v5]
)
