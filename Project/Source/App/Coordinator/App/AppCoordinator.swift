import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    func start(coordinator: Coordinator) {
        
    }
    
    func didFinish(coordinator: Coordinator) {
        
    }
    
    func navigate(to step: GabozagoStep) {
        
    }
    
    func removeChildCoordinators() {
        
    }
    
    let window: UIWindow?
    
    init(_ window: UIWindow?, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func start() {
        let tabBarController = TabBarCoordinator(navigationController: navigationController).setTabBarController()
        self.window?.rootViewController = tabBarController
    }
}
