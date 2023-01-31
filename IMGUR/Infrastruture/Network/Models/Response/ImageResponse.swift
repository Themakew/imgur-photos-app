//
//  ImageResponse.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

// MARK: - DataResponse

struct DataResponse: Decodable, Equatable {
    let data: [ImageResponse]
}

// MARK: - ImageResponse

struct ImageResponse: Decodable, Equatable {
    let id: String
    let title: String
    let link: String
}
