//
//  APIRequest.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import Alamofire
import Foundation

enum BaseURL: String {
    case primary = "https://api.imgur.com/3/"
}

enum Path {
    case gallery

    var rawValue: String {
        switch self {
        case .gallery:
            return "gallery"
        }
    }
}

struct APIRequest {

    // MARK: - Internal Properties

    let url: String
    let method: HTTPMethod
    let encodeType: ParameterEncoding

    var headers: HTTPHeaders? = nil

    // MARK: - Private Properties

    private let baseURL: BaseURL
    private let path: String

    // MARK: - Initializer

    init(
        method: HTTPMethod,
        baseURL: BaseURL = .primary,
        path: Path,
        encodeType: ParameterEncoding = URLEncoding.default
    ) {
        self.method = method
        self.baseURL = baseURL
        self.path = path.rawValue
        self.encodeType = encodeType
        self.url = baseURL.rawValue + path.rawValue
        self.headers = getHeaders()
    }

    // MARK: - Private Methods

    private func getHeaders() -> HTTPHeaders {
        return HTTPHeaders(dictionaryLiteral: ("Authorization", "Client-ID 1ceddedc03a5d71"))
    }
}
