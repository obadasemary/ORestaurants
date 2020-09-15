//
//  UserRegistrationViewModel.swift
//  ORestaurants
//
//  Created by Abdelrahman Mohamed on 15.09.2020.
//

import Foundation
import Combine

class UserRegistrationViewModel: ObservableObject {
    
    // Input
    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    
    // Output
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        
        $username
            .receive(on: RunLoop.main)
            .map { username in
                return username.count >= 4
            }
            .assign(to: \UserRegistrationViewModel.isUsernameLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \UserRegistrationViewModel.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \UserRegistrationViewModel.isPasswordCapitalLetter, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { (password, passwordConfirm) in
                return !passwordConfirm.isEmpty && (passwordConfirm == password)
            }
            .assign(to: \UserRegistrationViewModel.isPasswordConfirmValid, on: self)
            .store(in: &cancellableSet)
    }
}
