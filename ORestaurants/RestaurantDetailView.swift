//
//  RestaurantDetailView.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 13.09.2020.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 500)
                .clipped()
                .cornerRadius(10)
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true))
    }
}
