//
//  ViewController.swift
//  ImagePicker_Practice
//
//  Created by OBMac-13 on 20/02/26.
//

import UIKit
import SDWebImage
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var imageviewheightconstraint: NSLayoutConstraint!
    
    // Stores the image picked from camera / gallery
    var selectedImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.layer.cornerRadius = 50
        labelDesc.text = "Select Image From Camera or Gallery 011034"
        labelDesc.font = UIFont(name: "ChrustyRock", size: 15)
        labelDesc.adjustsFontForContentSizeCategory = true
        labelDesc.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .medium)
//        labelDesc.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .regular)
        labelDesc.font = UIFont.systemFont(ofSize: 20,
                                       weight: .medium,
                                       width: .condensed)
    }
    
   
    @IBAction func btnSaveImage(_ sender: Any) {
        guard let image = selectedImage else {
            showAlert(title: "No Image", message: "Please select an image first before saving.")
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaveCompletion(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func imageSaveCompletion(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            showAlert(title: "Save Failed", message: error.localizedDescription)
        } else {
            showAlert(title: "Saved!", message: "Image has been saved to your gallery.")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func checkPhotoPermission() {
        
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)

        switch status {
            
        case .authorized:
            openPicker()

        case .limited:
            openPicker()   // user selected limited photos

        case .denied, .restricted:
            showAlert(title: "Permission Denied",
                      message: "Please allow photo access in Settings")

        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { newStatus in
                DispatchQueue.main.async {
                    if newStatus == .authorized || newStatus == .limited {
                        self.checkPhotoPermission()
                    }
                }
            }

        @unknown default:
            break
        }
    }
    
    @IBAction func btnClickOpenPicker(_ sender: Any) {
      
      
            let alert = UIAlertController(title: "Select Image",
                                          message: "Choose Image From",
                                          preferredStyle: .actionSheet)
            
           
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                self.openCamera()
            }))
            
         
            alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                self.checkPhotoPermission()
            }))
            
    
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(alert, animated: true)
        
    }
    func openCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.mediaTypes = ["public.image"]
            picker.allowsEditing = true
            
            self.present(picker, animated: true)
            
        } else {
            let noCameraAlert = UIAlertController(
                title: "No Camera Found",
                message: "This device does not have a camera available.",
                preferredStyle: .alert
            )
            noCameraAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
                self?.btnClickOpenPicker(self as Any)
            }))
            self.present(noCameraAlert, animated: true)
        }
    }
    func openPicker(){
        let imagecontroller = UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.mediaTypes = ["public.image"]
        imagecontroller.allowsEditing = true
        imagecontroller.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        self.present(imagecontroller, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.editedImage] as? UIImage {
            self.selectedImage = selectedImage
            imageview.image = selectedImage
            imageview.contentMode = .scaleAspectFill
            self.view.layoutIfNeeded()
        }
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}


