//
//  CombineViewController.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/6/23.
//

import UIKit
import Combine

class CombineViewController: UIViewController {

    private let combineView = MVVMView()
    private let combineViewModel = CombineViewModel()
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func loadView() {
        view = combineView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        combineView.nextButton.addTarget(self, action: #selector(clickNextButton), for: .touchUpInside)
        combineView.previousButton.addTarget(self, action: #selector(clickPreviousButton), for: .touchUpInside)

    }
    
    private func bind() {
        combineViewModel.$nameText
            .compactMap{ String($0) }
            .assign(to: \.text, on: combineView.nameLabel)
            .store(in: &cancellables)
        combineViewModel.$ageText
            .compactMap{ String($0) }
            .assign(to: \.text, on: combineView.ageLabel)
            .store(in: &cancellables)
    }
    
    @objc func clickNextButton (_ sender: UIButton) {
        combineViewModel.clickNext()
    }
    
    @objc func clickPreviousButton (_ sender: UIButton) {
        combineViewModel.clickPrevious()
    }


}
