//
//  ItinaryViewController.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 02/09/21.
//

import UIKit
import TLYShyNavBar
import DottedLineView

class ItinaryViewController: UIViewController {
    
    private let jsonParser = JSONParser.jsonParser
    @IBOutlet weak var itinaryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        setupTabBarExtensionView()
    }
    
    func setupTableView() {
        itinaryTableView.dataSource = self
        itinaryTableView.delegate = self
        itinaryTableView.register(UINib(nibName: "ItinaryTableViewCell", bundle: nil), forCellReuseIdentifier: ItinaryTableViewCellID)
    }
    
    func setupTabBarExtensionView() {
        let tabBar = UITabBar(frame: CGRect(x: 0, y: 0, width: self.navigationController!.navigationBar.frame.size.width, height: self.navigationController!.navigationBar.frame.size.height))
        tabBar.delegate = self
        
        var tabBarItems: [UITabBarItem] = []
        
        let filterTabBarItem = UITabBarItem()
        filterTabBarItem.badgeColor = .red
        filterTabBarItem.image = UIImage(named: "filterIcon")
        filterTabBarItem.tag = 0
        tabBarItems.append(filterTabBarItem)
        
        let sortFilterTabBarItem = UITabBarItem()
        sortFilterTabBarItem.badgeColor = UIColor(red: 96/255, green: 210/255, blue: 153/255, alpha: 1)
        sortFilterTabBarItem.title = "Sort"
        sortFilterTabBarItem.tag = 1
        tabBarItems.append(sortFilterTabBarItem)
        
        let priceFilterTabBarItem = UITabBarItem()
        priceFilterTabBarItem.badgeColor = UIColor(red: 96/255, green: 210/255, blue: 153/255, alpha: 1)
        priceFilterTabBarItem.title = "Price"
        priceFilterTabBarItem.tag = 2
        tabBarItems.append(priceFilterTabBarItem)
        
        tabBar.setItems(tabBarItems, animated: false)
        
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor(red: 96/255, green: 210/255, blue: 153/255, alpha: 1), size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height))
        
        self.shyNavBarManager.extensionView = tabBar
        self.shyNavBarManager.stickyExtensionView = true
    }
}

extension ItinaryViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        modalPresentationStyle = .pageSheet
        switch item.tag {
        case 0:
            let sortVC = SortFilterViewController(nibName: "SortFilterViewController", bundle: nil)
            show(sortVC, sender: self)
        case 1:
            let sortVC = SortFilterViewController(nibName: "SortFilterViewController", bundle: nil)
            show(sortVC, sender: self)
        case 2:
            let priceVC = PriceFilterViewController(nibName: "PriceFilterViewController", bundle: nil)
            show(priceVC, sender: self)
        default:
            return
        }
    }
}

//MARK:- Table View Data Source

extension ItinaryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return jsonParser.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonParser.numberOfFlights(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItinaryTableViewCellID, for: indexPath) as! ItinaryTableViewCell
        cell.flightLogo.image = UIImage(named: jsonParser.airlineLogo(section: indexPath.section, row: indexPath.row))
        cell.flightName.text = jsonParser.airlineName(section: indexPath.section, row: indexPath.row)
        cell.departureTime.text = jsonParser.departureTime(section: indexPath.section, row: indexPath.row)
        cell.flightTime.text = jsonParser.flightTime(section: indexPath.section, row: indexPath.row)
        cell.landingTime.text = jsonParser.arrivalTime(section: indexPath.section, row: indexPath.row)
        cell.flightOrigin.text = jsonParser.departureCity(section: indexPath.section, row: indexPath.row)
        cell.flightStops.text = jsonParser.flightStops(section: indexPath.section, row: indexPath.row)
        cell.flightDestination.text = jsonParser.arrivalCity(section: indexPath.section, row: indexPath.row)
        
        cell.flightFare.text = jsonParser.flightFare(section: indexPath.section, row: indexPath.row)
        
        cell.layoutIfNeeded()
        
//        let acceptedWidthOne = cell.directionOne.frame.size.width - (cell.flightOrigin.frame.width / 2) - (cell.flightStops.frame.width / 2) - (cell.flightDestination.frame.width / 2)
//
//        cell.directionOne.frame = CGRect(x: cell.directionOne.frame.origin.x, y: cell.directionOne.frame.origin.y, width: acceptedWidthOne, height: cell.directionOne.frame.size.height)
//
//        cell.directionOne.updateConstraints()
//
//        let acceptedWidthTwo = cell.directionTwo.frame.size.width - (cell.flightOrigin.frame.width / 2) - (cell.flightStops.frame.width / 2) - (cell.flightDestination.frame.width / 2)
//
//        cell.directionTwo.frame = CGRect(x: cell.directionTwo.frame.origin.x, y: cell.directionTwo.frame.origin.y, width: acceptedWidthTwo, height: cell.directionTwo.frame.size.height)
//
//        cell.directionTwo.updateConstraints()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellToBe = cell as! ItinaryTableViewCell
        
        cellToBe.layoutIfNeeded()
        
        cellToBe.directionOne.addDashedBorder()
        cellToBe.directionTwo.addDashedBorder()
    }
}

//MARK:- Table View Delegate

extension ItinaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
