//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by Asaduzzaman Anik on 6/22/20.
//  Copyright © 2020 Asaduzzaman Anik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //reuse identifier
    let reuseIdentifier = "CollectionViewCell"
    
    //info to be put into the collectionView
    let info = [1,2,3,4,5,6,7,8,9,0,11,22,33,44,55,66,77,88,99,00,111,222,333,444,555,666,777,888,999]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    //number of items on the collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }
    
    //Populate CollectionView with cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //CollectionViewCell object with reuseIdentifier.
        let collectionViewCell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        //edit the cell properties
        collectionViewCell.collectionCellLabel.text = String(info[indexPath.row])
        collectionViewCell.backgroundColor = UIColor.green
        collectionViewCell.layer.cornerRadius = 8
        
        return collectionViewCell
    }
    
    //what happens when the item is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(info[indexPath.row])")
        let collectionViewCell = collectionView.cellForItem(at: indexPath)
        collectionViewCell?.backgroundColor = UIColor.red
        
    }
    
    //when user taps a cell,  kinda lon press
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let collectionViewCell = collectionView.cellForItem(at: indexPath)
        collectionViewCell?.backgroundColor = UIColor.blue
    }
    
    //when user untap the cell
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let collectionViewCell = collectionView.cellForItem(at: indexPath)
        collectionViewCell?.backgroundColor = UIColor.green
    }
    
    
}

