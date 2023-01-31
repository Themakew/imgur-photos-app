//
//  UIView+Misc.swift
//  IMGUR
//
//  Created by Ruyther Costa on 31/01/23.
//

import UIKit

extension UIView {
    convenience init(translateMask: Bool) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = translateMask
    }
}
