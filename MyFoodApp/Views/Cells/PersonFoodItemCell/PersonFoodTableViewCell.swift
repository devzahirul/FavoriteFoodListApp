//
//  PersonFoodTableViewCell.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit




class PersonFoodTableViewCell: UITableViewCell, CellInfoProtocol {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var fabListTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var favFoodCollectionView: UICollectionView!
    
    var adapter = FavFoodAdapter.init()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favFoodCollectionView.register(FoodInfoCollectionViewCell.nib, forCellWithReuseIdentifier: FoodInfoCollectionViewCell.id)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setupData(personFoodInf: PersonFavFoodItem) {
        
        self.nameLabel.text = "Name: \(personFoodInf.name)"
        self.contactLabel.text = "Contact: \(personFoodInf.contactNumber)"
        self.addressLabel.text = "Address: \(personFoodInf.address)"
        
        favFoodCollectionView.dataSource = adapter
        favFoodCollectionView.delegate = self
        adapter.favFoodList = personFoodInf.favFoods
        favFoodCollectionView.reloadData()
    }
    
    override func prepareForReuse() {
        favFoodCollectionView.delegate = nil
        favFoodCollectionView.dataSource = nil
        super.prepareForReuse()
    }
}

extension PersonFoodTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 200, height: 200)
    }
}
