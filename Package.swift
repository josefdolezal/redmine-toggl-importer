// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Importr",
    targets: [
        Target(
            name: "importr",
            dependencies: [
                "ImporterKit"
            ]
        ),
        Target(
            name: "ImporterKit"
        )
    ],
    dependencies: [
        .Package(url: "https://github.com/Moya/Moya.git", majorVersion: 8, minor: 0),
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 6),
        .Package(url: "https://github.com/josefdolezal/Moya-ModelMapper.git", majorVersion: 4, minor: 1)
    ]
)
