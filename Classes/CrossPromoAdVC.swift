//
//  CrossPromoAdVC.swift
//  GlobalClassDemo
//
//  Created by Nilu Technologies 3 on 11/03/21.
//  Copyright © 2021 KishanPanchotiya. All rights reserved.
//

import UIKit
import FLAnimatedImage

class CrossPromoAdVC: UIViewController {

    public var closed:((_ isTap:Bool,_ strAPPID:String)->())?
    
    @IBOutlet var bgImage: FLAnimatedImageView!
    @IBOutlet var MainImage: FLAnimatedImageView!
    @IBOutlet var btngetapp: UIButton!
    @IBOutlet var btnCloseTrailing: NSLayoutConstraint!
    @IBOutlet var btnCloseaction: UIButton!
    var strAppID = ""
    var isTaped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if self.view.frame.height == 1366.0 {
                self.btnCloseTrailing.constant = -200
            }else {
                self.btnCloseTrailing.constant = -156
            }
            
        }else {
            if self.view.frame.height ==  736{
                // iPhone 6+
                self.btnCloseTrailing.constant = -28
            }else if self.view.frame.height ==  667{
                // iPhone 6
                self.btnCloseTrailing.constant = -28
            }else if self.view.frame.height ==  568{
                // iPhone se
                self.btnCloseTrailing.constant = -16
            }else {
                
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshList), name: Notification.Name(GlobalConstants.refreshImage), object: nil)
        DispatchQueue.main.async {
            self.showImage()
        }
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print(self.bgImage.bounds)
        
    }
    
    func setupUI(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView)
        
        self.view.bringSubviewToFront(self.bgImage)
        self.view.bringSubviewToFront(self.btngetapp)
        self.view.bringSubviewToFront(self.btnCloseaction)
    }
    
    @IBAction func btnCloseaction(_ sender: UIButton) {
        self.isTaped = false
        self.closeAndDismiss()
    }
    
   
    

    @IBAction func btnGetappaction(_ sender: UIButton) {
        if(NetworkManager.status == .NetworkStatusNotReachable){
            self.isTaped = false
            self.closeAndDismiss()
        }else {
//            StoreManager.showGiftItem(appID: self.strAppID, fromVC: self) {
                CrosspromotionAdManager.updateIsTap()
                self.isTaped = false
                self.closeAndDismiss()
            //}
           
        }
    }
    
    @objc func refreshList() {
        showImage()
    }
    @objc func showADS(){
        showImage()
    }
    
    func showImage() {
        if var data = UserDefaults.standard.value(forKey: GlobalConstants.configArr) as? [[String:Any]] {
            if GlobalConstants.currentIndex < data.count {
                let obj = data[GlobalConstants.currentIndex] as! [String:Any]
                
                if let image: (Data?, String,Bool) = CrosspromotionAdManager.showImageGlobal() as? (Data, String, Bool) {
                    if image.2 == false {
                        self.perform(#selector(self.showADS), with: nil, afterDelay: 0.5)
                    }else {
                        if image.0 != nil {
                            //btnCloseaction.setImage(nil, for: .normal)
                            DispatchQueue.main.async {
                                let strUrl = obj[GlobalConstants.Image] as! String
                                
                                let fullNameArr = strUrl.components(separatedBy:".")
                                if fullNameArr.last == "gif"{
                                    self.MainImage.animatedImage = FLAnimatedImage(gifData: image.0)
                                    self.bgImage.animatedImage = FLAnimatedImage(gifData: image.0!)
                                   // self.btnCloseaction.setImage(UIImage(named: "icnClose"), for: .normal)
                                }else{
                                    let image = UIImage(data:  image.0!)
                                    self.MainImage.image = image
                                    self.bgImage.image = image
                                }
                                
                            }
                            
                        }
                       
                        self.strAppID = image.1
                        setupUI()
                }
                }else {
                    print("Dhaval")
                }
            }
        }
    }
 
    func closeAndDismiss(){
        dismiss(animated: true) {
            self.closed?(self.isTaped,self.strAppID)
            self.closed = nil
        }
    }
}
