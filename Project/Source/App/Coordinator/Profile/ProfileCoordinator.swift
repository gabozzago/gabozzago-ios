import UIKit
class ProfileCoordinator: baseCoordinator {
    override func start() {
        
        let profileVC = ProfileViewController(viewModel: .init(coordinator: self))
        navigationController.pushViewController(profileVC, animated: true)
    }
}
