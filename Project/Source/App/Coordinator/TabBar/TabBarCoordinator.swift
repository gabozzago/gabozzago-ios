import UIKit
final class TabBarCoordinator: baseCoordinator {
    var childCoordinator: [Coordinator] = []
    
    override func start() {
        
        let tabBarController = UITabBarController()
        let firstItem = UITabBarItem(title: nil, image: Image.mainImg, tag: 0)
        let secondItem = UITabBarItem(title: nil, image: Image.searchImg, tag: 1)
        let thirdItem = UITabBarItem(title: nil, image: Image.likePostImg, tag: 2)
        let fourItem = UITabBarItem(title: nil, image: Image.profileImg, tag: 3)
        
        
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
        
        navigationController.present(tabBarController, animated: true)
        print("hihi")
        
        start(coordinator: firstCoordinator)
        start(coordinator: secondCoordinator)
        start(coordinator: thirdCoordinator)
        start(coordinator: fourCoordinator)
    }
}
