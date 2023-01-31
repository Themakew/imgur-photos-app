//
//  ImageAPIService.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import Alamofire
import RxSwift

protocol ImageAPIServiceProtocol {
    func getGallery() -> Single<Result<DataResponse, NetworkError>>
}

enum ImageAPICall {
    case getGallery

    var path: APIRequest {
        switch self {
        case .getGallery:
            return APIRequest(method: .get, path: Path.gallery)
        }
    }
}

final class ImageAPIService: ImageAPIServiceProtocol {

    // MARK: - Private Property

    private let serviceAPI: ServiceAPICallProtocol

    // MARK: - Initializer

    init(serviceAPI: ServiceAPICallProtocol) {
        self.serviceAPI = serviceAPI
    }

    // MARK: - Internal Methods

    func getGallery() -> Single<Result<DataResponse, NetworkError>> {
        return serviceAPI.request(
            request: ImageAPICall.getGallery.path,
            type: DataResponse.self
        )
        .asSingle()
    }
}
