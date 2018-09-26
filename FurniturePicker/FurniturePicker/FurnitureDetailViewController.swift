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
