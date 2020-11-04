//
//  ViewController.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit




enum FavFoodSectionType {
    case section(sectionTitle:String,favFoodList:[PersonFavFoodItem])
}

class FavFoodListVC: UIViewController {

    @IBOutlet weak var myFoodTableView: UITableView!
    
    
    var favFoodSectionList: [FavFoodSectionType]!
    var adapter = PersonFavFoodAdapter.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        myFoodTableView.register(PersonFoodTableViewCell.nib, forCellReuseIdentifier: PersonFoodTableViewCell.id)
        
     
        
        favFoodSectionList = [FavFoodSectionType]()
       
        FoodProvider.fetchPersonFavoriteFoods {[weak self] (favFoodList) in
            
            guard let self = self else {return}
            
            for item in favFoodList {
                self.favFoodSectionList.append(.section(sectionTitle: item.sectionTitle, favFoodList: item.personFavFoodList))
            }
            
            self.myFoodTableView.dataSource = self.adapter
            self.myFoodTableView.delegate = self
            self.adapter.updateList(favFoodList: self.favFoodSectionList)
            self.myFoodTableView.reloadData()
        }
      
    }

}

extension FavFoodListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .blue
        }
    }
}



