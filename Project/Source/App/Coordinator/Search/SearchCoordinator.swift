import UIKit

class SearchCoordinator: baseCoordinator {
    
    override func start() {

        let searchVC = SearchViewController(viewModel: .init(coordinator: self))
        navigationController.pushViewController(searchVC, animated: true)
    }
}
