import UIKit

class ProfileCoordinator: baseCoordinator {
    
    override func start() {
        
        let vm = ProfileViewModel(coordinator: self)
        let vc = ProfileViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
