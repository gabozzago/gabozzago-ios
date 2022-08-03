import UIKit

class CreatePostCoordinator: baseCoordinator {
    
//    func startPush() -> UINavigationController {
//
//        let createPostVC = CreatePostVC(viewModel: .init(coordinator: self))
//        let navController = UINavigationController(rootViewController: createPostVC)
//
//        return navController
//    }
    
    func pushCreatePostVC() {
        
        let vm = CreatePostViewModel(coordinator: self)
        let vc = CreatePostVC(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
        print("push")
    }
}

