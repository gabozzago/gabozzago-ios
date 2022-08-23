import UIKit
final class TabBarCoordinator: baseCoordinator {
    var childCoordinator: [Coordinator] = []
    
    override func start() {
        
        let tabBarController = UITabBarController()
        
        let firstItem = UITabBarItem(title: nil, image: Image.mainImg?.withBaselineOffset(fromBottom: 14.0), tag: 0)
        let secondItem = UITabBarItem(title: nil, image: Image.searchImg?.withBaselineOffset(fromBottom: 14.0), tag: 1)
        let thirdItem = UITabBarItem(title: nil, image: Image.likePostImg?.withBaselineOffset(fromBottom: 14.0), tag: 2)
        let fourItem = UITabBarItem(title: nil, image: Image.profileImg?.withBaselineOffset(fromBottom: 14.0), tag: 3)
        
        UITabBar.appearance().tintColor = GabozagoAsset.Colors.gabozagoMainColor.color
        UITabBar.appearance().unselectedItemTintColor = .init(red: 0.74, green: 0.77, blue: 0.92, alpha: 1)
        
        let firstVC = UINavigationController()
        firstVC.tabBarItem = firstItem
        let firstCoordinator = MainCoordinator(navigationController: firstVC)
        firstCoordinator.parentCoordinator = self
        childCoordinator.append(firstCoordinator)
        
        let secondVC = UINavigationController()
        secondVC.tabBarItem = secondItem
        let secondCoordinator = SearchCoordinator(navigationController: secondVC)
        secondCoordinator.parentCoordinator = self
        childCoordinator.append(secondCoordinator)
        
        let thirdVC = UINavigationController()
        thirdVC.tabBarItem = thirdItem
        let thirdCoordinator = LikePostCoordinator(navigationController: thirdVC)
        thirdCoordinator.parentCoordinator = self
        childCoordinator.append(thirdCoordinator)
        
        let fourVC = UINavigationController()
        fourVC.tabBarItem = fourItem
        let fourCoordinator = ProfileCoordinator(navigationController: fourVC)
        fourCoordinator.parentCoordinator = self
        childCoordinator.append(fourCoordinator)
        
        tabBarController.viewControllers = [firstVC, secondVC, thirdVC, fourVC]
    
        tabBarController.modalPresentationStyle = .fullScreen
        
        start(coordinator: firstCoordinator)
        start(coordinator: secondCoordinator)
        start(coordinator: thirdCoordinator)
        start(coordinator: fourCoordinator)
        
        navigationController.present(tabBarController, animated: true)
    }
}
