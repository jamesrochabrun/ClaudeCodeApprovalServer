// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApprovalMCPServer",
    platforms: [
        .macOS(.v14),
        .iOS(.v15)
    ],
    products: [
        // Library product for integration (empty, just for package structure)
        .library(
            name: "ApprovalServerKit",
            targets: ["ApprovalServerKit"]),
        // Executable product (not imported when used as dependency)
        .executable(
            name: "ApprovalMCPServer",
            targets: ["ApprovalMCPServer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/modelcontextprotocol/swift-sdk", from: "0.9.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
    ],
    targets: [
        // Library target (can be empty or contain shared code)
        .target(
            name: "ApprovalServerKit",
            dependencies: []
        ),
        // Executable target (not compiled when package is used as dependency)
        .executableTarget(
            name: "ApprovalMCPServer",
            dependencies: [
                .product(name: "MCP", package: "swift-sdk"),
                .product(name: "Logging", package: "swift-log")
            ]
        ),
    ]
)