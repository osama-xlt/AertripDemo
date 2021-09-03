//
//  JSONParser.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 03/09/21.
//

import Foundation

class JSONParser {
    
    static let jsonParser = JSONParser()
    
    private var aertripData: AertripModel?
    
    init() {
        if let path = Bundle.main.path(forResource: "AertripData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                aertripData = try JSONDecoder().decode(AertripModel.self, from: data)
            } catch {
                // handle error
            }
        }
    }
    
    func numberOfSections() -> Int {
        var numberOfSections: Int = 0
        if let flights = aertripData?.data.flights {
            numberOfSections = flights.count
        }
        return numberOfSections
    }
    
    func numberOfFlights(section: Int) -> Int {
        var numberOfFlights: Int = 0
        if let flights = aertripData?.data.flights {
            numberOfFlights = flights[section].results.jCount
        }
        return numberOfFlights
    }
    
    func airlineLogo(section: Int, row: Int) -> String {
        return (aertripData?.data.flights[section].results.j[row].al[0].rawValue)!
    }
    
    func airlineName(section: Int, row: Int) -> String {
        let flightKey: String = (aertripData?.data.flights[section].results.j[row].al[0].rawValue)!
        let flightNames = (aertripData?.data.flights[section].results.aldet.allProperties())
        return flightNames![flightKey.lowercased()] as! String
    }
}
