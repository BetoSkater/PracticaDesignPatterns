//
//  Networking.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 18/1/23.
//

import Foundation

enum NetworkError: Error{
    case malformedURL
    case noData
    case statusCode(code: Int?)
    case decodingFailed
    case unknown
}

final class Networking{
    
    static let shared = Networking()
    
    //MARK: -LogIn-
    
    func login(userModel: LogInModel, completion: @escaping (String?, Error?) -> Void){
        //URL generation:
        guard let url = URL(string: Constants.apiBaseUrl+Constants.loginEP) else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        //entry mode encoding
        let loginString = "\(userModel.email):\(userModel.password)"
        let loginData: Data = loginString.data(using: .utf8)!
        let base64 = loginData.base64EncodedString()
        
        //URLRequest
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Constants.post
        urlRequest.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
        //Task:
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else{
                completion(nil, error)
                return
            }
            guard let data = data else{
                completion(nil, NetworkError.noData)
                return
            }
        
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                completion(nil, NetworkError.statusCode(code: statusCode))
                print("MSG error: status code 401: no autorizado")
                return
            }
            
            guard let token = String(data: data, encoding: .utf8) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            completion(token, nil)
            
        }.resume()
    }
    
    //MARK: - LogIn VIPER -
    
    func loginViper(userModel: LogInViperModel, completion: @escaping (String?, Error?) -> Void){
        //URL generation:
        guard let url = URL(string: Constants.apiBaseUrl+Constants.loginEP) else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        //entry mode encoding
        let loginString = "\(userModel.email):\(userModel.password)"
        let loginData: Data = loginString.data(using: .utf8)!
        let base64 = loginData.base64EncodedString()
        
        //URLRequest
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Constants.post
        urlRequest.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
        //Task:
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else{
                completion(nil, error)
                return
            }
            guard let data = data else{
                completion(nil, NetworkError.noData)
                return
            }
        
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                completion(nil, NetworkError.statusCode(code: statusCode))
                print("MSG error: status code 401: no autorizado")
                return
            }
            
            guard let token = String(data: data, encoding: .utf8) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            completion(token, nil)
            
        }.resume()
    }
}
