//
//  ViewController.swift
//  PickerView_Practice
//
//  Created by OBMac-13 on 05/03/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    let pickerView = UIPickerView()
    let datePicker = UIDatePicker()
    
    
    let brands = ["Apple", "Samsung", "Motorola", "OnePlus", "Huawei"]
    let brandImages = [UIImage(systemName: "Checkmark.circle"), UIImage(systemName: "Checkmark.circle"), UIImage(systemName: "Checkmark.circle"), UIImage(systemName: "Checkmark.circle"), UIImage(systemName: "Checkmark.circle")]
    let products = ["Iphone", "Galaxy phons", "Moto", "OnePlus", "Huawei smart"]
    
    let countries = ["India", "USA"]

    let statesData = [
        "India": ["Gujarat", "Maharashtra", "Punjab"],
        "USA": ["California", "Texas", "Florida"]
    ]

    var selectedCountry = "India"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
        dateTextField.delegate = self
        
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
              return countries.count
          } else {
              return statesData[selectedCountry]?.count ?? 0
          }
    }
    
    //set row height
    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat{
        return 50
    }
    
    //width
    func pickerView(_ pickerView: UIPickerView,
                    widthForComponent component: Int) -> CGFloat {
        
        if component == 0 {
            return 150   // Brand column
        } else {
            return 200   // Model column
        }
    }
//    func rowSize(forComponent component: Int) -> CGSize{
//        return CGSize(width: 100, height: 50)
//    }
    //custom label styling
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {

        let label = view as? UILabel ?? UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemBlue
        
        if component == 0 {
            label.text = countries[row]
        } else {
            label.text = statesData[selectedCountry]?[row]
        }

        return label
    }
    
//    func pickerView(_ pickerView: UIPickerView,
//                    attributedTitleForRow row: Int,
//                    forComponent component: Int) -> NSAttributedString? {
//        if component == 0 {
//            let attributes: [NSAttributedString.Key: Any] = [
//                .font: UIFont.systemFont(ofSize: 20, weight: .bold),
//                .foregroundColor: UIColor.systemBlue
//            ]
//            
//            return NSAttributedString(string: brands[row], attributes: attributes)
//        }else{
//            let attributes: [NSAttributedString.Key: Any] = [
//                .font: UIFont.systemFont(ofSize: 20, weight: .bold),
//                .foregroundColor: UIColor.systemBlue
//            ]
//            
//            return NSAttributedString(string: products[row], attributes: attributes)
//        }
//    }
    
//    func pickerView(_ pickerView: UIPickerView,
//                    viewForRow row: Int,
//                    forComponent component: Int,
//                    reusing view: UIView?) -> UIView {
//        
//        let container = view ?? UIView()
//        
//        let imageView = UIImageView(frame: CGRect(x: 10, y: 5, width: 40, height: 40))
//        imageView.image = brandImages[row]
//        imageView.tintColor = .gray
//        
//        let label = UILabel(frame: CGRect(x: 60, y: 0, width: 150, height: 50))
//        label.text = brands[row]
//        
//        container.addSubview(imageView)
//        container.addSubview(label)
//        
//        return container
//    }
    
    //selection
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {

        if component == 0 {
            selectedCountry = countries[row]
            
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
        pickerView.resignFirstResponder()

        updateTextField()
    }
    func updateTextField() {
        let countryIndex = pickerView.selectedRow(inComponent: 0)
        let stateIndex = pickerView.selectedRow(inComponent: 1)
        
        let country = countries[countryIndex]
        let states = statesData[country] ?? []
        let state = states.isEmpty ? "" : states[stateIndex]
        
        textField.text = "\(country), \(state)"
    }
    

}
extension ViewController {
    
    func openDatePicker() {
        
       
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "en_US")
        dateTextField.inputView = datePicker
        datePicker.minimumDate = Date()
        let oneYear = Calendar.current.date(byAdding: .year, value: 2, to: Date())!
        datePicker.maximumDate = oneYear
        
        let toolbar = UIToolbar(frame:  CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        
        datePicker.addTarget(self, action: #selector(changeHandler), for: .valueChanged)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [cancelButton, spaceButton, doneButton]
        dateTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func cancelDatePicker() {
        dateTextField.resignFirstResponder()
    }  
    @objc func changeHandler() {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE MMM d yyyy, h:mm a"
            dateTextField.text = formatter.string(from: datePicker.date)
    }
    
    @objc func doneDatePicker() {
        if let datepicker = dateTextField.inputView as? UIDatePicker {
            let formatter = DateFormatter()
//            formatter.dateStyle = .medium
            formatter.dateFormat = "EEEE MMM d yyyy, h:mm a"

            
            dateTextField.text = formatter.string(from: datePicker.date)
        }
        
        dateTextField.resignFirstResponder()
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateTextField {
              openDatePicker()
          }
    }
}

