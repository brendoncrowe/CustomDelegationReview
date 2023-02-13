//
//  SettingsController.swift
//  CustomDelegationReview
//
//  Created by Brendon Crowe on 2/13/23.
//

import UIKit

protocol SettingsControllerDelegate {
    func changeFontSize(to size: Int)
}

class SettingsController: UIViewController {
    
    @IBOutlet weak var fontSlider: UISlider!
    @IBOutlet weak var fontStepper: UIStepper!
    @IBOutlet weak var fontSizeValue: UILabel!
    
    var delegate: SettingsControllerDelegate?
    
    var fontSize: Int = 17 { // when the view is dismissed, the value reverts back to the default...need to revisit 
        didSet {
            fontSlider.value = Float(fontSize)
            fontStepper.value = Double(fontSize)
            fontSizeValue.text = "Table View font size: \(String(fontSize))"
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configSlider()
        configStepper()
        fontSizeValue.text = "Table View font size: \(String(fontSize))"
    }
    
    func configSlider() {
        fontSlider.minimumValue = 1
        fontSlider.maximumValue = 100
        fontSlider.value = Float(fontSize)
    }
    
    func configStepper() {
        fontStepper.minimumValue = 1
        fontStepper.maximumValue = 100
        fontStepper.stepValue = 1
        fontStepper.value = Double(fontSize)
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        fontSize = Int(sender.value)
        delegate?.changeFontSize(to: fontSize)
    }
    
    
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        fontSize = Int(sender.value)
        delegate?.changeFontSize(to: fontSize)
    }
    
}
