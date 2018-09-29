//
//  FurnitureDetailViewController.swift
//  FurniturePicker
//
//  Created by John Haney (Maryville) on 9/13/18.
//  Copyright © 2018 John Haney (Maryville). All rights reserved.
//

import UIKit

class FurnitureDetailViewController: UIViewController, FurnitureContaining, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var furniture: Furniture?
    
    @IBOutlet var imageView: UIImageView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView?.image = furniture?.image
    }

    @IBAction func cameraButtonPressed(_ sender: Any) {
        // TODO: Create a UIImagePickerController here
        // Set the delegate to self
        // Set the source type to .photoLibrary to run in Simulator
        // present the image picker
        
        
        
        //Creates UIImagePickerController
            let pickImageImagePicker = UIImagePickerController()
            pickImageImagePicker.delegate = self
            pickImageImagePicker.sourceType = .photoLibrary
            

        
        //Creates UIAlertController
        let cameraButtonPress = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
       
        
        //3 options after pressing the button:
            //Cancel
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel)
        cameraButtonPress.addAction (cancelAlert)
        
            //Photo Library
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let choosePhotoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: { ACTION in pickImageImagePicker.sourceType = .photoLibrary
                self.present(pickImageImagePicker, animated: true, completion: nil)
                
            })
            cameraButtonPress.addAction(choosePhotoLibrary)
        }
        
            //Take Photo
            let chooseTakePhoto = UIAlertAction(title: "Take Photo", style: .default)
            cameraButtonPress.addAction(chooseTakePhoto)
    
        

            //presenting the functionality
            present(cameraButtonPress, animated: true, completion: nil)

        
        
    

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            furniture?.image = image
            DispatchQueue.main.async {
                self.imageView?.image = image
            }
        }
        dismiss(animated: true, completion: nil)
    }
 
 }
