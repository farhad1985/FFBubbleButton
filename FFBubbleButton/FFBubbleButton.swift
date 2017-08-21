//
//  BubbleButton.swift
//  testan
//
//  Created by Farhad on 8/20/17.
//  Copyright © 2017 Farhad. All rights reserved.
//

import UIKit

@IBDesignable
public class FFBubbleButton: UIView {
    
    @IBInspectable var isAnimation: Bool = false {
        didSet {
            if isAnimation {
                startAnimation()
            }
        }
    }
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
    
    @IBInspectable var backColor: UIColor = .white {
        didSet {
            self.backgroundColor = backColor
        }
    }

    @IBInspectable var highlightedColor: UIColor = .white
    
    @IBInspectable var alphaBubble: CGFloat = 0.5
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func startAnimation() {
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
    }
    
    @objc private func animation() {
        DispatchQueue.main.async {
            let x = Int(arc4random_uniform(UInt32(self.frame.width)))
            let y = Int(arc4random_uniform(UInt32(self.frame.height)))
            let frame = CGRect(x: x, y: y, width: 0, height: 0)
            let circleView = UIView(frame: frame)
            circleView.layer.cornerRadius = 0
            circleView.backgroundColor = UIColor.white.withAlphaComponent(self.alphaBubble)
            circleView.isUserInteractionEnabled = false
            self.addSubview(circleView)
            UIView.animate(withDuration: 2, animations: {
                circleView.frame.size.width = 40
                circleView.frame.size.height = 40
                circleView.layer.cornerRadius = 20
                circleView.frame.origin.x = CGFloat(x - 20)
                circleView.frame.origin.y = CGFloat(y - 20)
                circleView.backgroundColor = UIColor.white.withAlphaComponent(0)
            }, completion: { _ in
                circleView.removeFromSuperview()
            })

        }
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = highlightedColor
            } else {
                self.backgroundColor = backColor
            }
        }
    }
    
}
