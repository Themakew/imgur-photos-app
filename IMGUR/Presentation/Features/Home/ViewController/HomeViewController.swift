//
//  HomeViewController.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import RxSwift
import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Private Properties

    private let disposeBag = DisposeBag()
    private let viewModel: HomeViewModelProtocol

    // MARK: - Initializers

    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindRx()

        viewModel.input.getData.accept(())
    }

    // MARK: - Private Methods

    private func bindRx() {

    }
}

// MARK: - ViewCode Extension

extension HomeViewController: ViewCode {
    func buildViewHierarchy() {
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

        ])
    }

    func setupAdditionalConfiguration() {
        view.backgroundColor = .red
    }
}
