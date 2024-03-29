import ProjectDescription

extension TargetDependency{
    public struct SPM {}
}

public extension TargetDependency.SPM{
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let GoogleSignIn = TargetDependency.package(product: "GoogleSignIn")
    static let Moya = TargetDependency.package(product: "Moya")
}

public extension Package {
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .upToNextMajor(from: "5.6.0")
    )
    static let Then = Package.remote(
        url: "https://github.com/devxoul/Then.git",
        requirement: .upToNextMajor(from: "3.0.0")
    )
    static let GoogleSignIn = Package.remote(
        url: "https://github.com/google/GoogleSignIn-iOS",
        requirement: .upToNextMajor(from: "6.2.2")
    )
    static let Moya = Package.remote(
        url: "https://github.com/Moya/Moya",
        requirement: .upToNextMajor(from: "15.0.1")
    )
}
