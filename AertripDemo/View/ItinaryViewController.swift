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
        let height = ModalSize.fluid(percentage: 0.50)
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
        customPresenter.dismissOnSwipe = false
        customPresenter.customBackgroundView = customBackgroundView
        return customPresenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVC()
        setupTableView()
    }
    
    func initializeVC() {
        navigationBarHeight = self.navigationController!.navigationBar.frame.size.height
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let navBarTitleView: UIView = (Bundle.main.loadNibNamed("NavBarTitleView", owner: nil, options: nil)?.first as! UIView)
        self.navigationController?.navigationBar.addSubview(navBarTitleView)
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
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 1
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        
        UITabBar.appearance().tintColor = UIColor(red: 96/255, green: 210/255, blue: 153/255, alpha: 1)
        UITabBar.appearance().barTintColor = .systemGray6
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1 * tabBar.frame.height / 2 + (tabBar.frame.height / 4) - 5)
        
        let fontSize:CGFloat = 20
        let font:UIFont = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor : UIColor.darkText]
        
        var tabBarItems: [UITabBarItem] = []
        
        let filterTabBarItem = UITabBarItem()
        filterTabBarItem.badgeColor = .red
        filterTabBarItem.image = UIImage(named: "filterIcon")
        filterTabBarItem.tag = 0
        filterTabBarItem.imageInsets = UIEdgeInsets.init(top: 8, left: 8, bottom: 3, right: 8)
        tabBarItems.append(filterTabBarItem)
        
        let sortFilterTabBarItem = UITabBarItem()
        sortFilterTabBarItem.badgeColor = UIColor(red: 96/255, green: 210/255, blue: 153/255, alpha: 1)
        sortFilterTabBarItem.title = "Sort"
        sortFilterTabBarItem.setTitleTextAttributes(attributes, for: .normal)
        sortFilterTabBarItem.tag = 1
        tabBarItems.append(sortFilterTabBarItem)
        
        let priceFilterTabBarItem = UITabBarItem()
        priceFilterTabBarItem.badgeColor = UIColor(red: 96/255, green: 210/255, blue: 153/255, alpha: 1)
        priceFilterTabBarItem.title = "Price"
        priceFilterTabBarItem.setTitleTextAttributes(attributes, for: .normal)
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
            customPresentViewController(presenter, viewController: sortVC, animated: true)
        case 2:
            let priceVC = PriceFilterViewController(nibName: "PriceFilterViewController", bundle: nil)
            customPresentViewController(presenter, viewController: priceVC, animated: true)
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
