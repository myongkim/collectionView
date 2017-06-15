//
//  StudentItem.swift
//  MemorizeStudents
//
//  Created by Andrew Ryan on 6/14/17.
//  Copyright © 2017 AndrewRyan. All rights reserved.
//

import UIKit

class StudentItem {
    var name: String
    var period: Period
    var imageName: String
    
    init(name: String, period: Period, imageName: String) {
    self.name = name
    self.period = period
    self.imageName = imageName
    }
}
    

enum Period: Int {
    case BBlock
    case CBlock
    
    func description() -> String {
        switch self {
        case .BBlock:
            return "B Block"
        case .CBlock:
            return "C Block"
        }
    }
}
