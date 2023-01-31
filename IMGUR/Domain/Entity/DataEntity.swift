//
//  DataEntity.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

struct DataEntity: Equatable {
    let data: [ImageEntity]
}

struct ImageEntity: Equatable {
    let id, title: String
    let link: String
}
