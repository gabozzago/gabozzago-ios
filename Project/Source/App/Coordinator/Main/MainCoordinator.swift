//
//  MainCoordinator.swift
//  gabozago-iOS
//
//  Created by 민도현 on 2022/07/19.
//  Copyright © 2022 com.wwg. All rights reserved.
//

import Foundation

final class MainCoordinator: baseCoordinator {
    
    // MARK: - Start
    override func start() {
        let vc = MainViewController()
        
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    // MARK: - Navigate
    override func navigate(to step: GabozagoStep) {
        switch step {
        case .mainIsRequired:
            navigateToLogin()
        }
    }
}
// MARK: - extension
private extension MainCoordinator {
    func navigateToLogin() {
        let vc = MainViewController()
        self.navigationController.setViewControllers([vc], animated: true)
    }
}
