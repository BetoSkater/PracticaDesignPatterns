//
//  View.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 20/1/23.
//

import Foundation
import UIKit

//ViewController
//Protocol
//Reference to presenter
//MARK: - AnyView protocol declaration -
protocol AnyView{
    var presenter: AnyPresenter? {get set}
    
    func authenticationSucceded()
    func authenticationFailed(with error: String)
}

class LoginViperViewController: UIViewController, AnyView{
    
    var presenter: AnyPresenter?
    
    //MARK: - SubViews declaration.-
    
    let baseView: UIImageView = {
        let backgroundView = UIImageView()
        
        backgroundView.image = UIImage(named: "fondo2")
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        return backgroundView
    }()
    
    let emailField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.placeholder = "  e-mail viper"
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let passField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.placeholder = "password viper"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .white
        button.layer.cornerRadius = 150
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    //MARK: - viewDidLoad() -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSubviewsAndConstrains()
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    //MARK:  - ButtonAction -
    @objc func loginButtonTapped(sender: UIButton){
        debugPrint("MSG: viper login button does work")
        if let mail = emailField.text, let pass = passField.text{
            if !mail.isEmpty && !pass.isEmpty{
                
                let loginData = LogInViperModel(email: mail, password: pass)
                //TODO: I do not understand why the commented line did not work.
                presenter?.interactor?.tryLogin(with: loginData)
                //LoginInteractor().tryLogin(with: loginData)
            }else{
                emailField.text = "Type user and password"
            }
        }
    }
    //MARK: - loadSubviewsAndConstrains method. -
    func loadSubviewsAndConstrains(){
        view.addSubview(baseView)
        view.addSubview(emailField)
        view.addSubview(passField)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            
            baseView.topAnchor.constraint(equalTo: view.topAnchor),
            baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emailField.topAnchor.constraint(equalTo: view.topAnchor,constant: 300),
            emailField.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 50),
            emailField.trailingAnchor.constraint(equalTo: baseView.trailingAnchor,constant: -50),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 25),
            passField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            passField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            passField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: passField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    //MARK: - protocol AnyView methods -
    func authenticationSucceded() {
        UIApplication.shared.connectedScenes.compactMap {($0 as? UIWindowScene)?.keyWindow}.first?.rootViewController = HeroesListViewController()
    }
    
    func authenticationFailed(with error: String) {
        debugPrint("MSG: Authentication failed")
    }
    
}
