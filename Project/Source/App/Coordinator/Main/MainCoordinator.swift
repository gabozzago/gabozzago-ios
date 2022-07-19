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
        let vm = LoginViewModel(coordinator: self)
        let vc = LoginViewController(viewModel: vm)
        
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    // MARK: - Navigate
    override func navigate(to step: GabozagoStep) {
        switch step {
        case .loginIsRequired:
            navigateToLogin()
        case .mainIsRequired:
            navigateToMain()
        }
    }
}
// MARK: - extension
private extension MainCoordinator {
    func navigateToMain() {
        let vc = MainViewController()
        self.navigationController.setViewControllers([vc], animated: true)
    }
    func navigateToLogin() {
        let vm = LoginViewModel(coordinator: self)
        let vc = LoginViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
}
