//
//  PersonFoodItem.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import Foundation

struct FoodItem {
    let name: String
    let image: String
}


struct PersonFavFoodItem {
    let name: String
    let address: String
    let contactNumber: String
    let favFoods: [FoodItem]
}
