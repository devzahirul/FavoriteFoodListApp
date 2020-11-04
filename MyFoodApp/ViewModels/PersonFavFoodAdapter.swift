//
//  PersonFavFoodAdapter.swift
//  MyFoodApp
//
//  Created by Islam Md. Zahirul on 3/11/20.
//

import UIKit

class PersonFavFoodAdapter: NSObject {
    
    var favFoodList = [FavFoodSectionType]() {
        didSet {
            //notify tableview if need reload 
        }
    }
    
    
    func updateList(favFoodList: [FavFoodSectionType]) {
        self.favFoodList = favFoodList
    }
    
}

extension PersonFavFoodAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.favFoodList.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (self.favFoodList[section]) {
        case .section(sectionTitle: _, favFoodList: let personFavFoods):
            return personFavFoods.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonFoodTableViewCell.id) as! PersonFoodTableViewCell
        
        switch (self.favFoodList[indexPath.section]) {
        case .section(sectionTitle: _, favFoodList: let list):
           
            let person = list[indexPath.row]
            //person.address
            cell.setupData(personFoodInf: person)
            return cell
            
       
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (self.favFoodList[section]) {
        case .section(sectionTitle: let sectionTitle, favFoodList: _):
            return sectionTitle
        }
    }
    
}
