final class MainCoordinator: baseCoordinator {
    
    // MARK: - Start
    override func start() {
        let vc = MainViewController(viewModel: .init(coordinator: self))
        navigationController.viewControllers = [vc]
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
        let vm = CreatePostViewModel(coordinator: self)
        let vc = CreatePostVC(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
