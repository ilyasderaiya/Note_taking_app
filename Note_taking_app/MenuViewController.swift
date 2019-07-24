//
//  MenuViewController.swift
//  Note_taking_app
//
//  Created by Khushi Verma on 2019-07-23.
//  Copyright © 2019 Team Stang. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var btnMenu: UIButton!
    var delegate: SlideMenuDelegate?
    
    
    @IBOutlet weak var tableViewCat: UITableView!
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    @IBOutlet weak var btnAllNotes: UIButton!
    @IBOutlet weak var btnAddCat: UIButton!
    
    var category:[String] = ["Work", "Home", "College"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnAllNotes.layer.cornerRadius = 5
        btnAllNotes.layer.borderWidth = 1
        btnAllNotes.layer.borderColor = UIColor.black.cgColor
        btnAddCat.layer.cornerRadius = 5
        btnAddCat.layer.borderWidth = 1
        btnAddCat.layer.borderColor = UIColor.black.cgColor
    }
    
    
    @IBAction func btnAllNotesClicked(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btnAddCategory(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add Category!", message: "Enter a text", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Category Name"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            //            print("Text field: \(String(describing: textField!.text))")
            if(!(textField?.text!.isEmpty)!){
                self.category.append(textField!.text!)
                print(self.category)
                self.tableViewCat.reloadData()
            }else{
                print("Empty Category")
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func btnCloseMenuClicked(_ sender: UIButton) {
        btnMenu.tag = 0
        btnMenu.isHidden = false
        if (self.delegate != nil){
            var index = Int32(sender.tag)
            if (sender == self.btnCloseMenuOverlay) {
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear },
                       completion: { (finished) -> Void in
                        self.view.removeFromSuperview()
                        self.removeFromParent()
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        cell.lblCatTitle.text = self.category[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let catvc = sb.instantiateViewController(withIdentifier: "CategoryNotesViewController") as! CategoryNotesViewController
        self.navigationController?.pushViewController(catvc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            category.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            print(self.category)
        }
    }
    

}
