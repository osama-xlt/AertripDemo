//
//  SortFilterViewController.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 04/09/21.
//

import UIKit

class SortFilterViewController: UIViewController {
    
    @IBOutlet weak var sortFilterTableView: UITableView!
    let jsonParser: JSONParser = JSONParser.jsonParser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegatingView()
        
        initializeSortFilter()
    }
    
    func setDelegatingView() {
        if let delegatingView = view as? TouchDelegatingView {
            delegatingView.touchDelegate = presentingViewController?.view
        }
    }
    
    func initializeSortFilter() {
        sortFilterTableView.delegate = self
        sortFilterTableView.dataSource = self
        sortFilterTableView.register(UINib(nibName: SortFilterTableViewCellID, bundle: nil), forCellReuseIdentifier: SortFilterTableViewCellID)
    }
}


//MARK:- Table View Data Source

extension SortFilterViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonParser.numberOfFilters()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SortFilterTableViewCellID, for: indexPath) as! SortFilterTableViewCell
        cell.textLabel?.text = jsonParser.filterTitle(row: indexPath.row)
        cell.detailTextLabel?.text = jsonParser.filterDetail(row: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let indexPathsForSelectedRows = tableView.indexPathsForSelectedRows ?? [IndexPath]()
        
        // If there is a selected cell in |indexPath.section|, do nothing
        for selectedIndexPath in indexPathsForSelectedRows {
            if selectedIndexPath.section == indexPath.section {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
                tableView.cellForRow(at: selectedIndexPath)?.accessoryType = .none
            }
        }
        
        return indexPath;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SortFilterTableViewCell
        cell.accessoryType = .checkmark
    }
}

//MARK:- Table View Delegate

extension SortFilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
