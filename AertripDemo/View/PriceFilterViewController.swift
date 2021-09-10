//
//  PriceFilterViewController.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 04/09/21.
//

import UIKit
import SwiftRangeSlider

class PriceFilterViewController: UIViewController {
    
    weak var delegate: ButtonsDelegate?
    
    @IBOutlet weak var minPrice: UILabel!
    @IBOutlet weak var maxPrice: UILabel!
    @IBOutlet weak var rangeSlider: RangeSlider!
    
    var flightSection: Int!
    let jsonParser: JSONParser = JSONParser.jsonParser
    var minMaxPrice: (Double, Double)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeVC()
    }
    
    func initializeVC() {
        minMaxPrice = jsonParser.minMaxPrice(section: flightSection ?? 0)
        
        initializeRangeSlider()
    }
    
    func initializeRangeSlider() {
        let minPriceValue = minMaxPrice.0
        let maxPriceValue = minMaxPrice.1
        minPrice.text = "\u{20B9} " + rangeSlider.getLabelText(forValue: minPriceValue)
        maxPrice.text = "\u{20B9} " + rangeSlider.getLabelText(forValue: maxPriceValue)
        
        rangeSlider.lowerValue = minMaxPrice.0
        rangeSlider.upperValue = minMaxPrice.1
        rangeSlider.minimumValue = minMaxPrice.0
        rangeSlider.maximumValue = minMaxPrice.1
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rangeSlider.updateLayerFramesAndPositions()
    }
    
    @IBAction func updateValues(_ sender: RangeSlider) {
        jsonParser.actionType = .filter
        jsonParser.updateMinMaxPrice(min: Int(sender.lowerValue), max: Int(sender.upperValue))
        
        let minPriceValue = sender.lowerValue
        let maxPriceValue = sender.upperValue
        minPrice.text = "\u{20B9} " + sender.getLabelText(forValue: minPriceValue)
        maxPrice.text = "\u{20B9} " + sender.getLabelText(forValue: maxPriceValue)
        
        jsonParser.desiredAction()
        delegate?.apply()
    }
}
