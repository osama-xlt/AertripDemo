//
//  ItinaryTableViewCell.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 03/09/21.
//

import UIKit

let ItinaryTableViewCellID = "ItinaryTableViewCell"

class ItinaryTableViewCell: UITableViewCell {

    @IBOutlet weak var flightLogo: UIImageView!
    @IBOutlet weak var flightName: UILabel!
    @IBOutlet weak var departureTime: UILabel!
    @IBOutlet weak var flightTime: UILabel!
    @IBOutlet weak var landingTime: UILabel!
    @IBOutlet weak var flightOrigin: UILabel!
    @IBOutlet weak var directionOne: UIView!
    @IBOutlet weak var flightStops: UILabel!
    @IBOutlet weak var directionTwo: UIView!
    @IBOutlet weak var flightDestination: UILabel!
    @IBOutlet weak var flightFare: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
