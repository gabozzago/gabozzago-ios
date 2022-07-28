import UIKit
import Then

final class TabBarViewController: UITabBarController {
    
    private var coordinator: Coordinator
    
    private let mainVC = UINavigationController().then {
        $0.tabBarItem.image = Image.mainImg
        $0.tabBarItem.tag = 0
    }
    private let searchVC = UINavigationController().then {
        $0.tabBarItem.image = Image.searchImg
        $0.tabBarItem.tag = 1
    }
    private let likePostVC = UINavigationController().then {
        $0.tabBarItem.image = Image.likePostImg
        $0.tabBarItem.tag = 2
    }
    private let profileVC = UINavigationController().then {
        $0.tabBarItem.image = Image.profileImg
        $0.tabBarItem.tag = 3
    }
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStart() {
        coordinator = MainCoordinator(navigationController: mainVC)
        coordinator.navigate(to: .mainIsRequired)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tabBar.frame.size.height = 95
        self.tabBar.frame.origin.y = self.view.frame.size.height - 90
    }
    
    override func viewDidLoad() {
        setStart()
        UITabBar.appearance().tintColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .init(red: 0.74, green: 0.77, blue: 0.92, alpha: 1)
        UITabBar.appearance().frame.size.height = 10
        setViewControllers([mainVC, searchVC, likePostVC, profileVC], animated: true)
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.simpleAnimationWhenSelectedItem(item)
        
        guard item.tag == selectedIndex else {
            
            switch item.tag {
            case 0:
                setStart()
            case 1:
                coordinator = MainCoordinator(navigationController: searchVC)
                coordinator.navigate(to: .searchIsRequired)
            case 2:
                coordinator = MainCoordinator(navigationController: likePostVC)
                coordinator.navigate(to: .likePostIsRequired)
            case 3:
                coordinator = MainCoordinator(navigationController: profileVC)
                coordinator.navigate(to: .profileIsRequired)
            default:
                setStart()
            }
            
            return
        }
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
