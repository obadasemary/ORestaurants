//
//  FullImageRow.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 13.09.2020.
//

import SwiftUI

struct FullImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct FullImageRow_Previews: PreviewProvider {
    static var previews: some View {
        FullImageRow(restaurant: restaurants[0])
    }
}
