//
//  FavFoodCollectionAdapter.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit

class FavFoodAdapter: NSObject {
    
    var favFoodList = [FoodInfo]() {
        didSet {
            
        }
    }
    
    
    func undateList(favFoodList: [FoodInfo]) {
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
