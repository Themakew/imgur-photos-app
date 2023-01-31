//
//  ImageRepositoryProtocol.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import RxSwift

protocol ImageRepositoryProtocol {
    func getGallery() -> Single<Result<DataEntity, NetworkError>>
}
