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
    var getData: PublishRelay<Void> { get }
}

protocol HomeViewModelOutput {
    var dataSource: BehaviorRelay<[ImageEntity]> { get }
}

extension HomeViewModelProtocol where Self: HomeViewModelInput & HomeViewModelOutput {
    var input: HomeViewModelInput { return self }
    var output: HomeViewModelOutput { return self }
}

final class HomeViewModel: HomeViewModelProtocol, HomeViewModelInput, HomeViewModelOutput {

    // MARK: - Internal Properties

    var getData = PublishRelay<Void>()
    var dataSource = BehaviorRelay<[ImageEntity]>(value: [])

    // MARK: - Private Properties

    private let router: WeakRouter<HomeRouter>
    private let imageUseCase: ImageUseCaseProtocol
    private let disposeBag = DisposeBag()

    // MARK: - Initializer

    init(
        router: WeakRouter<HomeRouter>,
        imageUseCase: ImageUseCaseProtocol
    ) {
        self.router = router
        self.imageUseCase = imageUseCase

        bindRx()
    }

    // MARK: - Private Methods

    private func bindRx() {
        let responseResultObservable = getData
            .flatMap(weak: self) { this, _ -> Observable<Result<DataEntity, NetworkError>> in
                return this.imageUseCase.getGallery()
                    .asObservable()
            }
            .share()

        responseResultObservable
            .withUnretained(self)
            .subscribe(onNext: { this, result in
                switch result {
                case let .success(response):
                    this.dataSource.accept(response.data)
                case let .failure(error):
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
