//
//  PersonFoodTableViewCell.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit




class PersonFoodTableViewCell: UITableViewCell, CellInfoProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var fabListTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    // Horizontal collection view for showing Favorite foods name & image
    @IBOutlet weak var favFoodCollectionView: UICollectionView!
    
    // Style for current cell
    private struct Style {
        static let foodInfoCellSize: CGSize = CGSize.init(width: 200, height: 200)
    }
    
    
    // Adapter/ DataSource for favFoodCollectionView
    var adapter = FavFoodAdapter.init()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Register FoodInfo collection view cell for show Food info horizontally
        self.registerCollectionViewCells()
    }
    
    private func registerCollectionViewCells() {
        favFoodCollectionView.register(FoodInfoCollectionViewCell.nib, forCellWithReuseIdentifier: FoodInfoCollectionViewCell.id)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setupData(personFoodInf: PersonFavFoodItem) {
        // Setup current person name, address & contact
        self.nameLabel.text = "Name: \(personFoodInf.name)"
        self.contactLabel.text = "Contact: \(personFoodInf.contactNumber)"
        self.addressLabel.text = "Address: \(personFoodInf.address)"
        
        // For showing current person Favorite food list horizontal collectionView
        favFoodCollectionView.dataSource = adapter
        favFoodCollectionView.delegate = self
        // Update favorite food list into Adapter
        adapter.favFoodList = personFoodInf.favFoods
        // Reload collectionview
        favFoodCollectionView.reloadData()
    }
    
    override func prepareForReuse() {
        // Clear before reuse
        favFoodCollectionView.delegate = nil
        favFoodCollectionView.dataSource = nil
        super.prepareForReuse()
    }
}

extension PersonFoodTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Style.foodInfoCellSize
    }
}
