//
//  RequirementText.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 14.09.2020.
//

import SwiftUI

struct RequirementText: View {
    
    var iconName = "xmark.square"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    
    var text = ""
    var isStrikeThrough = false
    
    var body: some View {
        
        HStack {
            
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(isStrikeThrough)
            
            Spacer()
        }
    }
}

struct RequirementText_Previews: PreviewProvider {
    static var previews: some View {
        RequirementText()
    }
}
