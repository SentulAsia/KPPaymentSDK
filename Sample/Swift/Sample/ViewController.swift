//
//  ViewController.swift
//  Sample
//
//  Created by Zaid M. Said on 29/08/2018.
//  Copyright © 2018 Kiple Sdn Bhd. All rights reserved.
//

import UIKit
import KPPaymentSDK

class ViewController: UIViewController, KPPaymentDelegate {

    let payment = KPPayment(merchantId: 1, secret: "SECRET", isProduction: false)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        payment.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func payButtonTapped(_ sender: UIButton) {
        self.payment.makePaymentForStoreId(2, withReferenceId: "UNIQUEREF1", andAmount: 12.34)
    }

    func paymentDidFinishSuccessfully(_ flag: Bool, withMessage message: String, andPayload payload: [String : Any]) {
        if flag {
            let alert = UIAlertController(title: "Sample App", message: "Payment is successful", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Sample App", message: "Payment is NOT successful", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

