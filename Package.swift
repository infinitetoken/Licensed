// swift-tools-version:5.0
//
//  Package.swift
//  Licensed
//
//  Created by Aaron Wright on 5/1/18.
//  Copyright © 2018 Aaron Wright. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "Licensed",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "Licensed",
            targets: ["Licensed"])
    ],
    dependencies: [
        .package(url: "https://github.com/sharplet/Regex", from: "2.1.0")
    ],
    targets: [
        .target(
            name: "Licensed",
            dependencies: ["Regex"],
            path: "Source"),
        .testTarget(
            name: "LicensedTests",
            dependencies: ["Licensed"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)

