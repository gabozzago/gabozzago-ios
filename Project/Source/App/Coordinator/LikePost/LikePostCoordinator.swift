import UIKit

class LikePostCoordinator: baseCoordinator {
    
    override func start() {
        
        let vm = LikePostViewModel(coordinator: self)
        let vc = LikePostViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
