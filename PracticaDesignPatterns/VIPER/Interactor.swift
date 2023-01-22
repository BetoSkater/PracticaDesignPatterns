//
//  Interactor.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 20/1/23.
//

import Foundation
//Object
//Protocol
//Reference to presenter
//ApiCalls
//MARK: - protocol AnyInteractor -
protocol AnyInteractor{
    var presenter: AnyPresenter? {get set}
    
    func tryLogin(with userData: LogInViperModel)
}
//MARK: - Class LoginInteractor -
class LoginInteractor: AnyInteractor{
    
    var presenter: AnyPresenter?
    
    func tryLogin(with userData: LogInViperModel) {
        Networking.shared.loginViper(userModel: userData) { token, error in
            if let token = token{
                //Save the token in userDefaults:
                LocalData.shared.saveToken(token: token)
                debugPrint("MSG: Inside viper api call, token value = \(token) ")
                
                //TODO: ¿Why does self? give problems?
                self.presenter?.interactorDidLogin(with: .success(true))
                debugPrint("MSG: interatorDidLogin is true")
            }else{
                self.presenter?.interactorDidLogin(with: .success(false))
                debugPrint("MSG: interatorDidLogin is false")
            }
        }
    }
}
