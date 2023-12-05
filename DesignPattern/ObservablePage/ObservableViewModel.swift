//
//  MainViewModel.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import Foundation

final class ObservableViewModel {
    let nameText: Observable<String?> = Observable(nil)
    let ageText: Observable<Int?> = Observable(nil)
    
    private var index: Int = 0
    
    init() {
        self.nameText.value = humanData[index].name
        self.ageText.value = humanData[index].age
    }
    
    func clickNextButton() {
        index = (index + 1) < humanData.count ? index + 1 : 0
        self.nameText.value = humanData[index].name
        self.ageText.value = humanData[index].age
    }
    
    func clickPriviousButton() {
        index = (index - 1) >= 0 ? index - 1 : humanData.count - 1
        self.nameText.value = humanData[index].name
        self.ageText.value = humanData[index].age
    }
}
