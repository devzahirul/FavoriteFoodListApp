//
//  ViewController.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit


// SectionType enum for identify section and list
//
// --Params: sectionTitle is used for TableView's Section Header title
// --Params: personfavFoodList is personList with favorite food list
//
enum FavFoodSectionType {
    case section(sectionTitle:String,personFavFoodList:[PersonFavFoodItem])
}

/** Show Favorite foods based on Section into a UITableView*/
class FavFoodListVC: UIViewController {

    // Style for current view
    private struct Style {
        // TableView cell height
        static let tableViewCellHeight: CGFloat = 400
    }
    
    
    // TableView for showing favorite food list
    @IBOutlet weak var myFoodTableView: UITableView!
    
    // SectionType Array
    var favFoodSectionList: [FavFoodSectionType]!
    // Person Favorite Food Adapter/DataSource for UITableView
    var adapter = PersonFavFoodAdapter.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register Cell
        self.registerCells()
        
        // Create favorite food section enum type array
        favFoodSectionList = [FavFoodSectionType]()
       
        self.fetchFavFoodList()
      
    }
    
    private func fetchFavFoodList() {
        // Call Food Provider service for fetch Favorite foods data
        FoodProvider.fetchPersonFavoriteFoods {[weak self] (favFoodList) in
            // Check is Self active
            guard let self = self else {return}
            
            // Loop through the fetched data
            // Create Section enum type
            // Append into favFoodSection enum type array
            for item in favFoodList {
                self.favFoodSectionList.append(.section(sectionTitle: item.sectionTitle, personFavFoodList: item.personFavFoodList))
            }
            self.updateTableViewListAfterfetchData()
        }
    }

    private func registerCells() {
        myFoodTableView.register(PersonFoodTableViewCell.nib, forCellReuseIdentifier: PersonFoodTableViewCell.id)
    }
    
    private func updateTableViewListAfterfetchData() {
        // Add adapter as TableView datasource
        self.myFoodTableView.dataSource = self.adapter
        // Add self ad TableView delegate
        self.myFoodTableView.delegate = self
        // Call update method of adapter
        self.adapter.updateList(favFoodList: self.favFoodSectionList)
        
        // Call reload tableview
        self.reloadTableView()
    }
    
    func reloadTableView() {
        // Reload tableview for update cells
        self.myFoodTableView.reloadData()
    }
}


//MARK: - UITableViewDelegate
extension FavFoodListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // return tableview cell height
        return Style.tableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Make tableview header section's title text colot blue
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .blue
        }
    }
}



