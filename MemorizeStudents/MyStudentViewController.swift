//
//  MyStudentViewController.swift
//  MemorizeStudents
//
//  Created by Andrew Ryan on 6/14/17.
//  Copyright © 2017 AndrewRyan. All rights reserved.
//

import UIKit

class MyStudentViewController: UICollectionViewController {
// MARK: - Identifier Constants
// MARK: - Interface Builder Outlets
// MARK: - Properties
    var bBlockStudents = [StudentItem]()
    var cBlockStudents = [StudentItem]()
    var allStudents = [[StudentItem]]()
    
// MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let bBlockStudentNames = ["Ronnie", "Beatrice", "Bartimous", "Elifinia"]
        for i in 1...4 {
            bBlockStudents.append(StudentItem(name: bBlockStudentNames[i - 1], period: Period.BBlock, imageName: "kids/B\(i).jpg"))
        }
        let cBlockStudentNames = ["Sandie", "Bubbles", "Angie", "Layla"]
        for i in 1...4 {
            cBlockStudents.append(StudentItem(name: cBlockStudentNames[i - 1], period: Period.CBlock, imageName: "kids/C\(i).jpg"))
            
        }
        allStudents.append(bBlockStudents)
        allStudents.append(cBlockStudents)
        
        let width = collectionView!.frame.width / 2
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    

// MARK: - Navigation
// MARK: - IBActions
    @IBAction func addButtonTapped(_ sender: Any) {
        let item = StudentItem(name: "New Student", period: .BBlock, imageName: "kids/StickFigure.png")
        let index = allStudents[0].count
        allStudents[0].append(item)
        let indexPath = IndexPath(item: index, section: 0)
        collectionView?.insertItems(at: [indexPath])
    }
    
// MARK: - Helper Functions
// MARK: - Delegates / Extensions
// MARK: - CollectionViewMethods

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return allStudents.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allStudents[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StudentItemCell
    
        let studentItem = allStudents[indexPath.section][indexPath.row]
        
        cell.studentItem = studentItem
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! StudentItemHeader
        
        var title = ""
        
        if let period = Period(rawValue: indexPath.section) {
            title = period.description()
        }
        
        sectionHeader.title = title
        
        return sectionHeader
    }
    
    //move cells around
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let itemToMove = allStudents[sourceIndexPath.section][sourceIndexPath.row]
        
        allStudents[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        
        if sourceIndexPath.section == destinationIndexPath.section {
            allStudents[sourceIndexPath.section].insert(itemToMove, at: destinationIndexPath.row)
            
        } else {
        
        allStudents[destinationIndexPath.section].insert(itemToMove, at: sourceIndexPath.row)
        
        }
        collectionView.reloadData()
    }
    
    //delete students:
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        func showAlert(title: String) {
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "yes", style: .destructive, handler: { action in collectionView.performBatchUpdates({ 
                Void in
                self.allStudents[indexPath.section].remove(at: indexPath.row)
                self.collectionView?.deleteItems(at: [indexPath])
                
            }, completion: nil) }))
        
           alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        let item = allStudents[indexPath.section][indexPath.row]
        showAlert(title: "Delete '\(item.name)'?")
        }
    

   
}
