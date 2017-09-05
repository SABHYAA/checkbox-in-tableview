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
    
    var food = ["pizza", "burger", "coldinks", "icecream"]
    var selectIdx = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkboxTableView.dataSource = self
        self.checkboxTableView.delegate = self
        
    }

   
    // Do any additional setup after loading the view.
    
    //    @IBAction func checkboxUIButton(_ sender: UIButton) {
    //        sender.isSelected = !sender.isSelected
    //    }
    
func checkboxUIButton(_ sender: UIButton) {
    
    var cellView = sender.superview
    while !(cellView is UITableViewCell){
        cellView = cellView!.superview
    }
    let cell = cellView as! UITableViewCell
    let indexPath = self.checkboxTableView.indexPath(for: cell)
    
    self.selectIdx = indexPath?.row ?? -1
    
    self.checkboxTableView.reloadData()
    }
    
 }

extension Checkbox: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count + 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as? Customcell
            else{
                fatalError()
                
        }
        cell.foodUILabel?.text = food[indexPath.row%4]
        
        if self.selectIdx == indexPath.row{
            cell.checkboxUIButton.setImage(UIImage(named: "checkmark"), for: .normal)
        }else{
            cell.checkboxUIButton.setImage(UIImage(named: "uncheck1"), for: .normal)
        }

    return cell
    }
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectIdx = indexPath.row
        self.checkboxTableView.reloadData()
    }
}

class Customcell: UITableViewCell {
    
    @IBOutlet var foodUILabel: UILabel!
    @IBOutlet weak var checkboxUIButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //        override func layoutSubviews() {
    //            super.layoutSubviews()
    //        }
}

