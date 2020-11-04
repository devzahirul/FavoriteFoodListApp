//
//  CellInfoProtocol.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit

protocol CellInfoProtocol {
    static var id: String {get}
    static var nib: UINib {get}
}


extension CellInfoProtocol {
    static var id: String {
        let identifier = String.init(describing: self)
        return identifier
    }
    
    static var nib: UINib {
        return UINib.init(nibName: id, bundle: nil)
    }
}
