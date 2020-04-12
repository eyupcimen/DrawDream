//
//  Canvas.swift
//  Draw Dream
//
//  Created by eyup cimen on 11.04.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

class Canvas : UIView {
    
    fileprivate var lines = [Line]()
    fileprivate var strokeColor = UIColor.red
    fileprivate var strokeWidth : Float = 10
    
    func setStrokeColor ( _ color : UIColor) {
        self.strokeColor = color
    }
    
    func setStrokeWidth( _ width : Float) {
        self.strokeWidth = width
        setNeedsDisplay()
    }
    
    func undo () {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear () {
        lines.removeAll()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        //context.fillPath(using: .evenOdd)
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)
            for (i,p) in line.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
    }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        lines.append( Line(strokeWidth: strokeWidth, color: strokeColor, points: [] ))
    }
    
    // track the finger the as we move across screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        
        guard var lastLine = lines.popLast() else { return }
        
        lastLine.points.append(point)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }

    
}

