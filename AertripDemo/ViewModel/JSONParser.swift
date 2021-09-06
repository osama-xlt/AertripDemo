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
    private var filters: FiltersModel?
    
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
    
    //MARK:- Itinary
    
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
    
    func departureTime(section: Int, row: Int) -> String {
        return (aertripData?.data.flights[section].results.j[row].dt)!
    }
    
    func flightTime(section: Int, row: Int) -> String {
        let flightTimeSecs = Double((aertripData?.data.flights[section].results.j[row].leg[0].tt)!)!
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated

        let formattedString = formatter.string(from: TimeInterval(flightTimeSecs))!
        return formattedString
    }
    
    func arrivalTime(section: Int, row: Int) -> String {
        return (aertripData?.data.flights[section].results.j[row].at)!
    }
    
    func departureCity(section: Int, row: Int) -> String {
        return (aertripData?.data.flights[section].results.j[row].leg[0].flights.first?.fr)!
    }
    
    func flightStops(section: Int, row: Int) -> String {
        let numberOfStops = Int((aertripData?.data.flights[section].results.j[row].leg[0].stp)!)!
        if numberOfStops == 0 {
            return ""
        } else if numberOfStops == 1 {
            let stopsStrings: String = (aertripData?.data.flights[section].results.j[row].leg[0].allAp[1])!
            return stopsStrings
        } else if numberOfStops == 2 {
            let firstStop = (aertripData?.data.flights[section].results.j[row].leg[0].allAp[1])!
            let secondStop = (aertripData?.data.flights[section].results.j[row].leg[0].allAp[2])!
            let stopsString: String = "\(firstStop)   \(secondStop)"
            return stopsString
        } else if numberOfStops > 2 {
            let stopsStrings: String = "\(numberOfStops) Stops"
            return stopsStrings
        }
        return ""
    }
    
    func arrivalCity(section: Int, row: Int) -> String {
        return (aertripData?.data.flights[section].results.j[row].leg[0].flights.last?.to)!
    }
    
    func flightFare(section: Int, row: Int) -> String {
        let fare: Int = (aertripData?.data.flights[section].results.j[row].farepr)!
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
    func sortByPriceLowToHigh() -> [J] {
        let numberOfSections = numberOfSections()
        var numberOfRowsInSections: [Int] = []
        for index in 0..<numberOfSections {
            numberOfRowsInSections.append(numberOfFlights(section: index))
        }
        var sections: [DataFlight] = []
        var rowsInSections: [J] = []
        for index in 0..<numberOfSections {
            sections.append((aertripData?.data.flights[index])!)
            for i in 0..<numberOfRowsInSections[index] {
                rowsInSections.append(sections[index].results.j[i])
            }
        }
        let sortByPriceLowToHigh = rowsInSections.sorted { (a, b) -> Bool in
            return a.farepr < b.farepr
        }
        return sortByPriceLowToHigh
    }
}
