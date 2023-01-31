//
//  ImageUseCase.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import RxSwift

final class ImageUseCase: ImageUseCaseProtocol {

    // MARK: - Private Property

    private let imageRepository: ImageRepositoryProtocol

    // MARK: - Initializer

    init(imageRepository: ImageRepositoryProtocol) {
        self.imageRepository = imageRepository
    }

    // MARK: - Internal Methods

    func getGallery() -> Single<Result<DataEntity, NetworkError>> {
        return imageRepository.getGallery()
    }
}
