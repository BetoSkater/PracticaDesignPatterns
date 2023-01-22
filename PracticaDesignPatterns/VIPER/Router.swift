//
//  Router.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 20/1/23.
//

import Foundation
import UIKit

//Object
//EntryPoint

typealias EntryPoint = AnyView & UIViewController

//MARK: - protocol AnyRouter -
protocol AnyRouter{
    var entry: EntryPoint? {get}
    static func start() -> AnyRouter
}

//MARK: - Class LoginRouter -
class LoginRouter: AnyRouter{
    var entry: EntryPoint?
    
    static func start() -> AnyRouter{
        let router = LoginRouter()
        
        //Assign VIP
        
        var view: AnyView = LoginViperViewController()
        var presenter: AnyPresenter = LoginPresenter()
        var interactor: AnyInteractor = LoginInteractor()
        
        //Relations:
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        //EntryPoint
        router.entry = view as? EntryPoint
        
        return router
    }
}
