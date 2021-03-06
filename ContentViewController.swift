//
//  ContentViewController.swift
//  Metabol
//
//  Created by Alan Valdez on 4/20/17.
//  Copyright © 2017 Alan Valdez. All rights reserved.
//

import UIKit
import ChameleonFramework

class ContentViewController: UITableViewController {
    
    let titles = ["Biomoleculas", "Carbohidratos", "Glucosa", "Enzimas", "ATP", "Metabolismo", "Glucolisis", "Glucogenesis"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //self.intializeTopicTitles()
        
//        let complementaryColor = UIColor.init(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: true)
//        
//        navigationController?.navigationBar.barTintColor = backgroundColor
//        
//        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: complementaryColor as! UIColor]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInformation", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath)

//        cell.tintColor = UIColor.flatWhite()
        cell.textLabel?.text = titles[indexPath.row]
//        cell.textLabel?.textColor = UIColor.flatWhite()
//        cell.backgroundColor = backgroundColor

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Selecciona alguna opción dentro de la lista para ver su contenido."
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Temas disponibles"
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showInformation" {
            let newView = segue.destination as! InformationViewController
            let indexPath = tableView.indexPathForSelectedRow
            let cell = tableView.cellForRow(at: indexPath!)
            
            newView.fileTitle = cell?.textLabel?.text
            newView.navigationItem.title = cell?.textLabel?.text
            
        }
    }
 

}
