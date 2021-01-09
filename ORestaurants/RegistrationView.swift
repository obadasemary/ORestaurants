//
//  RegistrationView.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 14.09.2020.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var isPresented = false
    
    @State private var username = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    
    @ObservedObject private var userRegistrationViewModel = UserRegistrationViewModel()
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("Create an account")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .padding(.bottom, 30)
                
                FormField(fieldName: "Username", fieldValue: $userRegistrationViewModel.username)
                RequirementText(
                    iconColor: userRegistrationViewModel.isUsernameLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                    text: "A minimum of 4 characters",
                    isStrikeThrough: userRegistrationViewModel.isUsernameLengthValid
                )
                .padding()
                
                FormField(fieldName: "Password", fieldValue: $userRegistrationViewModel.password, isSecure: true)
                VStack {
                    
                    RequirementText(
                        iconName: "lock.open",
                        iconColor: userRegistrationViewModel.isPasswordLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                        text: "A minimum of 8 characters",
                        isStrikeThrough: userRegistrationViewModel.isPasswordLengthValid
                    )
                    RequirementText(
                        iconName: "lock.open",
                        iconColor: userRegistrationViewModel.isPasswordCapitalLetter ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                        text: "One uppercase letter",
                        isStrikeThrough: userRegistrationViewModel.isPasswordCapitalLetter
                    )
                }
                .padding()
                
                FormField(fieldName: "Confirm Password", fieldValue: $userRegistrationViewModel.passwordConfirm, isSecure: true)
                RequirementText(
                    iconColor: userRegistrationViewModel.isPasswordConfirmValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255),
                    text: "Your confirm password should be the same as password",
                    isStrikeThrough: userRegistrationViewModel.isPasswordConfirmValid
                )
                .padding()
                .padding(.bottom, 50)
                
                Button(action: {
                    self.isPresented.toggle()
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
                .disabled(
                    !userRegistrationViewModel.isReadySubmit
//                    !userRegistrationViewModel.isUsernameLengthValid ||
//                        !userRegistrationViewModel.isPasswordLengthValid ||
//                        !userRegistrationViewModel.isPasswordCapitalLetter ||
//                        !userRegistrationViewModel.isPasswordConfirmValid
                )
                .fullScreenCover(isPresented: $isPresented, content: {
                    RestaurantListView().environmentObject(SettingStore())
                })
                
                HStack {
                    
                    Text("Already have an account?")
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Button(action: {
                        self.isPresented.toggle()
                    }, label: {
                        Text("Sign in")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                    })
                    //                    .sheet(isPresented: $isPresented, content: {
                    //                        RestaurantListView().environmentObject(SettingStore())
                    //                    })
                    .fullScreenCover(isPresented: $isPresented, content: {
                        RestaurantListView().environmentObject(SettingStore())
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
