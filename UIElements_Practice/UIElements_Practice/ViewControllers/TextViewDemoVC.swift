//
//  TextViewDemoVC.swift
//  UIElements_Practice
//
//  Created by OBMac-13 on 12/02/26.
//

import UIKit

class TextViewDemoVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textViewOne: UITextView!
    @IBOutlet weak var lblCharacterCount: UILabel!
    
  
    let characterCountLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupTextView()
        setupCharacterLabel()
    }
    func textView(_ textView: UITextView,
                  primaryActionFor textItem: UITextItem,
                  defaultAction: UIAction) -> UIAction? {

        return UIAction(title: "Custom Open") { _ in
            print("User tapped detected item")
        }
    }
    
    func textView(_ textView: UITextView,
                  textItemMenuWillDisplayFor textItem: UITextItem,
                  animator: any UIContextMenuInteractionAnimating) {

        print("Menu will show")

        animator.addAnimations {
            textView.backgroundColor = .systemPink
        }
    }
    
    func textView(_ textView: UITextView,
                  willPresentEditMenuWith animator: UIEditMenuInteractionAnimating) {

        animator.addAnimations {
            textView.backgroundColor = UIColor.systemGray6
        }
    }


    func textView(_ textView: UITextView,
                  textItemMenuWillEndFor textItem: UITextItem,
                  animator: any UIContextMenuInteractionAnimating) {

        animator.addAnimations {
            textView.backgroundColor = .white
        }
    }

    func textView(_ textView: UITextView, editMenuForTextIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu? {
        var additionalActions: [UIMenuElement] = []
        if range.length > 0 {
            let highlightAction = UIAction(title: "Highlight", image: UIImage(systemName: "highlighter")) { action in
                if let textRange = Range(range, in: textView.text) {
                    let attributed = NSMutableAttributedString(attributedString: textView.attributedText)
                    attributed.addAttribute(.backgroundColor,
                                            value: UIColor.yellow,
                                            range: range)
                    textView.attributedText = attributed
                }
            }
            additionalActions.append(highlightAction)
        }
        let addBookmarkAction = UIAction(title: "Add Bookmark", image: UIImage(systemName: "bookmark")) { action in
            // The bookmark action.
        }
        additionalActions.append(addBookmarkAction)
//        return UIMenu(children: suggestedActions + additionalActions)
        return UIMenu(title: "",
                             children: [
                                 UIMenu(title: "Custom",
                                        options: .displayInline,
                                        children: additionalActions)
                             ])

    }

    func setupTextView() {
        // Text
        textViewOne.text = """
                            on filght AJ2002 Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  www.google.com
                            """
        textViewOne.font = UIFont.systemFont(ofSize: 18)
        textViewOne.textColor = .label
        textViewOne.textAlignment = .left
        
        // Appearance
        textViewOne.backgroundColor = .systemGray6
        textViewOne.layer.cornerRadius = 12
        textViewOne.layer.borderWidth = 1
        textViewOne.layer.borderColor = UIColor.systemGray4.cgColor
        
        // Keyboard
        textViewOne.keyboardType = .default
        textViewOne.returnKeyType = .done
        textViewOne.autocapitalizationType = .sentences
        textViewOne.autocorrectionType = .yes
        //        textViewOne.textContentType = .creditCardNumber
        
        // Behavior
        textViewOne.isEditable = true
        textViewOne.isSelectable = true
        textViewOne.isScrollEnabled = true
        
        //scroll behaviours
        
        textViewOne.showsVerticalScrollIndicator = true
        //        textViewOne.showsHorizontalScrollIndicator = true
        textViewOne.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        
        
        // Data detectors
        textViewOne.dataDetectorTypes = [.phoneNumber, .link , .flightNumber]
        
        // Delegate
        textViewOne.delegate = self
        
        //linkk text
        let attributedString = NSMutableAttributedString(string: textViewOne.text)
        
        let linkRange = (textViewOne.text as NSString).range(of: "on filght AJ2002")
        
        attributedString.addAttribute(
            .link,
            value: "https://www.apple.com",
            range: linkRange
        )
        textViewOne.linkTextAttributes = [.foregroundColor: UIColor.red]
        
        textViewOne.attributedText = attributedString
    }

    func setupCharacterLabel() {
        lblCharacterCount.text = "0 characters"
        lblCharacterCount.textAlignment = .right

    }

    // MARK: - Delegate Methods

    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Started Editing")
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        print("Finished Editing")
    }

    func textViewDidChange(_ textView: UITextView) {
        lblCharacterCount.text = "\(textViewOne.text.count) characters"
    }

    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        
        // Dismiss keyboard on Done
        if text == "\n" {
            textViewOne.resignFirstResponder()
            return false
        }
        
        // Limit characters to 200
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        return updatedText.count <= 200
    }
    
    
    @IBAction func btnToggle(_ sender: Any) {
//        textViewOne.isSelectable.toggle()
        textViewOne.isEditable.toggle()
    }
    
    
}

class NoSelectionTextView: UITextView {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false   // disables copy/paste menu
    }

    override var selectedTextRange: UITextRange? {
        get { return super.selectedTextRange }
        set { }  // ignore external selection changes
    }
}

