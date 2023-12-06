//
//  RxSwiftViewController.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/6/23.
//

import UIKit

class RxSwiftViewController: UIViewController {

    private let rxView = MVVMView()
    
    override func loadView() {
        view = rxView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
