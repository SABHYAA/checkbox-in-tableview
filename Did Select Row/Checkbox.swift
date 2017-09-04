//
//  Checkbox.swift
//  Did Select Row
//
//  Created by appinventiv on 04/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Checkbox: UIViewController {

    @IBOutlet var checkboxTableView: UITableView!
    @IBAction func checkboxUIButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
    }
    var food = ["pizza", "burger", "coldinks", "icecream"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.checkboxTableView.dataSource = self
        self.checkboxTableView.delegate = self
    }
//    @IBAction func checkboxUIButton(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//    }
    
   
    
}
extension Checkbox: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as? Customcell
            else{
                fatalError()
                
        }
        cell.foodUILabel?.text = food[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
    class Customcell: UITableViewCell {
        
        @IBOutlet var foodUILabel: UILabel!
       
        @IBOutlet weak var checkboxUIButton: UIButton!
}
