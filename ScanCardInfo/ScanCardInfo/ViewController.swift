//
//  ViewController.swift
//  ScanCardInfo
//
//  Created by 张青明 on 15/7/3.
//  Copyright © 2015年 张青明. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CardIOPaymentViewControllerDelegate {
    @IBOutlet weak var lbl_Result: UILabel!

    @IBAction func startScan(sender: UIButton) {
        var cardVC = CardIOPaymentViewController(paymentDelegate: self)
        cardVC.modalPresentationStyle = UIModalPresentationStyle.FormSheet
        
        presentViewController(cardVC, animated: true) { () -> Void in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - CardIOPaymentViewControllerDelegate
    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
        lbl_Result.text = "已取消扫描"
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        
        if let cardInformation = cardInfo {
            lbl_Result.text = "卡号:\(cardInformation.cardNumber)\n+到期:\(cardInformation.expiryYear)年, \(cardInformation.expiryMonth)\n+cvv:\(cardInformation.cvv)"
        }
        
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }

}

