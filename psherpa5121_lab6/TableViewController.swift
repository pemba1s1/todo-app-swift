//
//  TableViewController.swift
//  psherpa5121_lab6
//
//  Created by user237120 on 2/18/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    var todoLists:[String] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedItems = UserDefaults.standard.array(forKey: "todoLists") as? [String] {
            todoLists = savedItems
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoLists.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell

        cell.todoTitle.text = todoLists[indexPath.row]

        return cell
    }

    @IBAction func addTodo(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Todo", message: "",preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Todo Item"
        }
        let addAction = UIAlertAction(title: "Add", style: .default, handler: {
            _ in
            if let textField = alert.textFields?.first {
                if let text = textField.text {
                    if text.isEmpty {
                        return
                    }
                    self.todoLists.append(text)
                    UserDefaults.standard.set(self.todoLists, forKey: "todoLists")
                    if let index = self.todoLists.firstIndex(of: text) {
                        let indexPath = IndexPath(row: index, section: 0)
                        self.tableView.insertRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todoLists.remove(at: indexPath.row)
            UserDefaults.standard.set(self.todoLists, forKey: "todoLists")
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
