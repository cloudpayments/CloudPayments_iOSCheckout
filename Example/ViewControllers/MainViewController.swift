import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onOnStagePaymentClick(_ sender: Any) {
        
        guard let checkoutViewController = CheckoutViewController.storyboardInstance() else {
            return
        }
        
        checkoutViewController.payType = CheckoutViewController.PAY_TYPE_CHARGE
        
        navigationController?.pushViewController(checkoutViewController, animated: true)
    }

    @IBAction func onTwoStagePaymentClick(_ sender: Any) {
        
        guard let checkoutViewController = CheckoutViewController.storyboardInstance() else {
            return
        }
        
        checkoutViewController.payType = CheckoutViewController.PAY_TYPE_AUTH
        
        navigationController?.pushViewController(checkoutViewController, animated: true)
    }
}
