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
    var viewModel: LogInViewModel?
    
    //MARK: - Inits -
    //As this view is not going to load previous data, the userModel is not needed in the init. //TODO: Check
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LogInViewModel()
        //Button functionality assigment:
        mainView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
    
    override func loadView() {
        view = LoginView()
    }
    
    //MARK: - Button related methods -
    @objc func loginButtonTapped(sender: UIButton!){
        getLogIn()
        setUpLoginTransitionSuccessfull()
    }
    
    func getLogIn(){
        //Setting user data:
        if !mainView.emailField.text!.isEmpty && !mainView.passField.text!.isEmpty{
            
            let email = mainView.emailField.text!
            let pass = mainView.passField.text!
            let loginData = LogInModel(email: email, password: pass)
            
            viewModel?.logIn(with: loginData)
        }
    }
    func setUpLoginTransitionSuccessfull(){
        debugPrint("MSG: start of setupLoginTransition")
        // DispatchQueue.main.async {
        self.viewModel?.loginTransitionSuccessfull = { userLogged in
            let heroListViewController = HeroesListViewController()
            print("MSG: before the screen chsnge")
            //TODO: do not delete
            // self.present(heroListViewController, animated: true) //It does work but is not a full window
            // self.navigationController?.pushViewController(heroListViewController, animated: true) //This does not work
            
            UIApplication.shared.connectedScenes.compactMap {($0 as? UIWindowScene)?.keyWindow}.first?.rootViewController = HeroesListViewController() //TODO: este funciona justo como quiero.
        }
        // } //DispatchQueue
    }
}
