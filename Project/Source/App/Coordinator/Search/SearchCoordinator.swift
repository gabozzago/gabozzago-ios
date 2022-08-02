import UIKit

class SearchCoordinator: baseCoordinator {
    
    func startPush() -> UINavigationController {

        let searchVC = SearchViewController(viewModel: .init(coordinator: self))
        let navController = UINavigationController(rootViewController: searchVC)
        
        return navController
    }
}
