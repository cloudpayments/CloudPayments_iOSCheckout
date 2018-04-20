import UIKit

final class MainViewController: UIViewController {
    
    @IBAction func onOneStagePaymentClick(_ sender: Any) {
        showCheckoutViewController(type: .charge)
    }
    
    @IBAction func onTwoStagePaymentClick(_ sender: Any) {
        showCheckoutViewController(type: .auth)
    }
    
    private func showCheckoutViewController(type: PayType) {
        let checkoutViewController = CheckoutViewController.storyboardInstance(payType: type)
        navigationController?.pushViewController(checkoutViewController, animated: true)
    }
    
}
