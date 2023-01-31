//
//  ServiceAPICall.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import Alamofire
import Foundation
import RxAlamofire
import RxSwift

protocol ServiceAPICallProtocol {
    func request<T: Decodable>(request: APIRequest, type: T.Type) -> Observable<Result<T, NetworkError>>
}

final class ServiceAPICall: ServiceAPICallProtocol {

    // MARK: - Private Methods

    private let session: Session

    // MARK: - Initializer

    init(session: Session = .default) {
        self.session = session
    }

    // MARK: - Internal Methods

    func request<T: Decodable>(request: APIRequest, type: T.Type) -> Observable<Result<T, NetworkError>> {
        return session.rx.request(request.method, "https://api.imgur.com/3/gallery/search/?q=cats", headers: request.headers)
            .responseData()
            .flatMapLatest { response, data -> Observable<Result<T, NetworkError>> in
                do {
                    return Observable<Result<T, NetworkError>>.create { observer in
                        debugPrint("\n####################################################\n")
                        debugPrint(" 🌐 URL: \(response.url?.description ?? "-")")
                        debugPrint(" 📣 STATUS CODE: \(response.statusCode)")
                        debugPrint(" 🚀 METHOD: \(request.method.rawValue)")
//                        debugPrint(" 🚀 Parameters: \(request.parameters ?? [:])")

                        guard (200..<400).contains(response.statusCode) else {
                            let error = NetworkError.httpResponseError(statusCode: response.statusCode)
                            debugPrint(" ❌ Finished With Error: \(error.localizedDescription)")
                            debugPrint(error.localizedDescription)

                            observer.onNext(.failure(error))
                            observer.onCompleted()
                            return Disposables.create()
                        }

                        do {
                            let decodedObject = try JSONDecoder().decode(type.self, from: data)
                            debugPrint(" ✅ Finished With Success")
                            debugPrint(" ✅ JSON OBJECT: \(decodedObject)")

                            observer.onNext(.success(decodedObject))
                        } catch {
                            let error = NetworkError.decodeError
                            debugPrint(" ❌ Finished With Error:")
                            debugPrint(error.localizedDescription)

                            observer.onNext(.failure(error))
                        }

                        observer.onCompleted()
                        return Disposables.create()
                    }
                }
            }
    }
}

