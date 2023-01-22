//
//  LogInViewModel.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 18/1/23.
//

import Foundation

class LogInViewModel: NSObject{
    
    override init() {
    }
    
    var loginTransitionSuccessfull: ((_ userIsLogged: Bool ) -> Void)?
    
    func logIn(with userData: LogInModel)->(){
        
        //Llamada al Api
        Networking.shared.login(userModel: userData) { token, error in
            if let token = token{
                //Save the token in userDefaults:
                LocalData.shared.saveToken(token: token)
                debugPrint("MSG: Inside api call, token value = \(token) ")
                //TODO: Critical point
                DispatchQueue.main.async {
                    self.loginTransitionSuccessfull?(true)
                }
            }
            //NOTE TO SELF: I think that I do not have to do the self?.updateUI?(...) here because I do not get new data to show, just save the token to confirm that the user access was successfull.
        }
    }
}
