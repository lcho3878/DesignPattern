//
//  CombineViewController.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/6/23.
//

import UIKit

class CombineViewController: UIViewController {

    private let combineView = MVVMView()
    
    override func loadView() {
        view = combineView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
