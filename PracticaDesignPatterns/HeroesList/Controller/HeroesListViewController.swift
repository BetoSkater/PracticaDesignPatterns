//
//  HeroesListViewController.swift
//  PracticaDesignPatterns
//
//  Created by Alberto Junquera Ramírez on 19/1/23.
//

import Foundation
import UIKit

class HeroesListViewController: UIViewController{
    
    var mainView: HeroesListView{self.view as! HeroesListView}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = HeroesListView()
    }
}
