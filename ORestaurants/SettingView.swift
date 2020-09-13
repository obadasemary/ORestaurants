//
//  SettingView.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 14.09.2020.
//

import SwiftUI

struct SettingView: View {
    
    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-in First"]
    @State private var selectedOrder = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(0 ..< displayOrders.count, id: \.self) {
                            Text(self.displayOrders[$0])
                        }
                    }
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Text("Filters")
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
