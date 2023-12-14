//
//  RxViewModel.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/8/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType{
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}

final class RxViewModel: ViewModelType {
    var index: Int = 0
    
    struct Input{
        let nextButtonClick: ControlEvent<Void>
        let previousButtonClick: ControlEvent<Void>
    }
    
    struct Output{
        let nameText: Driver<String>
        let ageText: Driver<String>
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        
        let nextIndex = input.nextButtonClick
            .map {
                self.index = self.index + 1 < humanData.count ? self.index + 1 : 0
                return self.index
            }
            .asDriver(onErrorJustReturn: 0)
        
        let previousIndex = input.previousButtonClick
            .map {
                self.index = self.index - 1 >= 0 ? self.index - 1 : humanData.count - 1
                return self.index
            }
            .asDriver(onErrorJustReturn: 0)
        
        let nameText = Driver.merge(nextIndex, previousIndex)
            .map {
                humanData.indices.contains($0) ? humanData[$0].name : ""
            }
            .asDriver(onErrorJustReturn: "")
        
        let ageText = Driver.merge(nextIndex, previousIndex)
            .map {
                humanData.indices.contains($0) ? String(humanData[$0].age) : ""
            }
            .asDriver(onErrorJustReturn: "")

        return Output(nameText: nameText, ageText: ageText)
    }
}
