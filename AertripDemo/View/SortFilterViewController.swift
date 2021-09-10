//
//  SortFilterViewController.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 04/09/21.
//

import UIKit

class SortFilterViewController: UIViewController {
    
    weak var delegate: ButtonsDelegate?
    
    @IBOutlet weak var sortFilterTableView: UITableView!
    let jsonParser: JSONParser = JSONParser.jsonParser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeSortFilter()
    }
    
    func initializeSortFilter() {
        sortFilterTableView.delegate = self
        sortFilterTableView.dataSource = self
        sortFilterTableView.register(UINib(nibName: SortFilterTableViewCellID, bundle: nil), forCellReuseIdentifier: SortFilterTableViewCellID)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        switch jsonParser.actionType {
        case .sort(.price):
            let indexPath = IndexPath.init(row: 0, section: 0)
            sortFilterTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            sortFilterTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        case .sort(.duration):
            let indexPath = IndexPath.init(row: 1, section: 0)
            sortFilterTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            sortFilterTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        case .sort(.depart):
            let indexPath = IndexPath.init(row: 2, section: 0)
            sortFilterTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            sortFilterTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        case .sort(.arrival):
            let indexPath = IndexPath.init(row: 3, section: 0)
            sortFilterTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            sortFilterTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        default:break
        }
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
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SortFilterTableViewCell
        cell.accessoryType = .checkmark
        switch indexPath.row {
        case 0:
            jsonParser.actionType = .sort(.price)
            jsonParser.desiredAction()
        case 1:
            jsonParser.actionType = .sort(.duration)
            jsonParser.desiredAction()
        case 2:
            jsonParser.actionType = .sort(.depart)
            jsonParser.desiredAction()
        case 3:
            jsonParser.actionType = .sort(.arrival)
            jsonParser.desiredAction()
        default: break
        }
        delegate?.apply()
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
