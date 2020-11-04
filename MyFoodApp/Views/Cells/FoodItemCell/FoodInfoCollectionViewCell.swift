//
//  FoodInfoCollectionViewCell.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit

class FoodInfoCollectionViewCell: UICollectionViewCell, CellInfoProtocol {

    // Food NameLabel
    @IBOutlet weak var foodNameLabel: UILabel!
    
    // Food ImageView
    @IBOutlet weak var foodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
