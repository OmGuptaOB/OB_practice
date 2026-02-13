//
//  ViewController.swift
//  UIElements_Practice
//
//  Created by OBMac-13 on 10/02/26.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Dynamictextlabel: UILabel = UILabel()
        Dynamictextlabel.numberOfLines = 0
        Dynamictextlabel.translatesAutoresizingMaskIntoConstraints = false
        //        Dynamictextlabel.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(Dynamictextlabel)
        Dynamictextlabel.text = "the office"
        let scaledFon = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont(name: "AmericanTypewriter", size: 50)!)
        Dynamictextlabel.font = scaledFon
        
        if let descriptor = Dynamictextlabel.font.fontDescriptor.withSymbolicTraits(.traitBold) {
            Dynamictextlabel.font = UIFont(descriptor: descriptor, size: Dynamictextlabel.font.pointSize)
        }
        
        Dynamictextlabel.adjustsFontForContentSizeCategory = true
        NSLayoutConstraint.activate([
            Dynamictextlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            Dynamictextlabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 10),
            Dynamictextlabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -10),
            Dynamictextlabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Dynamictextlabel.widthAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.widthAnchor,constant: -20)
        ])
        
        Dynamictextlabel.shadowColor = .black
        Dynamictextlabel.textColor = .red
        Dynamictextlabel.shadowOffset = CGSize(width: 3, height: 0)
        
        
        //MARK: - label alignment
//        let txt1 = "You can configure the overall 0*&Q!@%^*#$(&^#Q%* of a l$&abel’s text, and use attributed strings to customize the appearance of substrings within the text. Add and customize "
//        
//        let lbl1 = createLabelforAllignmentTest(text: txt1, textAlignment: .center, topConstraint: Dynamictextlabel)
//        let lbl2 = createLabelforAllignmentTest(text: txt1, textAlignment: .left, topConstraint: lbl1)
//        let lbl3 = createLabelforAllignmentTest(text: txt1, textAlignment: .right, topConstraint: lbl2)
//        let lbl4 = createLabelforAllignmentTest(text: txt1, textAlignment: .justified, topConstraint: lbl3)
//        lbl3.baselineAdjustment = .alignCenters
//        //        lbl4.numberOfLines = 1
//        //        lbl4.lineBreakMode = .byTruncatingTail
//        //        lbl4.showsExpansionTextWhenTruncated = true
//        let txt2 = "hellYou \n can configure the overall of a label’s text, and use attributed strings to customize the appearance of substrings to hello."
//        let txt3 = "You can configure the overall of a label’s text, and use attributed strings to customize the appearance of substrings. and use attributed strings to customize the appearance of substrings. "
//        
//        let lbl5 : UILabel = UILabel()
//        lbl5.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        lbl5.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        lbl5.backgroundColor = .yellow
//        lbl5.text = "Hi"
//
//        let lbl6 = createLabelforAllignmentTest(text: "By word warpping :- " + txt2, textAlignment: .justified, topConstraint: lbl5,numberOflines: 1)
//        lbl6.lineBreakMode = .byWordWrapping
//        
//        let lbl7 = createLabelforAllignmentTest(text: "By clipping :- " + txt3, textAlignment: .justified, topConstraint: lbl6,numberOflines: 2)
//        lbl7.lineBreakMode = .byClipping
//        
//        let lbl8 = createLabelforAllignmentTest(text: "Middle trucation :- " + txt3 , textAlignment: .justified, topConstraint: lbl7,numberOflines: 2)
//        lbl8.lineBreakMode = .byTruncatingMiddle
//        
//        let lbl9 = createLabelforAllignmentTest(text: "by Truncating Head :- " + txt3 , textAlignment: .justified, topConstraint: lbl8,numberOflines: 2)
//        lbl9.lineBreakMode = .byTruncatingHead
//        
//        let lbl10 = createLabelforAllignmentTest(text: "by Char Wrapping :- " + txt1 , textAlignment: .justified, topConstraint: lbl9,numberOflines: 2)
//        lbl10.lineBreakMode = .byCharWrapping
//        lbl10.sizingRule = .oversize
//        
//        let lbl11 = createLabelforAllignmentTest(text: txt2 , textAlignment: .justified, topConstraint: lbl10,numberOflines: 2)
////        lbl11.lineBreakMode = .byCharWrapping
////        lbl11.allowsDefaultTighteningForTruncation = true
//        lbl11.sizingRule = .typographic
////        lbl11.layer.borderWidth = 1
//
//        
//      
//        
//        
//        
//        lbl1.textColor = .black
//        lbl1.highlightedTextColor = .red
//        lbl1.isHighlighted = true
////        lbl1.isEnabled = false
    }
    
    func createLabelforAllignmentTest(text : String ,textAlignment : NSTextAlignment, topConstraint : UIView , numberOflines : Int = 0) -> UILabel{
        let newlbl1: UILabel = UILabel()
        newlbl1.numberOfLines = numberOflines
        newlbl1.translatesAutoresizingMaskIntoConstraints = false
        newlbl1.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(newlbl1)
        
        newlbl1.text = text
        newlbl1.textAlignment = textAlignment
        NSLayoutConstraint.activate([
            newlbl1.topAnchor.constraint(equalTo: topConstraint.bottomAnchor, constant: 15),
            newlbl1.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 10),
            newlbl1.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor ,constant: -10),
            newlbl1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        return newlbl1
    }

}

