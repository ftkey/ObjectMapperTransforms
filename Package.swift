import PackageDescription

let package = Package(
    name: "ObjectMapperTransforms",
    dependencies: [
        .Package(url: "https://github.com/Hearst-DD/ObjectMapper.git", versions: Version(2,0,0)..<Version(3,0,0)),
    ]
)

