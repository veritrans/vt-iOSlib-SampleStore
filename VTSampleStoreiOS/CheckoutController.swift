//
//  CheckoutController.swift
//  VTSampleStoreiOS
//
//  Created by Muhammad Anis on 12/30/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

import UIKit

class CheckoutController : UIViewController, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate
{
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var tokenLabel: UILabel!
    
    var totalPrice : Int = 0
    
    var checkoutItems : [VTCheckout] = []
    
    let CellIdentifier: String = "CellIdentifierCheckout"
    
    var token: VTToken? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for(checkoutItem) in checkoutItems{
            self.totalPrice += checkoutItem.item.price * checkoutItem.quantity
        }
        totalPriceLabel.text = "Total Price: \(self.totalPrice)"
        
        
        VTConfig.setCLIENT_KEY("VT-client-3YUXFj6X0XBpeDgf")
        VTConfig.setVT_IsProduction(false)
        
    }
    
    @IBAction func payBtnClikc(sender: AnyObject) {
        
        var vtDirect = VTDirect()
        var cardDetails = VTCardDetails()
        
        //TODO: Input your customer's credit card from input
        cardDetails.card_number = "4811111111111114"
        cardDetails.card_cvv = "123"
        cardDetails.card_exp_month = 1
        cardDetails.card_exp_year = 2020;
        cardDetails.secure = true
        cardDetails.gross_amount = "\(self.totalPrice)"
        
        vtDirect.card_details = cardDetails
        
        vtDirect.getToken { (token:VTToken!, ex : NSException!) -> Void in
            if(ex == nil){
                self.tokenLabel.text = "Token: \(token.token_id)"
                self.token = token
                if(token.redirect_url != nil){
                    let webView:UIWebView = UIWebView(frame: CGRectMake(0, 0, 400, 420))
                    webView.loadRequest(NSURLRequest(URL: NSURL(string:token.redirect_url)!))
                    webView.delegate = self
                    self.view.addSubview(webView)
                    
                }
                
            }else{
                println(ex.reason)
            }
        }
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        println("WebView start with error \(error)")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        if(webView.request?.URL.absoluteString?.rangeOfString("callback") != nil){
            //remove webview from parent
            //TODO: charge user and check whether transaction is success
            webView.removeFromSuperview();
            
            
            var request = NSMutableURLRequest(URL: NSURL(string: "http://128.199.141.15:9091/index.php")!)
            var session = NSURLSession.sharedSession()
            request.HTTPMethod = "POST"
            var bodyData = "token-id=\(self.token!.token_id)&price=\(totalPrice)"
            
            request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            var task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if(error == nil){
                    var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Body: \(strData!)")
                    let json = JSON(data:data)
                    if let success = json["status"].stringValue{
                        if(success == "success"){
                            let trxId = json["body"]["transaction_id"]
                            println("Success to Charging data with transaction id\(trxId)")
                        }else{
                            println("Failed to Charge")
                        }
                        
                    }else{
                        var errorS = json["status"]
                        println("error: \(errorS)")
                    }
                    
                }else{
                    println("Error: \(error.localizedDescription)")
                }
                
            })
            task.resume()
            
        }
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
