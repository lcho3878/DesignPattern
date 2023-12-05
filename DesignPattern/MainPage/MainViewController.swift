//
//  ViewController.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import UIKit

class MainViewController: UIViewController {

    private let mainView = MainView()
    
    override func loadView() {
        view = mainView    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

