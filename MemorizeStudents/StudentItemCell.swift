//
//  StudentItemCell.swift
//  MemorizeStudents
//
//  Created by Andrew Ryan on 6/14/17.
//  Copyright © 2017 AndrewRyan. All rights reserved.
//

import UIKit

class StudentItemCell: UICollectionViewCell {
    @IBOutlet weak var studentNameLabel: UILabel!
    
    @IBOutlet weak var studentImageView: UIImageView!
    
    var studentItem: StudentItem? {
        
        didSet {
            
            if let studentItem = studentItem {
                studentNameLabel.text = studentItem.name
                studentImageView.image = UIImage(named: studentItem.imageName)
            }
        }
    }
}
