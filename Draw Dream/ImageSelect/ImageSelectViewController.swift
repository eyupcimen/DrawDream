//
//  ImageSelectViewController.swift
//  Draw Dream
//
//  Created by eyup cimen on 12.04.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class ImageSelectViewController: UIViewController {

    
    @IBOutlet var selectCollView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectCollView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "drawPaint" {
            if let index = sender as? Int {
                let drawViewController = segue.destination as! DrawViewController
                drawViewController.index = index
            }
        }
    }
}


extension ImageSelectViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageSelectCell"  , for: indexPath) as! ImageSelectCell
        cell.setImage(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var newSize = CGSize.zero
        newSize.width  = collectionView.bounds.size.height / 2
        newSize.height = (collectionView.bounds.size.height / 2) - 1
        return newSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: "drawPaint", sender: indexPath.row)
    }
}
