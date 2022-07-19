import UIKit
import Then

class TabBarViewController: UITabBarController {
    
    private let mainVC = MainViewController().then {
        $0.tabBarItem.image = Image.mainImg
    }
    
    private let searchVC = SearchViewController().then {
        $0.tabBarItem.image = Image.searchImg
    }
    
    private let likePostVC = LikePostViewController().then {
        $0.tabBarItem.image = Image.likePostImg
    }
    
    private let profileVC = ProfileViewController().then {
        $0.tabBarItem.image = Image.profileImg
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        UITabBar.appearance().tintColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .init(red: 0.74, green: 0.77, blue: 0.92, alpha: 1)
        setViewControllers([mainVC, searchVC, likePostVC, profileVC], animated: true)
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.simpleAnimationWhenSelectedItem(item)
    }
    
    func simpleAnimationWhenSelectedItem(_ item: UIBarItem) {
        guard let baritemView = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval: TimeInterval = 0.5
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            baritemView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        propertyAnimator.addAnimations({ baritemView.transform = .identity },
                                       delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
}
