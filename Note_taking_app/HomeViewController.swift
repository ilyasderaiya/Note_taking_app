//
//  ViewController.swift
//  Note_taking_app
//
//  Created by Khushi Verma on 2019-07-23.
//  Copyright © 2019 Team Stang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate  {
    
    

    @IBOutlet weak var allNotesTableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSlideMenuButton()
    }


    @IBAction func btnAddNotesClicked(_ sender: UIBarButtonItem) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllNotesTableViewCell") as! AllNotesTableViewCell
        
        
        return cell
    }
    
    
}

