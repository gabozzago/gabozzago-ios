import UIKit
final class TabBarCoordinator: baseCoordinator {
    var childCoordinator: [Coordinator] = []
    
    func setTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
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
        
        let thirdCoordinator = LikePostCoordinator(navigationController: navigationController)
        thirdCoordinator.parentCoordinator = self
        childCoordinator.append(thirdCoordinator)
        let thirdVC = thirdCoordinator.startPush()
        thirdVC.tabBarItem = thirdItem
        
        let fourCoordinator = ProfileCoordinator(navigationController: navigationController)
        fourCoordinator.parentCoordinator = self
        childCoordinator.append(fourCoordinator)
        let fourVC = fourCoordinator.startPush()
        fourVC.tabBarItem = fourItem
        
        tabBarController.viewControllers = [firstVC, secondVC, thirdVC, fourVC]
        
        return tabBarController
    }
}
