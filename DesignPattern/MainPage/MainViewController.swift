//
//  MainViewController.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTaget()
    }
    
    private func setAddTaget() {
        mainView.observableButton.addTarget(self, action: #selector(clickObservableButton), for: .touchUpInside)
        mainView.combineButton.addTarget(self, action: #selector(clickCombineButton), for: .touchUpInside)
        mainView.rxSwiftButton.addTarget(self, action: #selector(rxSwiftButton), for: .touchUpInside)
    }
    
    @objc private func clickObservableButton(_ sender: UIButton) {
        let obVC = ObservableViewController()
        self.navigationController?.pushViewController(obVC, animated: true)
    }
    
    @objc func clickCombineButton(_ sender: UIButton) {
        let combineVC = CombineViewController()
        self.navigationController?.pushViewController(combineVC, animated: true)
    }
    
    @objc func rxSwiftButton(_ sender: UIButton) {
        print("Click RxSwift")
    }

}
