import UIKit

class SearchCoordinator: baseCoordinator {
    
    override func start() {

        let vm = SearchViewModel(coordinator: self)
        let vc = SearchViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
