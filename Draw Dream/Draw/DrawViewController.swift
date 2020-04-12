//
//  ViewController.swift
//  Draw Dream
//
//  Created by eyup cimen on 11.04.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    var index : Int = 0
    var colors : [ColorPalette] = []
    @IBOutlet var canvas: Canvas!
    @IBOutlet var colorPalette: UICollectionView!
    @IBOutlet var drawingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .clear
        createColorPalettes()
        setBackgrounImage()
    }
    
    func setBackgrounImage () {
        drawingImage.image = UIImage(named: "image\(index).jpg")
    }
    
    func createColorPalettes () {
        colors.append(ColorPalette(UIColor.red))
        colors.append(ColorPalette(UIColor.green))
        colors.append(ColorPalette(UIColor.blue))
        colors.append(ColorPalette(UIColor.purple))
        colors.append(ColorPalette(UIColor.magenta))
        colors.append(ColorPalette(UIColor.orange))
        colors.append(ColorPalette(UIColor.yellow))
        colors.append(ColorPalette(UIColor.brown))
        colors.append(ColorPalette(UIColor.cyan))
        colors.append(ColorPalette(UIColor.gray))
        colorPalette.reloadData()
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        canvas.clear()
    }
    
    @IBAction func undo(_ sender: UIButton) {
        canvas.undo()
    }
    
    @IBAction func changeStrokeLineWidth(_ sender: UISlider) {
        canvas.setStrokeWidth(sender.value)
    }
   
    @IBAction func backLastScreen(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension DrawViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorPaletteCell"  , for: indexPath)
        let colorPalette = colors[indexPath.row]
        cell.contentView.backgroundColor = colorPalette.color
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var newSize = CGSize.zero
        newSize.width  = collectionView.bounds.size.width
        newSize.height = collectionView.bounds.size.height / CGFloat((colors.count))
        return newSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1 // collectionView.frame.size.width * 0.032
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let colorPalette = colors[indexPath.row]
        canvas.setStrokeColor(colorPalette.color)
    }
}


class ColorPalette {
    
    var color : UIColor
    
    init(_ color: UIColor) {
        self.color = color
    }
}
