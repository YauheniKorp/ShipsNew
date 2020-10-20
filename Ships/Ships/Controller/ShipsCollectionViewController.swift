//
//  ShipsCollectionViewController.swift
//  Ships
//
//  Created by Admin on 14.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShipsCollectionViewController: UICollectionViewController {
    
    var ships = Ships().listOfShips
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "Ships"

//        collectionView?.frame = CGRect(x: 0, y: height, width: UIScreen.mainScreen().bounds.width, height: (UIScreen.mainScreen().bounds.height - height))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    

    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    //    override func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ships.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        
        cell.setCell(ships[indexPath.row])
        cell.layer.borderWidth = 0.5
//        let imageFrame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height * 0.5)
//        let nameFrame = CGRect(x: 0, y: cell.frame.height * 0.6, width: cell.frame.width, height: cell.frame.height * 0.13)
//        let shipClassFrame = CGRect(x: 0, y: cell.frame.height * 0.74, width: cell.frame.width, height: cell.frame.height * 0.13)
//        let launchedFrame = CGRect(x: 0, y: cell.frame.height * 0.87, width: cell.frame.width, height: cell.frame.height * 0.13)
//        cell.addSubview(ShipView(ships[indexPath.row], imageFrame, nameFrame, shipClassFrame, launchedFrame))
        
        return cell
    }
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    
    
}

extension ShipsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2.9, height: self.view.frame.height / 3.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
    }
}
