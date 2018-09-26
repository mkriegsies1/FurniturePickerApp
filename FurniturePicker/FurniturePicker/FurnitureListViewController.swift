//
//  FurnitureListViewController.swift
//  FurniturePicker
//
//  Created by John Haney (Maryville) on 9/12/18.
//  Copyright © 2018 John Haney (Maryville). All rights reserved.
//

import UIKit

class FurnitureListViewController: UITableViewController, RoomContaining, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var room: Room? {
        didSet {
            self.navigationItem.title = room?.name
        }
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let image = room?.furniture[indexPath.row].image
            else { return }
        let items = [image]
        
        // TODO: Create a UIActivityViewController here with the items
        // present the activity controller
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return room?.furniture.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FurnitureCell", for: indexPath)

        let furniture = room?.furniture[indexPath.row]
        cell.imageView?.image = furniture?.image
        cell.textLabel?.text = furniture?.name

        return cell
    }
}
