//
//  Configurable.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

protocol Configurable: AnyObject {
    associatedtype Configuration

    func configure(content: Configuration)
}
