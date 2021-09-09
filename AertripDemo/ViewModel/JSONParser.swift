//
//  JSONParser.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 03/09/21.
//

import Foundation

enum ActionType {
    enum SortType {
        case price
        case duration
        case depart
        case arrival
    }
    
    case sort(SortType)
    case filter
    case defaultAction
}

class JSONParser {
    
    public var actionType: ActionType = .defaultAction
    
    static let jsonParser = JSONParser()
    
    private var aertripData: AertripModel?
    private var filters: FiltersModel?
    
    private var j: [J]!
    
    init() {
        if let path = Bundle.main.path(forResource: "AertripData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                aertripData = try JSONDecoder().decode(AertripModel.self, from: data)
            } catch {
                // handle error
            }
        }
        if let path = Bundle.main.path(forResource: "SortFilterData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                filters = try JSONDecoder().decode(FiltersModel.self, from: data)
            } catch {
                // handle error
            }
        }
    }
    
    func defaultAction() {
        let numberOfSections = aertripData?.data.flights.count
        var numberOfRowsInSections: [Int] = []
        for index in 0..<numberOfSections! {
            numberOfRowsInSections.append((aertripData?.data.flights[index].results.jCount)!)
        }
        var sections: [DataFlight] = []
        var rowsInSections: [J] = []
        for index in 0..<numberOfSections! {
            sections.append((aertripData?.data.flights[index])!)
            for i in 0..<numberOfRowsInSections[index] {
                rowsInSections.append(sections[index].results.j[i])
            }
        }
        j = rowsInSections
    }
    
    //MARK:- Itinary
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfFlights(section: Int) -> Int {
        return j.count
    }
    
    func airlineLogo(section: Int, row: Int) -> String {
        return j[row].al[0].rawValue
    }
    
    func airlineName(section: Int, row: Int) -> String {
        let flightKey: String = j[row].al[0].rawValue
        let flightNames = (aertripData?.data.flights[section].results.aldet.allProperties())
        return flightNames![flightKey.lowercased()] as! String
    }
    
    func departureTime(section: Int, row: Int) -> String {
        return j[row].dt
    }
    
    func flightTime(section: Int, row: Int) -> String {
        let flightTimeSecs = Double(j[row].leg[0].tt)!
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        let formattedString = formatter.string(from: TimeInterval(flightTimeSecs))!
        return formattedString
    }
    
    func arrivalTime(section: Int, row: Int) -> String {
        return j[row].at
    }
    
    func departureCity(section: Int, row: Int) -> String {
        return j[row].leg[0].flights.first!.fr
    }
    
    func flightStops(section: Int, row: Int) -> String {
        let numberOfStops = Int(j[row].leg[0].stp)!
        if numberOfStops == 0 {
            return ""
        } else if numberOfStops == 1 {
            let stopsStrings: String = j[row].leg[0].allAp[1]
            return stopsStrings
        } else if numberOfStops == 2 {
            let firstStop = j[row].leg[0].allAp[1]
            let secondStop = j[row].leg[0].allAp[2]
            let stopsString: String = "\(firstStop)   \(secondStop)"
            return stopsString
        } else if numberOfStops > 2 {
            let stopsStrings: String = "\(numberOfStops) Stops"
            return stopsStrings
        }
        return ""
    }
    
    func arrivalCity(section: Int, row: Int) -> String {
        return j[row].leg[0].flights.last!.to
    }
    
    func flightFare(section: Int, row: Int) -> String {
        let fare: Int = j[row].farepr
        return "\u{20B9} " + String(fare)
    }
    
    //MARK:- Filtering
    
    func minMaxPrice(section: Int) -> (Double, Double) {
        let minPrice = Double((aertripData?.data.flights[section].results.f.first?.pr.minPrice)!)
        let maxPrice = Double((aertripData?.data.flights[section].results.f.first?.pr.maxPrice)!)
        let minMaxPrice = (minPrice, maxPrice)
        return minMaxPrice
    }
    
    func numberOfFilters() -> Int {
        return (filters?.data.count)!
    }
    
    func filterTitle(row: Int) -> String {
        return (filters?.data[row].title)!
    }
    
    func filterDetail(row: Int) -> String {
        return (filters?.data[row].detail)!
    }
    
    //MARK:- Sorting
    func sortBy() {
        
    }
    
    private func sortByPriceLowToHigh() -> [J] {
        let sortByPriceLowToHigh = j.sorted { (a, b) -> Bool in
            return a.farepr < b.farepr
        }
        return sortByPriceLowToHigh
    }
    
    private func sortByDurationLowToHigh() -> [J] {
        let sortByDurationLowToHigh = j.sorted { (a, b) -> Bool in
            return a.tt[0] < b.tt[0]
        }
        return sortByDurationLowToHigh
    }
    
    private func sortByDepartLowToHigh() -> [J] {
        let sortByDepartLowToHigh = j.sorted { (a, b) -> Bool in
            return Int(a.dt)! < Int(b.dt)!
        }
        return sortByDepartLowToHigh
    }
    
    private func sortByArrivalLowToHigh() -> [J] {
        let sortByArrivalLowToHigh = j.sorted { (a, b) -> Bool in
            return Int(a.at)! < Int(b.at)!
        }
        return sortByArrivalLowToHigh
    }
}
