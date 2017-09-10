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
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 6),
        .Package(url: "https://github.com/sunshinejr/Moya-ModelMapper.git", majorVersion: 5, minor: 0)
    ]
)
