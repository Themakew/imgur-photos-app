//
//  ImageRepository.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import RxSwift

final class ImageRepository: ImageRepositoryProtocol {

    // MARK: - Private Property

    private let imageAPIService: ImageAPIServiceProtocol

    // MARK: - Initializer

    init(imageAPIService: ImageAPIServiceProtocol) {
        self.imageAPIService = imageAPIService
    }

    // MARK: - Internal Methods

    func getGallery() -> Single<Result<DataEntity, NetworkError>> {
        return imageAPIService.getGallery()
            .map { [weak self] result in
                guard let self else {
                    return .failure(NetworkError.genericError(error: "DataResponse map to DataEntity failed."))
                }

                switch result {
                case let .success(data):
                    return .success(self.getDataEntity(dataResponse: data))
                case let .failure(error):
                    return .failure(error)
                }
            }
    }

    // MARK: - Private Methods

    private func getDataEntity(dataResponse: DataResponse) -> DataEntity {
        let dataEntityList = dataResponse.data.map { item in
            return ImageEntity(id: item.id, title: item.title, link: item.link)
        }

        return DataEntity(data: dataEntityList)
    }
}
