//
//  StudentItem.swift
//  MemorizeStudents
//
//  Created by Andrew Ryan on 6/14/17.
//  Copyright © 2017 AndrewRyan. All rights reserved.
//

import UIKit

class StudentItem: CustomStringConvertible {
    var name: String
    var period: Period
    var imageName: String
    
    init(name: String, period: Period, imageName: String) {
    self.name = name
    self.period = period
    self.imageName = imageName
    }
    
    var description: String {
        return "\(name) - \(period.description())"
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
