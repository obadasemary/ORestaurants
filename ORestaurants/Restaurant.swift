//
//  Restaurant.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 13.09.2020.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}
