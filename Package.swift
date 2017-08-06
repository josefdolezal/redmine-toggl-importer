// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Redmine Toggl Importer",
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
        .Package(url: "https://github.com/Moya/Moya.git", majorVersion: 8, minor: 0)
    ]
)
