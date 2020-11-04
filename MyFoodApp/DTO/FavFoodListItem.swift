//
//  PersonFoodItem.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import Foundation

/**Single Food Item Model */
struct FoodItem {
    let name: String
    let image: String
}

/** Person Item with Favorite food list*/
struct PersonFavFoodItem {
    let name: String
    let address: String
    let contactNumber: String
    let favFoods: [FoodItem]
}

/**Section Item with Person Favorite food list  */
struct FavFoodListItem {
    let sectionTitle: String
    let personFavFoodList: [PersonFavFoodItem]
}
