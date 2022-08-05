import UIKit

class LikePostCoordinator: baseCoordinator {
    
    override func start() {
        
        let likePostVC = LikePostViewController(viewModel: .init(coordinator: self))
        navigationController.pushViewController(likePostVC, animated: true)
    }
}
