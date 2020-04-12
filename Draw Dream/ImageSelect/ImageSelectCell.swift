//
//  ImageSelectCell.swift
//  Draw Dream
//
//  Created by eyup cimen on 12.04.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class ImageSelectCell: UICollectionViewCell {
    
    @IBOutlet var selectImageView: UIImageView!
    
    func setImage ( _ index : Int) {
        selectImageView.image = UIImage(named: "image\(index).jpg")
    }
}
