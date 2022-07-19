//
//  TabBarViewController.swift
//  gabozago-iOS
//
//  Created by 민도현 on 2022/07/19.
//  Copyright © 2022 com.wwg. All rights reserved.
//

import Foundation
import UIKit
import Then

class TabBarViewController: UITabBarController {
    private let mainVC = MainViewController().then {
        $0.title = "MainVC"
        $0.tabBarItem.image = Image.smileImg
    }
    
    private let searchVC = SearchViewController().then {
        $0.title = "searchVC"
        $0.tabBarItem.image = Image.searchImg
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setViewControllers([mainVC, searchVC], animated: true)
    }
}