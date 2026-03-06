//
//  VideoViewController.swift
//  ImagePicker_Practice
//
//  Created by OBMac-13 on 20/02/26.
//

import UIKit
import AVKit

class VideoViewController: UIViewController,
                           UIImagePickerControllerDelegate,
                           UINavigationControllerDelegate,
                           UIVideoEditorControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnClickVideoEditor(_ sender: Any) {
        
        let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.mediaTypes = ["public.movie"]
            picker.delegate = self

            present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        dismiss(animated: true)

        if let videoURL = info[.mediaURL] as? URL {

            showOptions(for: videoURL)
        }
    }
    
    func showOptions(for url: URL) {

        let alert = UIAlertController(title: "Choose Action",
                                      message: nil,
                                      preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Watch",
                                      style: .default,
                                      handler: { _ in
            self.playVideo(url: url)
        }))

        alert.addAction(UIAlertAction(title: "Edit",
                                      style: .default,
                                      handler: { _ in
            self.editVideo(url: url)
        }))

        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel))

        present(alert, animated: true)
    }
    
    func playVideo(url: URL) {

        let playerVC = AVPlayerViewController()
        playerVC.player = AVPlayer(url: url)

        present(playerVC, animated: true) {
            playerVC.player?.play()
        }
    }
    
    func editVideo(url: URL) {

        if UIVideoEditorController.canEditVideo(atPath: url.path) {

            let editor = UIVideoEditorController()
            editor.videoPath = url.path
            editor.videoMaximumDuration = 30.0
            editor.videoQuality = .typeMedium
            editor.delegate = self

            present(editor, animated: true)
        }
    }
    
    func videoEditorController(_ editor: UIVideoEditorController,
                               didSaveEditedVideoToPath editedVideoPath: String) {

        let editedURL = URL(fileURLWithPath: editedVideoPath)

        print("Edited Video:", editedURL)

        dismiss(animated: true)
    }
    
    func videoEditorControllerDidCancel(_ editor: UIVideoEditorController) {
        dismiss(animated: true)
    }
}
