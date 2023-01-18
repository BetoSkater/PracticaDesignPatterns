//
//  LogInViewController.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 18/1/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController{
    //MARK: - View Assignation? -
    
    var mainView: LoginView{self.view as! LoginView}
    
    //MARK: - Inits -
    //As this view is not going to load previous data, the userModel is not needed in the init. //TODO: Check
    
    //TODO: revisar, creo que el init en el controller solo es si se le pasa un modelo de datos.
    /*
    init(){
        super.init(nibName: nil, bundle: nil)
      mainView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = LoginView()
    }
}
