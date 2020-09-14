//
//  ORestaurantsApp.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 13.09.2020.
//

import SwiftUI

@main
struct ORestaurantsApp: App {
    
    var settingStore = SettingStore()
    
    var body: some Scene {
        WindowGroup {
            RestaurantListView(settingStore: SettingStore())
        }
    }
}
