//
//  LogInView.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 18/1/23.
//

import Foundation
import UIKit

class LoginView: UIView{
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
        textField.placeholder = "  e-mail"
       //TODO: fix the placeholder so it has amrging and not blank spaces
       // textField.isSecureTextEntry
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "  password"
        textField.isSecureTextEntry = true
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
    
    //MARK: - inits -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - setUpViews func -
    func setUpViews(){
        addSubview(baseView)
        addSubview(emailField)
        addSubview(passField)
        addSubview(loginButton)
        
        NSLayoutConstraint.activate([
        
            baseView.topAnchor.constraint(equalTo: topAnchor),
            baseView.leadingAnchor.constraint(equalTo: leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emailField.topAnchor.constraint(equalTo: topAnchor,constant: 300),
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
    
    
}
