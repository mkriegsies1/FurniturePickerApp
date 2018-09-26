//
//  RoomListViewController.swift
//  FurniturePicker
//
//  Created by John Haney (Maryville) on 9/12/18.
//  Copyright © 2018 John Haney (Maryville). All rights reserved.
//

import UIKit

class RoomListViewController: UITableViewController {
    
    var rooms: [Room] = [Room(name: "Living Room", furniture: [Furniture(name: "Sofa")]),
                         Room(name: "Dining Room", furniture: [Furniture(name: "Table")])]

    @IBAction func addButtonPressed(_ sender: Any) {
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            self.rooms.append(Room(name: "Room", furniture: []))
            self.tableView.reloadData()
        }
        
        // TODO: create an UIAlertController here
        // Add the addAction to the alert controller
        // present the alertController
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rooms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)

        cell.textLabel?.text = rooms[indexPath.row].name

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? RoomContaining,
            let indexPath = tableView.indexPathForSelectedRow {
            vc.room = rooms[indexPath.row]
        }
    }

}
