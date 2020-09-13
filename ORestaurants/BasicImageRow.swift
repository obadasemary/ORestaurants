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
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(restaurant.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text(String(repeating: "$", count: restaurant.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text(restaurant.type)
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Text(restaurant.phone)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
                .layoutPriority(-100)
            
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            if restaurant.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct BasicImageRow_Previews: PreviewProvider {
    static var previews: some View {
        BasicImageRow(restaurant: Restaurant(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true))
    }
}
