//
//  ShopController.swift
//  VTSampleStoreiOS
//
//  Created by Muhammad Anis on 12/29/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

import UIKit

class ShopController : UITableViewController{
    
    let CellIdentifier: String = "CellIdentifier"
    
    var cart : [VTItem : Int] = [:]
    
    var items : [VTItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load all vtitem
        items.append(VTItem(id: 1, imageName: "motor1", name: "Ducati Course", price: 500000))
        items.append(VTItem(id: 2, imageName: "motor2", name: "Nicky Hayden", price: 400000))
        items.append(VTItem(id: 3, imageName: "motor3", name: "Mach 1", price: 300000))
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var row = indexPath.row
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)! as UITableViewCell
        
        //set image
        var itemImage : UIImageView? = cell.contentView.viewWithTag(1) as? UIImageView
        if(itemImage != nil){
            itemImage!.image = UIImage(named: "motor\(row+1)")
        }
        
        //set item name
        var label : UILabel? = cell.contentView.viewWithTag(2) as? UILabel
        if(label != nil){
            label!.text = items[row].name
        }
        
        //set price
        var labelPrice : UILabel? = cell.contentView.viewWithTag(3) as? UILabel
        if(labelPrice != nil){
            labelPrice!.text = "\(items[row].price)"
        }
        
        var buyBtn : UIButton? = cell.contentView.viewWithTag(4) as? UIButton
        if(buyBtn != nil){
            println(row)
            buyBtn!.tag = row
        }
        
        return cell as UITableViewCell
    }
    
    @IBAction func buyBtnClick(sender: AnyObject) {
        println(sender.tag)
    }
    
}
