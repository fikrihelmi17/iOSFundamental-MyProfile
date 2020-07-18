//
//  ProfileModel.swift
//  MyProfile
//
//  Created by Fikri on 17/07/20.
//  Copyright © 2020 Fikri Helmi. All rights reserved.
//

import Foundation

struct ProfileModel {
    static let stateLoginKey = "state"
    static let nameKey = "name"
    static let emailKey =  "email"
    static let professionKey = "profession"
    
    static var stateLogin: Bool {
        get {
            return UserDefaults.standard.bool(forKey: stateLoginKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: stateLoginKey)
        }
    }
    
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey) 
        }
    }
    
    static var profession: String {
        get {
            UserDefaults.standard.string(forKey: professionKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: professionKey)
        }
    }
    
    static func deleteAll() -> Bool {
        if let domain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: domain)
            syncronize()
            return true
        } else {
            return false
        }
    }
    
    static func syncronize() {
        UserDefaults.standard.synchronize()
    }
}
