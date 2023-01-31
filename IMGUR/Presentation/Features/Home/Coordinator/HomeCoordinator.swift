//
//  HomeCoordinator.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import UIKit
import XCoordinator

enum HomeRouter: Route {
    case home
    case dismiss
}

final class HomeCoordinator: NavigationCoordinator<HomeRouter> {

    // MARK: - Initializer

    init() {
        super.init(initialRoute: .home)
    }

    // MARK: - Override Method

    override func prepareTransition(for route: HomeRouter) -> NavigationTransition {
        switch route {
        case .home:
            let viewModel = HomeViewModel(router: weakRouter)
            let viewController = HomeViewController(viewModel: viewModel)
            return .push(viewController)
        case .dismiss:
            return .pop()
        }
    }
}
