//
//  ViewController.swift
//  DropShadow
//
//  Created by Jacques on 30/12/15.
//  Copyright © 2015 J4SOFT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nestedView: UIView!
    
    @IBOutlet weak var shadowXOffsetSlider: UISlider!
    @IBOutlet weak var shadowYOffsetSlider: UISlider!
    @IBOutlet weak var shadowRadiusSlider: UISlider!
    @IBOutlet weak var shadowOpacitySlider: UISlider!
    @IBOutlet weak var nestedViewCornerRadiusSlider: UISlider!
    
    
    @IBOutlet weak var shadowXOffsetValue: UILabel!
    @IBOutlet weak var shadowYOffsetValue: UILabel!
    @IBOutlet weak var shadowRadiusValue: UILabel!
    @IBOutlet weak var shadowOpacityValue: UILabel!
    @IBOutlet weak var nestedViewCornerRadiusValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: nested view settings
        nestedView.layer.shadowColor = UIColor.blackColor().CGColor
        nestedView.layer.cornerRadius = 4
        nestedViewCornerRadiusSlider.value = Float(nestedView.layer.cornerRadius)
        nestedViewCornerRadiusValue.text = "\(nestedView.layer.cornerRadius)"
        
        // MARK: shadow settings
        nestedView.layer.shadowOffset = CGSizeMake(0, 2)
        shadowXOffsetSlider.value = Float(nestedView.layer.shadowOffset.width)
        shadowYOffsetSlider.value = Float(nestedView.layer.shadowOffset.height)
        shadowXOffsetValue.text = formatFloatToString(shadowXOffsetSlider.value)
        shadowYOffsetValue.text = formatFloatToString(shadowYOffsetSlider.value)

        nestedView.layer.shadowRadius = 4
        shadowRadiusSlider.value = Float(nestedView.layer.shadowRadius)
        shadowRadiusValue.text = formatFloatToString(Float(nestedView.layer.shadowRadius))
        
        nestedView.layer.shadowOpacity = 0.3
        shadowOpacitySlider.value = nestedView.layer.shadowOpacity
        shadowOpacityValue.text = formatFloatToString(nestedView.layer.shadowOpacity)
    }

    @IBAction func shadowXYOffsetValueChanged(sender: UISlider) {
        nestedView.layer.shadowOffset = CGSizeMake(CGFloat(shadowXOffsetSlider.value), CGFloat(shadowYOffsetSlider.value))
        shadowXOffsetValue.text = formatFloatToString(shadowXOffsetSlider.value)
        shadowYOffsetValue.text = formatFloatToString(shadowYOffsetSlider.value)
    }
    
    @IBAction func shadowRadiusValueChanged(sender: UISlider) {
        nestedView.layer.shadowRadius = CGFloat(shadowRadiusSlider.value)
        shadowRadiusValue.text = formatFloatToString(Float(nestedView.layer.shadowRadius))
    }
    
    @IBAction func nestedViewCornerRadiusValueChanged(sender: UISlider) {
        nestedView.layer.cornerRadius = CGFloat(nestedViewCornerRadiusSlider.value)
        nestedViewCornerRadiusValue.text = formatFloatToString(Float(nestedView.layer.cornerRadius))
    }
    
    @IBAction func shadowOpacityValueChanged(sender: UISlider) {
        nestedView.layer.shadowOpacity = sender.value
        shadowOpacityValue.text = formatFloatToString(nestedView.layer.shadowOpacity)
    }
    
    func formatFloatToString(value: Float) ->String {
        return String(format: "%02.1f", value)
    }
}

