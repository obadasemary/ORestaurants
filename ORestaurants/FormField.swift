//
//  FormField.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 14.09.2020.
//

import SwiftUI

struct FormField: View {
    
    var fieldName = ""
    @Binding var fieldValue: String
    
    var isSecure = false
    
    var body: some View {
        
        VStack {
            
            if isSecure {
                
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            } else {
                
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        }
    }
}

//struct FormField_Previews: PreviewProvider {
//    static var previews: some View {
//        
////        @Binding var fieldValue: String = "obada"
////
////        FormField(fieldName: "Obada", fieldValue: fieldValue, isSecure: false)
////        FormField(fieldName: "Password", fieldValue: <#T##Binding<String>#>, isSecure: <#T##Bool#>)
//    }
//}
