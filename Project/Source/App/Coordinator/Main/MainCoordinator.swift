import UIKit
final class MainCoordinator: baseCoordinator{
    // MARK: - Start
    override func start() {
       
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
    
    func startPush() -> UINavigationController {
        let MainVC = MainViewController(viewModel: .init(coordinator: self))
        
        navigationController.setViewControllers([MainVC], animated: true)
        
        return navigationController
    }
    
}
// MARK: - extension
private extension MainCoordinator {
    
    func createPostIsRequired() {
        let vm = CreatePostViewModel(coordinator: self)
        let vc = CreatePostVC(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
