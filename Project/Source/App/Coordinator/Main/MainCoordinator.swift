import UIKit
final class MainCoordinator: baseCoordinator{
    // MARK: - Start
    func startPush() -> UINavigationController {
        
        let MainVC = MainViewController(viewModel: .init(coordinator: self))
        let navController = UINavigationController(rootViewController: MainVC)
        
        return navController
    }
    
    // MARK: - Navigate
    override func navigate(to step: GabozagoStep) {
        switch step {
        case .createPostIsRequired:
            createPostIsRequired()
            
        default:
            return
        }
    }
    
    
}
// MARK: - extension
private extension MainCoordinator {
    
    func createPostIsRequired() {
        print("createPost")
//        let vc = CreatePostCoordinator(navigationController: navigationController).startPush()
//        navigationController.pushViewController(vc, animated: true)
        
        let vc = CreatePostCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.pushCreatePostVC()
    }
}
