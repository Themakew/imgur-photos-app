//
//  HomeViewModel.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import RxCocoa
import RxRelay
import RxSwift
import UIKit
import XCoordinator

protocol HomeViewModelProtocol {
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
}

protocol HomeViewModelInput {

}

protocol HomeViewModelOutput {

}

extension HomeViewModelProtocol where Self: HomeViewModelInput & HomeViewModelOutput {
    var input: HomeViewModelInput { return self }
    var output: HomeViewModelOutput { return self }
}

final class HomeViewModel: HomeViewModelProtocol, HomeViewModelInput, HomeViewModelOutput {

    // MARK: - Private Properties

    private let router: WeakRouter<HomeRouter>
    private let disposeBag = DisposeBag()

    // MARK: - Initializer

    init(router: WeakRouter<HomeRouter>) {
        self.router = router

        bindRx()
    }

    // MARK: - Private Methods

    private func bindRx() {

    }
}
