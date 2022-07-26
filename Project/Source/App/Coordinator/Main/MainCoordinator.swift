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
//        let vm = MainViewModel(coordinator: self)
//        let vc = MainViewController(viewModel: vm)
        let vc = TabBarViewController(coordinator: self)
        
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    // MARK: - Navigate
    override func navigate(to step: GabozagoStep) {
        switch step {
        case .mainIsRequired:
            navigateToLogin()
        case .searchIsRequired:
            searchIsRequired()
        case .likePostIsRequired:
            likePostIsRequired()
        case .profileIsRequired:
            profileIsRequired()
        }
    }
}
// MARK: - extension
private extension MainCoordinator {
    func navigateToLogin() {
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    func searchIsRequired() {
        let vm = SearchViewModel(coordinator: self)
        let vc = SearchViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    func likePostIsRequired() {
        let vm = LikePostViewModel(coordinator: self)
        let vc = LikePostViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    func profileIsRequired() {
        let vm = ProfileViewModel(coordinator: self)
        let vc = ProfileViewController(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
}
