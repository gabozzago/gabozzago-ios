import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "gabozago-iOS"
let orginazationIden = "com.wwg"

let project = Project.excutable(
    name: projectName,
    platform: .iOS,
    packages: [
        .Then,
        .SnapKit,
        .Tabby
    ],
    product: .app,
    deploymentTarget: .iOS(targetVersion: "13.5", devices: [.iphone, .ipad]),
    dependencies: [
        .SPM.Then,
        .SPM.SnapKit,
        .SPM.Tabby
    ]
)
