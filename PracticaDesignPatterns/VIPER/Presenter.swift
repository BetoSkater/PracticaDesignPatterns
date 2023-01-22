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
//MARK: -protocol AnyPresenter-
protocol AnyPresenter{
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidLogin(with result: Result<Bool,Error>)
}
//MARK: - Class LoginPresenter -
class LoginPresenter: AnyPresenter{
    
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView?
    
    //RESULT<nil, Error>???
    func interactorDidLogin(with result: Result<Bool, Error>) {
        debugPrint("MSG: starting interactorDidLogin func")
        switch result{
        case .success(true):
            debugPrint("MSG: LoginSucceded")
            DispatchQueue.main.async {
                self.view?.authenticationSucceded()
            }
        case .failure(let error):
            debugPrint("MSG: Login Failure: \(error)")
        case .success(false):
            debugPrint("MSG: Login failure")
        }
    }
}
