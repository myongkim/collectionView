//
//  StudentItemHeader.swift
//  MemorizeStudents
//
//  Created by Andrew Ryan on 6/14/17.
//  Copyright © 2017 AndrewRyan. All rights reserved.
//

import UIKit

class StudentItemHeader: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    
}
