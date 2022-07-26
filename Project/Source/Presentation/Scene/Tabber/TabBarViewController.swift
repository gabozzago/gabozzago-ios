import UIKit
import Then

class TabBarViewController: UITabBarController {
    
    var coordinaotr: Coordinator
    
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
        self.coordinaotr = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStart() {
        coordinaotr = MainCoordinator(navigationController: mainVC)
        coordinaotr.navigate(to: .mainIsRequired)
    }
    
    override func viewDidLoad() {
        setStart()
        view.backgroundColor = .white
        UITabBar.appearance().tintColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .init(red: 0.74, green: 0.77, blue: 0.92, alpha: 1)
        viewControllers = [mainVC, searchVC, likePostVC, profileVC]
    }
}
extension TabBarViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.simpleAnimationWhenSelectedItem(item)
        print(item.tag)
        
        switch item.tag {
        case 0:
            setStart()
        case 1:
            coordinaotr = MainCoordinator(navigationController: searchVC)
            coordinaotr.navigate(to: .searchIsRequired)
        case 2:
            coordinaotr = MainCoordinator(navigationController: likePostVC)
            coordinaotr.navigate(to: .likePostIsRequired)
        case 3:
            coordinaotr = MainCoordinator(navigationController: profileVC)
            coordinaotr.navigate(to: .profileIsRequired)
        default:
            coordinaotr = MainCoordinator(navigationController: mainVC)
            coordinaotr.navigate(to: .mainIsRequired)
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
