// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Importr",
    dependencies: [
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift/", .branch("swift4.0")),
        .package(url: "https://github.com/Moya/Moya.git", .exact(Version(9, 0, 0, prereleaseIdentifiers: ["alpha", "1"]))),
        .package(url: "https://github.com/kylef/Commander.git", .upToNextMinor(from: "0.6.0"))
    ],
    targets: [
        .target(
            name: "importr",
            dependencies: [
                .product(name: "Commander"),
                .target(name: "ImporterKit")
            ]
        ),
        .target(
            name: "ImporterKit",
            dependencies: [
                .product(name: "Moya")
            ]
        )
    ]
)
