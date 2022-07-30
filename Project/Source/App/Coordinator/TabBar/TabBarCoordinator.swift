final class TabBarCoordinator: baseCoordinator {
    
    override func navigate(to step: GabozagoStep) {
        switch step {
        case .mainIsRequired:
            mainIsRequired()
        case .searchIsRequired:
            searchIsRequired()
        case .likePostIsRequired:
            likePostIsRequired()
        case .profileIsRequired:
            profileIsRequired()
        default:
            return
        }
    }
}


private extension TabBarCoordinator {
    
    func mainIsRequired() {
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    func searchIsRequired() {
        let vm = SearchViewModel(coordinator: self)
        let vc = SearchViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    func likePostIsRequired() {
        let vm = LikePostViewModel(coordinator: self)
        let vc = LikePostViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    func profileIsRequired() {
        let vm = ProfileViewModel(coordinator: self)
        let vc = ProfileViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
}
