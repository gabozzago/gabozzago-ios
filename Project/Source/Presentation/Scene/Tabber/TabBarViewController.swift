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
}
