//
//  ItinaryViewController.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 02/09/21.
//

import UIKit
import TLYShyNavBar
import Presentr

class ItinaryViewController: UIViewController {
    
    private let jsonParser = JSONParser.jsonParser
    @IBOutlet weak var itinaryTableView: UITableView!
    var navigationBarHeight: CGFloat!
    lazy var presenter: Presentr = {
        let centerY = (navigationBarHeight * 2) + (self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height)! + 5
        let width = ModalSize.full
        let height = ModalSize.fluid(percentage: 0.70)
        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: 0, y: centerY))
        let customBackgroundViewOrigin = CGPoint(x: 0, y: centerY)
        let customBackgroundViewSize = CGSize.init(width: (self.view.window?.frame.width)!, height: (self.view.window?.frame.height)! - centerY)
        let customBackgroundViewFrame = CGRect.init(origin: customBackgroundViewOrigin, size: customBackgroundViewSize)
        let customBackgroundView = UIView.init(frame: customBackgroundViewFrame)
        customBackgroundView.backgroundColor = .black
        customBackgroundView.alpha = 0.5
        let customType = PresentationType.custom(width: width, height: height, center: center)
        
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverVerticalFromTop
        customPresenter.dismissTransitionType = .crossDissolve
        customPresenter.roundCorners = true
        customPresenter.cornerRadius = 8
        customPresenter.dismissOnSwipe = true
        customPresenter.backgroundColor = .clear
        customPresenter.backgroundOpacity = 0
        customPresenter.dismissOnSwipeDirection = .top
        customPresenter.customBackgroundView = customBackgroundView
        return customPresenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        setupTableView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupTabBarExtensionView()
    }
    
    func setupTableView() {
        itinaryTableView.dataSource = self
        itinaryTableView.delegate = self
        itinaryTableView.register(UINib(nibName: "ItinaryTableViewCell", bundle: nil), forCellReuseIdentifier: ItinaryTableViewCellID)
    }
    
    func setupTabBarExtensionView() {
        let tabBar = UITabBar(frame: CGRect(x: 0, y: 0, width: self.navigationController!.navigationBar.frame.size.width, height: navigationBarHeight))
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
        
        self.shyNavBarManager.scrollView = self.itinaryTableView
        self.shyNavBarManager.extensionView = tabBar
        self.shyNavBarManager.stickyExtensionView = true
    }
}

extension ItinaryViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            let sortVC = SortFilterViewController(nibName: "SortFilterViewController", bundle: nil)
            customPresentViewController(presenter, viewController: sortVC, animated: true)
        case 1:
            let sortVC = SortFilterViewController(nibName: "SortFilterViewController", bundle: nil)
            sortVC.modalPresentationStyle = .pageSheet
            self.present(sortVC, animated: true, completion: nil)
        case 2:
            let priceVC = PriceFilterViewController(nibName: "PriceFilterViewController", bundle: nil)
            priceVC.modalPresentationStyle = .pageSheet
            self.present(priceVC, animated: true, completion: nil)
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
