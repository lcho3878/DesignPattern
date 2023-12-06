//
//  CombineViewModel.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/6/23.
//

import Foundation
import Combine

class CombineViewModel {
    private var index: Int = 0
    
    @Published var nameText: String = humanData[0].name
    @Published var ageText: String = String(humanData[0].age)
    

    func clickNextButton() {
        index = (index + 1) < humanData.count ? index + 1 : 0
        self.nameText = humanData[index].name
        self.ageText = String(humanData[index].age)
    }
    
    func clickNext() {
        index = (index + 1) < humanData.count ? index + 1 : 0
        self.nameText = humanData[index].name
        self.ageText = String(humanData[index].age)
    }
    
    func clickPrevious() {
        index = (index - 1) >= 0 ? index - 1 : humanData.count - 1
        self.nameText = humanData[index].name
        self.ageText = String(humanData[index].age)
    }
    
    
}
