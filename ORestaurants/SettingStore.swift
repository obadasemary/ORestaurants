//
//  SettingStore.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 14.09.2020.
//

import Foundation

final class SettingStore {
    
    var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        
        self.defaults = defaults
        
        defaults.register(defaults: [
            "view.preferences.showCheckInOnly" : false,
            "view.preferences.displayOrder" : 0,
            "view.preferences.maxPriceLevel" : 5
            
        ])
    }
    
    var showCheckInOnly: Bool {
        
        get {
            
            defaults.bool(forKey: "view.preferences.showCheckInOnly")
        }
        
        set {
            
            defaults.set(newValue, forKey: "view.preferences.showCheckInOnly")
        }
    }
    
    var displayOrder: DisplayOrderType {
        
        get {
            
            DisplayOrderType(type: defaults.integer(forKey: "view.preferences.displayOrder"))
        }
        
        set {
            
            defaults.set(newValue.rawValue, forKey: "view.preferences.displayOrder")
        }
    }
    
    var maxPriceLevel: Int {
        
        get {
            
            defaults.integer(forKey: "view.preferences.maxPriceLevel")
        }
        
        set {
            
            defaults.set(newValue, forKey: "view.preferences.maxPriceLevel")
        }
    }
}

enum DisplayOrderType: Int, CaseIterable {
    
    case alphabetical = 0
    case favoriteFirst = 1
    case checkInFirst = 2
    
    init(type: Int) {
        
        switch type {
        case 0:
            self = .alphabetical
        case 1:
            self = .favoriteFirst
        case 2:
            self = .checkInFirst
        default:
            self = .alphabetical
        }
    }
    
    var text: String {
        
        switch self {
        case .alphabetical:
            return "Alphabetical"
        case .favoriteFirst:
            return "Show Favorite First"
        case .checkInFirst:
            return "Show Check-in First"
        }
    }
}
