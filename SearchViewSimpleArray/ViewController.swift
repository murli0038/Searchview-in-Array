//
//  ViewController.swift
//  SearchViewSimpleArray
//
//  Created by Nikunj Prajapati on 25/12/19.
//  Copyright © 2019 Nikunj Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate
{
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var searching = false
    
    var Filterednames = [String]()
    
    var names = ["Nikunj","Tanu","Priyu","Yogesh","Motabhai","Kaju","Kajal","Chunchi","Vijay","Bhaijaan","Dhruv","Dhulo","Daivat","Shah","Mihir","Nilraj","raj","Ajay","Vedant","Devang","Chirag","Prajapati","Patel","Jarvish","Harsh","Krimal","Dhumda"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if searching
        {
            return Filterednames.count
        }
        else
        {
            return names.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell
        
        if searching
        {
            cell?.nameLbl.text = Filterednames[indexPath.row]
        }
        else
        {
            cell?.nameLbl.text = names[indexPath.row]
        }
        return cell!
    }
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
        {
            Filterednames = names.filter({$0.prefix(searchText.count) == searchText})
            searching = true
            tableView.reloadData()
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

