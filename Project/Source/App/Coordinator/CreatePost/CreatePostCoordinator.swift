import UIKit

class CreatePostCoordinator: baseCoordinator {

    func pushCreatePostVC() {
        
        let vm = CreatePostViewModel(coordinator: self)
        let vc = CreatePostVC(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}

