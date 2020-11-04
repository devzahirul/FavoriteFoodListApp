//
//  FavFoodCollectionAdapter.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit

// Adapter/ DataSource  for showing Horizontal FoodList
class FavFoodAdapter: NSObject {
    
    var favFoodList = [FoodItem]() {
        didSet {
            // notify view if needed
        }
    }
    
    
    func undateList(favFoodList: [FoodItem]) {
        self.favFoodList = favFoodList
    }
}

extension FavFoodAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favFoodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = favFoodList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodInfoCollectionViewCell.id, for: indexPath) as! FoodInfoCollectionViewCell
        cell.foodNameLabel.text = food.name
        cell.foodImageView.image = UIImage(named:food.image)
        
        return cell
    }
    
    
}
