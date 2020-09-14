//
//  RegistrationView.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 14.09.2020.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("Create an account")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .padding(.bottom, 30)
                
                FormField(fieldName: "Username", fieldValue: $username)
                RequirementText(text: "A minimum of 4 characters")
                    .padding()
                
                FormField(fieldName: "Password", fieldValue: $password, isSecure: true)
                VStack {
                    
                    RequirementText(iconName: "lock.open", text: "A minimum of 8 characters", isStrikeThrough: false)
                    RequirementText(iconName: "lock.open", text: "One uppercase letter", isStrikeThrough: false)
                }
                .padding()
                
                FormField(fieldName: "Confirm Password", fieldValue: $password, isSecure: true)
                RequirementText(text: "Your confirm password should be the same as password", isStrikeThrough: false)
                    .padding()
                    .padding(.bottom, 50)
                
                Button(action: {
                    
                }, label: {
                    Text("Sign Up")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color(red: 251/255, green: 128/255, blue: 128/255),
                                        Color(red: 253/255, green: 193/255, blue: 104/255)
                                    ]
                                ),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                
                HStack {
                    
                    Text("Already have an account?")
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Sign in")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                    })
                }
                .padding(.top, 50)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}