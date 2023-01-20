//
//  LocalData.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 19/1/23.
//

import Foundation

class LocalData{
    
    private static let token = "token"
    
    static let shared = LocalData()
    
    func saveToken(token: String){
        return UserDefaults.standard.set(token, forKey: Self.token)
    }
    
    func fetchToken()-> String{
        return UserDefaults.standard.string(forKey: Self.token) ?? ""
    }
    
    func userIsLogged()->Bool{
        return !fetchToken().isEmpty
    }
}
