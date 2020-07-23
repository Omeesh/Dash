//
//  ViewController.swift
//  Dash
//
//  Created by Omeesh Sharma on 22/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var table: UITableView!
    
    //MARK: VARIABLES
    let viewModel = StoresViewModel()
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.tableFooterView = UIView()
        
        //Fetch Data
        self.viewModel.getDetails {
            self.table.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell")as! HeaderTableViewCell
        cell.headerTitle.text = self.viewModel.sectionNames[section]
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell")as! ItemsTableViewCell
        
        if self.viewModel.sectionNames[indexPath.section] == "Category"{
            //Category Cell
            cell.setupCategoryCell(models: self.viewModel.categories)
        } else{
            //Stores Cell
            cell.setupStoresCell(models: self.viewModel.storesSections[indexPath.row], type: self.viewModel.sectionNames[indexPath.section])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.viewModel.sectionNames[indexPath.section] {
        case "Category": //Category Cell
            return tableView.frame.height / 4
        default: //Stores Cell
            return tableView.frame.height / 3
        }
    }
    
    
}

