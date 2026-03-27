// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "skir-swift-example",
    platforms: [
        .macOS(.v13),
    ],
    dependencies: [
        .package(url: "https://github.com/gepheum/skir-swift-client", branch: "main"),
        .package(url: "https://github.com/vapor/vapor", from: "4.115.0"),
    ],
    targets: [
        // Generated Swift code from .skir files. All other targets depend on this.
        .target(
            name: "Generated",
            dependencies: [
                .product(name: "SkirClient", package: "skir-swift-client"),
            ],
            path: "Sources/skirout"
        ),
        // Showcases how to read and write generated data types.
        .executableTarget(
            name: "Snippets",
            dependencies: ["Generated"],
            path: "Sources/Snippets"
        ),
        // Starts a Skir service on http://localhost:8787/myapi.
        .executableTarget(
            name: "StartService",
            dependencies: [
                "Generated",
                .product(name: "Vapor", package: "vapor"),
            ],
            path: "Sources/StartService"
        ),
        // Sends RPCs to the running service.
        .executableTarget(
            name: "CallService",
            dependencies: ["Generated"],
            path: "Sources/CallService"
        ),
    ]
)
