import UIKit
class ProfileCoordinator: baseCoordinator {
    func startPush() -> UINavigationController {
        
        let profileVC = ProfileViewController(viewModel: .init(coordinator: self))
        let navController = UINavigationController(rootViewController: profileVC)
        
        return navController
    }
}
