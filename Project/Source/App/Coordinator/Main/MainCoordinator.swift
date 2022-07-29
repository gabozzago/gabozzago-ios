final class MainCoordinator: baseCoordinator {
    
    // MARK: - Start
    override func start() {
        let vc = TabBarViewController(coordinator: self)
        
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    // MARK: - Navigate
    override func navigate(to step: GabozagoStep) {
        switch step {
        case .createPostIsRequired:
            createPostIsRequired()
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
