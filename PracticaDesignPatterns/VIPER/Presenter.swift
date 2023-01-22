//
//  Presenter.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 20/1/23.
//

import Foundation
//Object
//Protocol
//Reference Iterator, router and view

protocol AnyPresenter{
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidLogin(with result: Result<Bool,Error>)
}


class LoginPresenter: AnyPresenter{
        
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet{
           /* let userData = LogInViperModel(email: view.emailField.text, password: <#T##String#>)
            interactor?.tryLogin(with: )
            */
            interactor?.tryLogin(with: LogInViperModel(email: "a", password: "a"))
        }
    }
    
    var view: AnyView?
    //RESULT<nil, Error>???
    func interactorDidLogin(with result: Result<Bool, Error>) {
        switch result{
        case .success(true):
            debugPrint("LoginSucceded")
            //TODO: iria aqui el cambio de ventana?
            DispatchQueue.main.async {
                self.view?.authenticationSucceded()
            }
               // view?.authenticationSucceded()
            
            
        case .failure(let error):
            debugPrint("Login Failure")
            //TODO: hace falta poner lo del error?
        case .success(false):
            debugPrint("Login failure")
        }
    
    }
}
