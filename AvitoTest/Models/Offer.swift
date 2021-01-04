//
//  Offer.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.
//

import Foundation

// MARK: - Offer
struct Offer: Codable {
    let status: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let title, actionTitle, selectedActionTitle: String
    let list: [Option]
}

// MARK: - List
struct Option: Codable {
    let id, title: String
    let optionDescription: String?
    private let icon: Icon
    let price: String
    let isSelected: Bool
    var imageStringUrl: String {
        return self.icon.the52X52
    }
    enum CodingKeys: String, CodingKey {
        case id, title
        case optionDescription = "description"
        case icon, price, isSelected
    }
}

// MARK: - Icon
struct Icon: Codable {
    let the52X52: String
    
    enum CodingKeys: String, CodingKey {
        case the52X52 = "52x52"
    }
}
