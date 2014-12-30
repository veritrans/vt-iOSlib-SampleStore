//
//  CheckoutController.swift
//  VTSampleStoreiOS
//
//  Created by Muhammad Anis on 12/30/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

import UIKit

class CheckoutController : UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var checkoutItems : [VTCheckout] = []
    
    let CellIdentifier: String = "CellIdentifierCheckout"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var totalPrice : Int = 0
        
        for(checkoutItem) in checkoutItems{
            totalPrice += checkoutItem.item.price * checkoutItem.quantity
        }
        totalPriceLabel.text = "Total Price: \(totalPrice)"
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkoutItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var row = indexPath.row
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)! as UITableViewCell
        
        //set product name
        var labelName : UILabel? = cell.contentView.viewWithTag(1) as? UILabel
        if(labelName != nil){
            labelName!.text = checkoutItems[row].item.name
        }
        
        //set quantity label
        var quantityLabel : UILabel? = cell.contentView.viewWithTag(2) as? UILabel
        if(quantityLabel != nil){
            quantityLabel!.text = "x\(checkoutItems[row].quantity)"
        }
        
        //set total price label
        var priceLabel : UILabel? = cell.contentView.viewWithTag(3) as? UILabel
        if(priceLabel != nil){
            priceLabel!.text = "\(checkoutItems[row].item.price * checkoutItems[row].quantity)";
        }
        

        
        return cell
    }
    
    
        
}
