//
//  Model.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import Foundation

struct Human {
    let name: String
    let age: Int
}

let human1 = Human(name: "이찬호", age: 29)
let human2 = Human(name: "김상혁", age: 12)
let human3 = Human(name: "이춘배", age: 36)

let humanData: [Human] = [human1, human2, human3]
