//
//  PurchaseViewController.swift
//  
//
//  Created by Kishan on 05/12/17.
//  Copyright © 2017 Kishan. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {

    //DEVCHECK
    // 1 - YOUR CLASS NAME MUST BE PurchaseViewController, SET CLASS NAME IN STORYBOARD ALSO
    // 2 - SET STORYBOARD ID TO "PurchaseViewController"
    // 3 - IT MUST BE SHOWN WITH PurchaseManager.askForPurchaseRestoreOrCancel, DO NOT USE SEGUE TO SHOW THIS CLASS
    // 4 - DESIGN MUST HAVE "RESTORE BUTTON" ALSO
    //DEVCHECK - END

    //DEVCHECK - ADD THIS VARIABLE IN YOUR PurchaseViewController
    public var finished:(()->())?
    //DEVCHECK - END

    var isAppeared = false

    @IBOutlet weak var purchaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //DEVCHECK - APPEND PRICE STRING IN "PURCHASE NOW" BUTTON
        if !PurchaseManager.firstIAPPriceString.isEmptyWithoutWhiteSpaces{
            if let oldTitle = purchaseButton.title(for: .normal){
                let newTitle = "\(oldTitle) \(PurchaseManager.firstIAPPriceString)"
                purchaseButton.setTitle(newTitle, for: .normal)
            }
        }
        //DEVCHECK - END

      // let val = CrosspromotionAdManager.getCrossADDetailsValue()
       // print(val)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(!isAppeared){
            isAppeared = true
            
            //DEVCHECK - ADD THIS CODE IN didAppear METHOD
            if(NetworkManager.status == .NetworkStatusNotReachable){
                NetworkManager.checkAndShowNoInternetAlert(optional: true, completion: nil)
            }else if(PurchaseManager.isProductFetched == .ProductFetchedStatusNotFetched){
                PurchaseManager.retriveProducts(completion: nil)
            }
            //DEVCHECK - END

        }
    }
    
    @IBAction func purchaseTapped(_ sender: UIButton) {
        //DEVCHECK - CALL BELOW CODE WHEN USER TAP PURCHASE
        PurchaseManager.purchase(completion: {[weak weakVC = self] (response) in
            if(response == PurchaseResponse.PurchaseResponseSuccess){
                weakVC?.finishAndDismiss()
            }
        })
        //DEVCHECK - END
    }
    
    @IBAction func restoreTapped(_ sender: UIButton) {
        //DEVCHECK - CALL BELOW CODE WHEN USER TAP RESTORE
        PurchaseManager.restorePurchase (completion: {[weak weakVC = self] (response) in
            if(response == PurchaseResponse.PurchaseResponseSuccess){
                weakVC?.finishAndDismiss()
            }
        })
        //DEVCHECK - END
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
        //DEVCHECK - CALL BELOW CODE WHEN USER TAP CLOSE
        finishAndDismiss()
        //DEVCHECK - END
    }
    
    //DEVCHECK
    //ADD THIS METHOD IN YOUR PurchaseViewController
    //AND CALL IT WHENEVER YOU WANT TO DISMISS THIS CONTROLLER
    func finishAndDismiss(){
        dismiss(animated: true) {
            self.finished?()
            self.finished = nil
        }
    }
    //DEVCHECK - END
}
