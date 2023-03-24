//
//  Constants.swift
//  Coffee Now
//
//  Created by Nuriddin Jumayev on 14/03/23.
//

import UIKit

public let windowHeight = UIScreen.main.bounds.height
public let windowWidth =  UIScreen.main.bounds.width
public let windowStatusBarHeight = UIApplication.shared.statusBarFrame.height


enum LoginHeaferType {
    case login
    case register
    case addressSetup
    case forgotPassword
    
    
    var title: String? {
        switch self {
        case .login: return "Login"
        case .register: return "Register"
        case .addressSetup: return "Address Setup"
        case .forgotPassword: return "Forgot Password"
        }
    }
}


enum BtnType {
    
    case login
    case register
    case addressSetup
    case forgotPassword
    
    
    var buttonTitle: String {
        switch self {
        case .login: return "Login"
        case .register: return "Register"
        case .addressSetup: return "Address Setup"
        case .forgotPassword: return "Reset Password"
        }
    }
    
    var registerSkipLabel: String {
        switch self {
        case .login: return "Don't have an account?"
        case .register: return "Already have an account?"
        case .addressSetup: return "Skip for now"
        case .forgotPassword: return ""
        }
    }
}

enum TextFieldInputType {
    case email
    case password
    case fullname
    case phoneNumber
    case addressLine1
    case addressLine2
    case zipCode
    case city
    case country
    
    var titleLabel: String {
        switch self {
        case .email: return "Email"
        case .password: return "Password"
        case .fullname: return "Fullname"
        case .phoneNumber: return "Phone Number"
        case .addressLine1: return "Address Line 1"
        case .addressLine2: return "Address Line 2"
        case .zipCode: return "ZIP Code"
        case .city: return "City"
        case .country: return "Country"
        }
    }
    
    var placeHolderLabel: String {
        switch self {
        case .email: return "exmpl@mail.com"
        case .password: return "********"
        case .fullname: return "Jason Ranti"
        case .phoneNumber: return "+8210-8493-****"
        case .addressLine1: return "Address"
        case .addressLine2: return "Address"
        case .zipCode: return "0222"
        case .city: return "Jakarta"
        case .country: return "Country"
        }
    }
}
