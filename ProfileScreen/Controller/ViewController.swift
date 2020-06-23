//
//  ViewController.swift
//  ProfileScreen
//
//  Created by Shawn Li on 4/23/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    let imagePickerCtrl = UIImagePickerController()
    
    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         setupUI()
    }
    
    private func setupUI()
    {
        imagePickerCtrl.allowsEditing = true
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            imagePickerCtrl.delegate = self
            imagePickerCtrl.sourceType = .camera
            self.present(imagePickerCtrl, animated: true, completion: nil)
        }
        else
        {
            let errorAlert = UIAlertController(title: "Camera is unavaliable", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
          errorAlert.addAction(cancelAction)
            
            self.present(errorAlert, animated: true, completion: nil)
         }
        
    }
    
    @IBAction func CameraRollButtonTapped(_ sender: UIButton)
    {
        imagePickerCtrl.delegate = self
        imagePickerCtrl.sourceType = .photoLibrary
        self.present(imagePickerCtrl, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        
        profileImageView.contentMode = .scaleAspectFit
//        profileImageView.contentMode = .scaleAspectFill
//        profileImageView.contentMode = .scaleToFill
        profileImageView.image = image
        //release delegate
        imagePickerCtrl.delegate = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        // dismiss the photo
        self.dismiss(animated: true, completion: nil)
    }
}

