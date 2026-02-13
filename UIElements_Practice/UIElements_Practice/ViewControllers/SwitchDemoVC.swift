//
//  SwitchDemoVC.swift
//  UIElements_Practice
//
//  Created by OBMac-13 on 12/02/26.
//

import UIKit
import AVFoundation

class SwitchDemoVC: UIViewController {
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ViewtoShow: UIView!
    @IBOutlet weak var sliderBar: UISlider!
    
    @IBOutlet weak var switchRedFilter: UISwitch!
    
    @IBOutlet weak var imageviewToedit: UIImageView!
    
    @IBOutlet weak var opacitSwitch: UISwitch!
    
    @IBOutlet weak var stepperToChangeValue: UIStepper!
    
    @IBOutlet weak var lblstepperValue: UILabel!
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupSlider()
        setupSwitch()
        
        switchRedFilter.isOn = false
        switchRedFilter.addTarget(self, action: #selector(applyFilter(_:)), for: .valueChanged)
        //MARK: Opacity
        opacitSwitch.isOn = false
        sliderBar.isHidden = true
        opacitSwitch.addTarget(self, action: #selector(showOpacityBar(_:)), for: .valueChanged)
        
        //MARK: - stepper cll
        setupStepper()
        
        
        
        
    }
    
    // MARK: - Slider Setup
    
    func setupSlider() {
        
        // Value Limits (0 - 100 UI range)
        sliderBar.minimumValue = 0
        sliderBar.maximumValue = 100
        sliderBar.value = 50
        
        // Behavior
        sliderBar.isContinuous = true   // fires continuously while dragging
        
        sliderBar.setThumbImage(
            UIImage(systemName: "paperplane.circle.fill"),
            for: .highlighted
        )
        
        sliderBar.setMinimumTrackImage(
            UIImage(named: "paperplane.circle.fill"),
            for: .selected
        )
        
        sliderBar.setMaximumTrackImage(
            UIImage(named: "paperplane.circle.fill"),
            for: .selected
        )
        
        // Colors
        // sliderBar.minimumTrackTintColor = .systemBlue
        // sliderBar.maximumTrackTintColor = .systemGray4
        // sliderBar.thumbTintColor = .systemRed
        
        // Add Target
        sliderBar.addTarget(
            self,
            action: #selector(sliderChanged(_:)),
            for: .valueChanged
        )
    }
    
    // MARK: - Switch Setup
    
    func setupSwitch() {
        
        // Initial State
        toggleSwitch.setOn(false, animated: true)
        statusLabel.text = "Light Mode"
        toggleSwitch.onTintColor = .systemOrange
        
        //        // Colors
        //        toggleSwitch.onTintColor = .white
        //        toggleSwitch.thumbTintColor = .white
        //        toggleSwitch.tintColor = .systemRed
        
        toggleSwitch.addTarget(
            self,
            action: #selector(themeChanged(_:)),
            for: .valueChanged
        )
    }
    
    //MARK: - Stepper Steup
    
    func setupStepper() {
        

        // MARK: - Value Limits
        stepperToChangeValue.minimumValue = 0
        stepperToChangeValue.maximumValue = 100
        stepperToChangeValue.value = 0          // starting value

        // MARK: - Step Increment
        stepperToChangeValue.stepValue = 10      // increment by 1

        // MARK: - Behavior
        stepperToChangeValue.wraps = true      // whether it wraps around at bounds
        stepperToChangeValue.autorepeat = true  // keeps firing when pressed and held

        // MARK: - Colors / Appearance
        stepperToChangeValue.tintColor = .systemBlue
        
       

        // Add target
        stepperToChangeValue.addTarget(self,
                          action: #selector(stepperChanged(_:)),
                          for: .valueChanged)
    }
    
    // MARK: - Theme Change
    
    @objc func themeChanged(_ sender: UISwitch) {
        
        if sender.isOn {
            
            // Dark Mode
            overrideUserInterfaceStyle = .dark
            statusLabel.text = "Dark Mode"
            sender.onTintColor = .systemPurple
            ViewtoShow.isHidden = false
            ViewtoShow.layer.borderWidth = 10
            ViewtoShow.layer.borderColor = UIColor.white.cgColor
            sliderBar.thumbTintColor = .white
            
        } else {
            
            // Light Mode
            overrideUserInterfaceStyle = .light
            statusLabel.text = "Light Mode"
            sender.onTintColor = .systemOrange
            ViewtoShow.isHidden = true
            sliderBar.thumbTintColor = .systemBlue
        }
    }
    // MARK: - Stepper Change
    @objc func stepperChanged(_ sender: UIStepper) {
        let current = Int(sender.value)
        lblstepperValue.text = "Value: \(current)"
        if let dividerImage = UIImage(systemName: "trash.fill") {
            if stepperToChangeValue.value > 0{
                stepperToChangeValue.setDecrementImage(dividerImage, for: .normal)
                stepperToChangeValue.setIncrementImage(nil, for: .normal)
             
            }else{
                stepperToChangeValue.setDecrementImage(nil, for: .normal)
                
                 stepperToChangeValue.setIncrementImage(UIImage(systemName: "star.fill"), for: .normal)
                
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//                activityLoader.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.isUserInteractionEnabled = true
        DispatchQueue.global().async {
            sleep(2) // simulate network

            DispatchQueue.main.async {
               
                self.activityLoader.stopAnimating()
                self.activityLoader.hidesWhenStopped = true
                self.statusLabel.text = "Data Loaded"
            }
        }
    }
    
    // MARK: - Slider Change
    
    @objc func sliderChanged(_ sender: UISlider) {
        
        //        let step: Float = 10
        //        let rounded = round(sender.value / step) * step
        //        sender.value = rounded
        
        let currentValue = sender.value
        
        // Normalize 0 - 100  →  0.0 - 1.0
        let normalizedValue = CGFloat(currentValue / 100)
        
        // Fix for alpha (must be between 0 and 1)
        ViewtoShow.alpha = normalizedValue
        imageviewToedit.alpha = normalizedValue
        
        // Brightness also expects 0 - 1
        UIScreen.main.brightness = normalizedValue
        
        // statusLabel.text = "Value: \(Int(currentValue))"
    }
    @objc func applyFilter(_ sender: UISwitch){
        imageviewToedit.tintColor = imageviewToedit.tintColor == .red ? .systemBlue : .red
    }
    
    @objc func showOpacityBar(_ sender: UISwitch){
        sliderBar.isHidden.toggle()
    }
    
    // MARK: - IBActions
    
    @IBAction func switchChanged(_ sender: Any) {
        // switchChanged()
        // overrideUserInterfaceStyle = .light
    }
    
    @IBAction func changeValueOF(_ sender: Any) {
        
        let currentValue = sliderBar.value
        
        // Normalize here as well (since alpha expects 0-1)
        let normalizedValue = CGFloat(currentValue / 100)
        
        ViewtoShow.alpha = normalizedValue
        
        // statusLabel.text = "Value: \(currentValue)"
        // UIScreen.main.brightness = CGFloat(currentValue)
        
        // player?.volume = (sender as AnyObject).value
    }
}
