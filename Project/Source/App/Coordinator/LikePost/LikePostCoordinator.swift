import UIKit

class LikePostCoordinator: baseCoordinator {
    
    func startPush() -> UINavigationController {
        
        let likePostVC = LikePostViewController(viewModel: .init(coordinator: self))
        let navController = UINavigationController(rootViewController: likePostVC)
        
        return navController
    }
    
}
