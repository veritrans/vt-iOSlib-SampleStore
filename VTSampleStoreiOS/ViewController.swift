//
//  ViewController.swift
//  VTSampleStoreiOS
//
//  Created by Muhammad Anis on 12/12/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate{


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        VTConfig.setCLIENT_KEY("VT-client-3YUXFj6X0XBpeDgf")
        VTConfig.setVT_IsProduction(false)
        
        
        var vtDirect = VTDirect()
        var cardDetails = VTCardDetails()
        cardDetails.card_number = "4811111111111114"
        cardDetails.card_cvv = "123"
        cardDetails.card_exp_month = 1
        cardDetails.card_exp_year = 2020;
        cardDetails.secure = true
        cardDetails.gross_amount = "10000"
        
        vtDirect.card_details = cardDetails
        
        vtDirect.getToken { (token:VTToken!, ex : NSException!) -> Void in
            if(ex == nil){
                println(token.token_id)
                println(token.redirect_url)
                if(token.redirect_url != nil){
                    let webView:UIWebView = UIWebView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
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
        println("should Url: \(request.URL.absoluteString)")
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
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

