import UIKit

final class MainCoordinator: baseCoordinator{
    // MARK: - Start
    override func start() {
        
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
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
        
        let vc = CreatePostCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.pushCreatePostVC()
    }
}
