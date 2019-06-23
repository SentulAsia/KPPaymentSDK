/// Copyright © 2019 Kiple Sdn Bhd
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class ViewController: UIViewController, KPPaymentDelegate {

    @IBOutlet weak var referenceIdTextField: UITextField!

//        let payment = KPPayment(merchantId: 48, storeId: 38, secret: "l43wrf8cai") // sandbox
    let payment = KPPayment(merchantId: 141, storeId: 103, secret: "l43wrf8cai") // staging

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        payment.delegate = self
    }

    @IBAction func payButtonTapped(_ sender: UIButton) {
        self.payment.makePayment(referenceId: referenceIdTextField.text ?? "", amount: 1.1)
    }

    @IBAction func backgroundViewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    func paymentDidFinish(successfully flag: Bool, withMessage message: String) {
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

