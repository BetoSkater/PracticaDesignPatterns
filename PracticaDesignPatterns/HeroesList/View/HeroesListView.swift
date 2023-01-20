//
//  HeroesListView.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 19/1/23.
//

import Foundation
import UIKit

class HeroesListView: UIView{
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.text = "LogIn was successfull"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        backgroundColor = .white
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 50),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            textLabel.heightAnchor.constraint(equalToConstant: 50),
        
        ])
    }
}
