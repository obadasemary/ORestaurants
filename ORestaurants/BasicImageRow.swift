//
//  BasicImageRow.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 13.09.2020.
//

import SwiftUI

struct BasicImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            
            Text(restaurant.name)
        }
    }
}

struct BasicImageRow_Previews: PreviewProvider {
    static var previews: some View {
        BasicImageRow(restaurant: restaurants[0])
    }
}
