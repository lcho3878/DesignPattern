//
//  ViewController.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import UIKit

class ObservableViewController: UIViewController {

    private let mainView = ObservableView()
    private let mainViewModel: ObservableViewModel = ObservableViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bind()
        mainView.nextButton.addTarget(self, action: #selector(clickNextButton), for: .touchUpInside)
        mainView.previousButton.addTarget(self, action: #selector(clickPreviousButton), for: .touchUpInside)
    }
    
    private func bind() {
        mainViewModel.nameText.bind { name in
            self.mainView.nameLabel.text = name
        }
        
        mainViewModel.ageText.bind { age in
            self.mainView.ageLabel.text = String(age ?? 0)
        }
    }
    
    @objc func clickNextButton (_ sender: UIButton) {
        mainViewModel.clickNextButton()
    }
    
    @objc func clickPreviousButton (_ sender: UIButton) {
        mainViewModel.clickPriviousButton()
    }


}

