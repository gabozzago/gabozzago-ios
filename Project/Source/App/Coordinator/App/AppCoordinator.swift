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
        var tabBarController = setTabBarController()
        self.window?.rootViewController = tabBarController
    }
    
    func setTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        
        let firstItem = UITabBarItem(title: nil, image: Image.mainImg, tag: 0)
        let secondItem = UITabBarItem(title: nil, image: Image.searchImg, tag: 1)
        let thirdItem = UITabBarItem(title: nil, image: Image.likePostImg, tag: 2)
        let fourItem = UITabBarItem(title: nil, image: Image.profileImg, tag: 3)
        
        
        let firstCoordinator = MainCoordinator(navigationController: navigationController)
        firstCoordinator.parentCoordinator = self
        childCoordinator.append(firstCoordinator)
        let firstVC = firstCoordinator.startPush()
        firstVC.tabBarItem = firstItem
        
        let secondCoordinator = SearchCoordinator(navigationController: navigationController)
        secondCoordinator.parentCoordinator = self
        childCoordinator.append(secondCoordinator)
        let secondVC = secondCoordinator.startPush()
        secondVC.tabBarItem = secondItem
        
        tabBar.viewControllers = [firstVC, secondVC]
        
        return tabBar
    }
}
