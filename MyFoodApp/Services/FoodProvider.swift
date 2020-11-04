//
//  FoodProvider.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import Foundation

/**
 *Service for manage Food data
 *
 */
class FoodProvider {
    /** Return Favorite Foods based on Section */
    static func fetchPersonFavoriteFoods(completionHandler:@escaping([FavFoodListItem])->Void) {
        // Create some FoodItem
        let food1 = FoodItem.init(name: "Pizza", image: "pizza")
        let food2 = FoodItem.init(name: "Pizza with Cut", image: "pizza_1")
        let food3 = FoodItem.init(name: "Pizza light", image: "pizza_2")
        let food4 = FoodItem.init(name: "Pizza c/a", image: "pizza")
        let food5 = FoodItem.init(name: "Pizza dark", image: "pizza")
        
        // Create a Favorite Food Array
        let favFoodList = [food1,food2,food3,food4,food5]
        
        // Create  PersonFavFoodItem object using Favorite Food list array
        // Person name, address and contact
        let personFood = PersonFavFoodItem.init(name: "Jowel", address: "Dhaka",contactNumber: "01789820", favFoods: favFoodList)
        let personFood1 = PersonFavFoodItem.init(name: "Hakim", address: "Dhaka",contactNumber: "0173", favFoods: favFoodList)
        
        // Create Favorite Food List Section / category
        let favFoodListItem1 = FavFoodListItem.init(sectionTitle: "Family", personFavFoodList: [personFood,personFood,personFood,personFood])
        let favFoodListItem2 = FavFoodListItem.init(sectionTitle: "Friends", personFavFoodList: [personFood1,personFood1,personFood1,personFood1])
        
        // Call completionHandler callback with Favorite Food List array .
        // Will display based on Section
        // Under Section will display person info and a Favorite Foods  horizontal list
        completionHandler([favFoodListItem1,favFoodListItem2])
        
    }
}
