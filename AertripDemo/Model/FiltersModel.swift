//
//  FiltersModel.swift
//  AertripDemo
//
//  Created by Osama Mohammed Shaikh on 06/09/21.
//

import Foundation

struct FiltersModel: Codable {
    let success: Int
    let error: Int
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case error = "error"
        case data = "data"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let title: String
    let detail: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case detail = "detail"
    }
}
