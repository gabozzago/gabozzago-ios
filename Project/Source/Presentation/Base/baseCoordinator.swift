import UIKit

class baseCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    
    func start() {
        
    }
    
    func start(coordinator: Coordinator) {
        childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let idx = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: idx)
        }
    }
    
    func navigate(to step: GabozagoStep){
        
    }
    
    func removeChildCoordinators() {
        childCoordinators.forEach{ $0.removeChildCoordinators() }
        childCoordinators.removeAll()
    }
    
}
