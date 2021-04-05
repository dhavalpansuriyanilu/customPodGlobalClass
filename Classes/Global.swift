//
//
//  Global.swift
//
//  Created by Kishan on 26/08/17.
//  Copyright © 2017 Kishan. All rights reserved.
//

import Foundation
import UserNotifications
import StoreKit
import MessageUI
import SafariServices
import SVProgressHUD
import SwiftyStoreKit
import Reachability
//import Firebase
import FirebaseRemoteConfig
import FirebaseAnalytics
import FirebaseCore
//import FBAudienceNetwork

struct GlobalConstants{

//TLCHECK - Before Live Start

    static let appId = ""
    static let inAppPurchaseProductId = ""
    static let splashScreenDisplayTimeInSeconds : Double = 2
    static let emailToContactUs = ""
    static let contactUsLink = ""
    
    static let artistId :Int = 0
    
    static let FirebaseRemoteConfigGamePlayStartAdsShouldShowFirstTimeDefaultValue = true //will not work on first launch
    static let FirebaseRemoteConfigGamePlayStartAdsEveryNthTimeDefaultValue = 2
    static let FirebaseRemoteConfigGamePlayShareAdsShouldShowFirstTimeDefaultValue = true //will work on first launch also
    static let FirebaseRemoteConfigGamePlayShareAdsEveryNthTimeDefaultValue = 2
    static let FirebaseRemoteConfigGiftIconShouldShowDefaultValue = true
    static let FirebaseRemoteConfigGiftIconAppIdDefaultValue = ""

    //Ads Key
    
    static let ironSourceAppKey = ""
  
    //TLCHECK AD - IronSource-ChartBoost Start
    static let chartBoostAppId = ""
    static let chartBoostAppSignature = ""
    //TLCHECK AD - IronSource-ChartBoost End
    
    //TLCHECK AD - IronSource-AppLovin Start
    //ADD KEY IN Info.Plist with key name - AppLovinSdkKey
    //TLCHECK AD - IronSource-AppLovin End
    
    static let shouldSetupRewardedVideo = false // make it false if this app not using Rewarded Videos

    //Live
    
//    static let fbid50or90Height = ""
//    static let isInterstitialTestModeEnabled = false
//    static let shouldConfigFirebase = true //GoogleInfo.plist must be added,and bundle id must match to firebase
//    static let shouldPrintAdMethodDetails = false

    //Test
    
    static let fbid50or90Height = "IMG_16_9_APP_INSTALL#"
    static let isInterstitialTestModeEnabled = true
    static let shouldConfigFirebase = true
    static let shouldPrintAdMethodDetails = true

    //Share message
    static let shareMessage = "I found one of the best application... You must try too... Download \(GlobalConstants.appName) App Now ...\n\(GlobalConstants.appLink)"
    
    //Local notifications
    static let localNotificationMessageArray: Array<String> =
        [
            "1st MESSAGE",
            "2nd MESSAGE",
            "3rd MESSAGE",
            "4th MESSAGE",
            "5th MESSAGE",
            "6th MESSAGE",
            "7th MESSAGE",
            "8th MESSAGE",
            "9th MESSAGE",
            "10th MESSAGE"
    ]
    static let localNotificationDayArray:Array<Int> = [1,3,6,10,11,13,16,20,24,29]
//TLCHECK - Before Live End
    
    static let FirebaseRemoteConfigGamePlayStartAdsShouldShowFirstTimeKey = "GAME_PLAY_START_ADS_SHOULD_SHOW_FIRST_TIME"
    static func getGamePlayStartAdsShouldShowFirstTimeValue() -> Bool{
            return FirebaseRemoteConfigGamePlayStartAdsShouldShowFirstTimeDefaultValue
    }
    
    static let FirebaseRemoteConfigGamePlayStartAdsEveryNthTimeKey = "GAME_PLAY_START_ADS_NTH_TIME"
    static func getGamePlayStartAdsEveryNthTimeValue() -> Int{
            return FirebaseRemoteConfigGamePlayStartAdsEveryNthTimeDefaultValue
    }
    
    
    static let FirebaseRemoteConfigGamePlayShareAdsShouldShowFirstTimeKey = "GAME_PLAY_SHARE_ADS_SHOULD_SHOW_FIRST_TIME"
    static func getGamePlayShareAdsShouldShowFirstTimeValue() -> Bool{
            return FirebaseRemoteConfigGamePlayShareAdsShouldShowFirstTimeDefaultValue
    }

    static let FirebaseRemoteConfigGamePlayShareAdsEveryNthTimeKey = "GAME_PLAY_SHARE_ADS_NTH_TIME"
    static func getGamePlayShareAdsEveryNthTimeValue() -> Int{
            return FirebaseRemoteConfigGamePlayShareAdsEveryNthTimeDefaultValue
    }
    
    static let FirebaseRemoteConfigGiftIconShouldShowKey = "GIFT_ICON_SHOULD_SHOW"
    static func getGiftIconShouldShowValue() -> Bool{
            return FirebaseRemoteConfigGiftIconShouldShowDefaultValue
    }
    
    static let FirebaseRemoteConfigGiftIconAppIdKey = "GIFT_ICON_APP_ID"
    static func getGiftIconAppIdValue() -> String{
            return FirebaseRemoteConfigGiftIconAppIdDefaultValue
    }//
    static let FirebaseRemoteConfigIAPDetailsKey = "IAP_DETAILS"
    
    static let FirebaseRemoteConfigCrossADDetailsKey = "APPDATA"
   
    
    static let FirebaseRemoteConfigIAPDetailsDefaultValue : NSArray = [[GlobalConstants.AppId:"1","Version":"1.0","IsTapped":"0","Image":"https://homepages.cae.wisc.edu/~ece533/images/airplane.png","isImageLoaded":"0"]]
    
   
    static let testingArr : NSArray = [[GlobalConstants.AppId:"1031","Version":"1.0","IsTapped":"0","Image":"https://is1-ssl.mzstatic.com/image/thumb/Purple114/v4/b7/eb/f9/b7ebf93a-38dc-26ee-dc99-23180ab2d5b6/AppIcon-1x_U007emarketing-0-7-0-85-220.png/460x0w.webp","isImageLoaded":"0"],[GlobalConstants.AppId:"1041","Version":"1.0","IsTapped":"0","Image":"https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/03/90/f0/0390f0eb-c828-609b-7bce-eff2a4ddd5b6/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/460x0w.webp","isImageLoaded":"0"]]
    
//
    
    static let FirebaseRemoteConfigCrossADDetailsDefaultValue : [[String:String]] = [[GlobalConstants.AppId:"1","Version":"1.0","IsTapped":"0","Image":"https://homepages.cae.wisc.edu/~ece533/images/airplane.png","isImageLoaded":"0"]]
    
    static func getCrossADDetailsValue() -> [[String:String]]{
            let value = FirebaseManager.remoteConfig[FirebaseRemoteConfigCrossADDetailsKey]
            if shouldConfigFirebase && value.source != .static{
                if let valToReturn = value.jsonValue as? [String:Any] {
                    if let valData = valToReturn["data"] as? [[String:String]] {
                        return valData
                    }else {
                        return FirebaseRemoteConfigCrossADDetailsDefaultValue
                    }
                    
                }else{
                    return FirebaseRemoteConfigCrossADDetailsDefaultValue
                }
            }else{
                return FirebaseRemoteConfigCrossADDetailsDefaultValue
            }
        }
    
    static let firebaseDefaultValueArray =
        [
            FirebaseRemoteConfigGamePlayStartAdsShouldShowFirstTimeKey:FirebaseRemoteConfigGamePlayStartAdsShouldShowFirstTimeDefaultValue as NSObject,
            FirebaseRemoteConfigGamePlayStartAdsEveryNthTimeKey:FirebaseRemoteConfigGamePlayStartAdsEveryNthTimeDefaultValue as NSObject,
            FirebaseRemoteConfigGamePlayShareAdsShouldShowFirstTimeKey:FirebaseRemoteConfigGamePlayShareAdsShouldShowFirstTimeDefaultValue as NSObject,
            FirebaseRemoteConfigGamePlayShareAdsEveryNthTimeKey:FirebaseRemoteConfigGamePlayShareAdsEveryNthTimeDefaultValue as NSObject,
            FirebaseRemoteConfigGiftIconShouldShowKey:FirebaseRemoteConfigGiftIconShouldShowDefaultValue as NSObject,
            FirebaseRemoteConfigGiftIconAppIdKey:FirebaseRemoteConfigGiftIconAppIdDefaultValue as NSObject,
            FirebaseRemoteConfigIAPDetailsKey:FirebaseRemoteConfigIAPDetailsDefaultValue as NSObject,
            FirebaseRemoteConfigCrossADDetailsKey:FirebaseRemoteConfigCrossADDetailsDefaultValue as NSObject
    ]
    
    static let FirebaseEventAppStoreReviewedKey = "AppStore_Reviewed"

    static let sharedApp = UIApplication.shared
    
    //NSUserDefaults Variable
    static let appLaunchCounterKey = "appLaunchCounter"
    static let appIsReviewedKey = "appIsReviewed"
    static let appIsInAppPurchasedKey = "inAppPurchased"
    
    //No need to change
    static let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String ?? ""
    static let appLink = "https://itunes.apple.com/app/id\(appId)"
    static let appRateReviewLink = "\(appLink)?action=write-review"
    
    //Alert Title
    static let AlertOkButton = "Ok"
    static let AlerNextTimeButton = "Next time"
    static let AlerErrorTitle = "Error"
    
    //Purchase error
    static let inAppPurchaseFailedMessage = "Something went wrong, Please try again!"

    //Bored With Ads
    static let boredWithAdsAlertTitle = "We don't want to bother!"
    static let boredWithAdsAlertMessage = "Are you bored with ads? You can Remove all type of Ads Now!"
    static let boredWithAdsAlertPurchaseButton = "Yes, Remove"
    static let boredWithAdsAlertNoPurchaseButton = "No, It's Ok"
    
    //Review at App Launch
    static let reviewAlertTitle = "We love you!"
    static let reviewAlertMessage = "If you feel we have done a good job then please rate us."
    static let reviewAlertButtonRateMe = "Rate Me"

    static let ConnectToInternetAlertTitle = "Connect to Internet"
    static let noInternetTryAgainAlertMessage = "Please connect to internet, and try again!"
    static let internetRequiredToUseAppAlertMessage = "Please connect to internet to use this app."
    
        // MARK :- CrosspromotionAdManager constant variable
    
    static let configArr = "configArr"
    static var currentIndex = 0
    static var tapCount = 0
    static let AppId = "AppId"
    static let Version = "Version"
    static let IsTapped = "IsTapped"
    static let Image = "Image"
    static let isImageLoaded = "isImageLoaded"
    static var testingCount = 0
    static let refreshImage = "refreshImage"
    static var uploadCount = 0
    static var saveCurrentIndex = "saveCurrentIndex"
}

func setupAppLaunch() {
    
    FirebaseManager.setup()
    
    //Network manager to showGamePlayStartAdhase product request when internet available
    NetworkManager.setup()
    //Increament App launch counter
    Counters.increamentAppLaunchCounter()
    //to setup and fetch in-app purchase products
    PurchaseManager.setup()
    //to set hud color and default properties
    HudManager.setup()
    //to clear badge icon and other scheduled notifications
    LocalNotificationManager.setup()
    
}

//extension Notification.Name {
//    static let kPurchaseManagerProductFetchedNotification = Notification.Name("kPurchaseManagerProductFetchedNotification")
//}

enum PurchaseResponse {
    case PurchaseResponseSuccess
    case PurchaseResponseFail
    case PurchaseResponseCanceledByUser
}
enum ProductFetchedStatus : String{
    case ProductFetchedStatusFetching
    case ProductFetchedStatusSuccess
    case ProductFetchedStatusNotFetched
}

class CrosspromotionAdManager {
    
    class ConfigData: NSObject {

        var AppId:String!
        var Version:String!
        var IsTapped:String!
        var imageUrl:String!
        var isImageLoaded:String!
        
        
        init(dict:[String:Any]) {
            AppId = "\(dict["AppId"] ?? "")"
            Version = "\(dict["Version"] ?? "")"
            IsTapped = "\(dict["IsTapped"] ?? "")"
            imageUrl = "\(dict["Image"] ?? "")"
            isImageLoaded = "\(dict["isImageLoaded"] ?? "")"
        }
    }
    
    static func getdata() {
        let ConfigDataarr = GlobalConstants.getCrossADDetailsValue()
  
        var arrData:[ConfigData] = []
        var filterarr:[Any] = []
        var arrSaveData:[ConfigData] = []
        
        for i in ConfigDataarr {
            arrData.append(ConfigData(dict: i))
          
        }
        if arrData.count > 0 {
            if let saveArr =  UserDefaults.standard.value(forKey: GlobalConstants.configArr) as? [[String:Any]] {
                for  i  in saveArr {
                    arrSaveData.append(ConfigData(dict: i ))
                }
                for i in arrData {
                    
                    let results = arrSaveData.filter { $0.AppId == i.AppId}
                    if results.count > 0 {
                        for k in results {
                            if k.Version == i.Version {
                                if k.IsTapped == "1" {
                                    let obj = [GlobalConstants.AppId:k.AppId,GlobalConstants.Version:k.Version,GlobalConstants.IsTapped:k.IsTapped,GlobalConstants.Image:i.imageUrl,GlobalConstants.isImageLoaded:"1"]
                                    filterarr.append(obj)
                                }else {
                                    let obj = [GlobalConstants.AppId:k.AppId,GlobalConstants.Version:k.Version,GlobalConstants.IsTapped:k.IsTapped,GlobalConstants.Image:i.imageUrl,GlobalConstants.isImageLoaded:"1"]
                                    filterarr.append(obj)
                                }
                            }else {
                                let obj = [GlobalConstants.AppId:i.AppId,GlobalConstants.Version:i.Version,GlobalConstants.IsTapped:"0",GlobalConstants.Image:i.imageUrl,GlobalConstants.isImageLoaded:"0"]
                                filterarr.append(obj)
                            }
                        }
                    }else {
                        let obj = [GlobalConstants.AppId:i.AppId,GlobalConstants.Version:i.Version,GlobalConstants.IsTapped:"0",GlobalConstants.Image:i.imageUrl,GlobalConstants.isImageLoaded:"0"]
                        filterarr.append(obj)
                    }
                    
                }
                let arrtemp:NSArray = filterarr as NSArray
                UserDefaults.standard.setValue(arrtemp, forKey: "configArr")
                UserDefaults.standard.synchronize()
                GlobalConstants.uploadCount = 0
                downloadImage()
            }else {
                
                for i in arrData {
                    let obj = i as? [String:Any]
                    
                    let id = i.AppId
                    let Version = i.Version //obj![GlobalConstants.Version] as! String
                    let Image = i.imageUrl //obj![GlobalConstants.Image] as! String
                    let obj1 = [GlobalConstants.AppId:id,GlobalConstants.Version:Version,GlobalConstants.IsTapped:"0",GlobalConstants.Image:Image,GlobalConstants.isImageLoaded:"0"]
                    filterarr.append(obj1)
                }
                
                let arrtemp:NSArray = filterarr as NSArray
                UserDefaults.standard.setValue(arrtemp, forKey: "configArr")
                UserDefaults.standard.synchronize()
                GlobalConstants.uploadCount = 0
                downloadImage()
                //return (arrtemp,true)
            }
        }
    }
    
    
    

    static func loadImages() {
        downloadImage()
    }
    
    static func showImageGlobal() -> (Data?,String,Bool){
        var image:Data!
        var strAppID:String!
        if UserDefaults.standard.value(forKey: GlobalConstants.configArr) != nil {
            if let data = UserDefaults.standard.value(forKey: GlobalConstants.configArr) as? NSArray {
                
                if GlobalConstants.currentIndex < data.count {
                    
                    
                    let obj = data[GlobalConstants.currentIndex] as! [String:Any]
                    strAppID = "\(obj[GlobalConstants.AppId] as! String)"
                    let strN =  "\(obj[GlobalConstants.AppId] as! String)"
                    let Version =  "\(obj[GlobalConstants.Version] as! String)"//obj![GlobalConstants.Version] as! String
                    var ext = ""
                    let strUrl = obj[GlobalConstants.Image] as! String
                    
                    let fullNameArr = strUrl.components(separatedBy:".")
                    if fullNameArr.last == "gif"{
                        ext = ".gif"
                    }else{
                        ext = ".jpg"
                    }
                    let strName = strN + Version + ext
                    let fileManager = FileManager.default
                    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(strName)
                    if fileManager.fileExists(atPath: paths) {
                        //image = UIImage(contentsOfFile:paths)
                        //Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                        let dataImg = try! Data(contentsOf: URL(fileURLWithPath: paths))
                        return (dataImg,strAppID,true)
                        
                    }else {
                        return (nil,strAppID,true)
                        
                    }
                }
                return (nil,strAppID,true)
                
            }else {
            //    image = UIImage(named: "Final")
                return (image,strAppID,false)
            }
        }else {
          //  image = UIImage(named: "Final")
            return (image,strAppID,false)
        }
    
    }
    
    static func updateIsTap() {
        if var data = UserDefaults.standard.value(forKey: GlobalConstants.configArr) as? [[String:Any]] {
            //if GlobalConstants.currentIndex > 0{
            GlobalConstants.currentIndex = GlobalConstants.currentIndex + 1
            GlobalConstants.tapCount = GlobalConstants.currentIndex - 1
            if GlobalConstants.tapCount < data.count {
                var objUpdate = data[GlobalConstants.tapCount]
                objUpdate[GlobalConstants.IsTapped] = "1"
                data.insert(objUpdate, at: GlobalConstants.tapCount)
                if GlobalConstants.tapCount == 0 {
                    let removeIndex = GlobalConstants.tapCount + 1
                    data.remove(at: removeIndex)
                }else {
                    let removeIndex = GlobalConstants.tapCount + 1
                    data.remove(at: removeIndex)
                }
                UserDefaults.standard.setValue(data, forKey: GlobalConstants.configArr)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    
    static func downloadImage() {
        
        
        if var dataArr = UserDefaults.standard.value(forKey: GlobalConstants.configArr) as? [[String:Any]] {
            if GlobalConstants.uploadCount == dataArr.count  {
                print(dataArr[0])
                GlobalConstants.uploadCount = 0
            }else {
                let obj = dataArr[GlobalConstants.uploadCount]
                
                
                let strURl = obj[GlobalConstants.Image] as! String
                let strN =  "\(obj[GlobalConstants.AppId] as! String)"
                let Version =  "\(obj[GlobalConstants.Version] as! String)"//obj![GlobalConstants.Version] as! String
                var ext = ""
                let strUrl = obj[GlobalConstants.Image] as! String
                
                let fullNameArr = strUrl.components(separatedBy:".")
                if fullNameArr.last == "gif"{
                    ext = ".gif"
                }else{
                    ext = ".jpg"
                }
                let strName = strN + Version + ext
                
                let fileManager = FileManager.default
                let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(strName)
                if fileManager.fileExists(atPath: paths) {
                    GlobalConstants.uploadCount = GlobalConstants.uploadCount + 1
                    loadImages()
                }else {
                    let url = URL(string: strURl)
                    var image:UIImage!
                    getData(from: url!) { data, response, error in
                        guard let data = data, error == nil else {
                            GlobalConstants.uploadCount = GlobalConstants.uploadCount + 1
                            loadImages()
                            return }
                         DispatchQueue.main.async {
                        image = UIImage(data: data)
                        if image != nil {
                            
                            
                            let imageData = image.jpegData(compressionQuality: 1)
                            print(paths)
                            
                            fileManager.createFile(atPath: paths as String, contents: data, attributes: nil)
                           // fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
                            if GlobalConstants.uploadCount == 0 {
                                NotificationCenter.default.post(name: NSNotification.Name(GlobalConstants.refreshImage), object: nil)
                            }
                            GlobalConstants.uploadCount = GlobalConstants.uploadCount + 1
                            loadImages()
                        }else {
                            GlobalConstants.uploadCount = GlobalConstants.uploadCount + 1
                            loadImages()
                        }
                    }
                }
                }
            }
            
        }else {
            
            loadImages()
        }
    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    //static var closedcompletion:((_ isTap:Bool,_ strAPPID:String)->())?
    
    static func getIndex() -> (Int,Bool){
        if let dataArr = UserDefaults.standard.value(forKey: GlobalConstants.configArr) as? [[String:Any]] {
            for i in 0..<dataArr.count {
                let obj = dataArr[i]
                if obj[GlobalConstants.IsTapped] as? String == "0" {
                    let strN =  "\(obj[GlobalConstants.AppId] as! String)"
                    let Version =  "\(obj[GlobalConstants.Version] as! String)"//obj![GlobalConstants.Version] as! String
                    var ext = ""
                    let strUrl = obj[GlobalConstants.Image] as! String
                    
                    let fullNameArr = strUrl.components(separatedBy:".")
                    if fullNameArr.last == "gif"{
                        ext = ".gif"
                    }else{
                        ext = ".jpg"
                    }
                    let strName = strN + Version + ext
                    let fileManager = FileManager.default
                    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(strName)
                    if fileManager.fileExists(atPath: paths) {
                        return (i,true)
                    }else {
                        
                    }
                    
                }else {
                    
                }
            }
        }
        return (0,false)
    }
    
    @available(iOS 10.0, *)
    static func showNextADS(fromVC:UIViewController? = nil, completion:((Bool,String)->())?){
        
        if PurchaseManager.isPurchased == true {
            completion?(false,"")
        }else {
            getdata()
            if var dataArr = UserDefaults.standard.value(forKey: GlobalConstants.configArr) as? [[String:Any]] {
                
                let indexValue = getIndex()
                
                if indexValue.1 == false {
                    completion?(false,"")
                }else {
                    GlobalConstants.currentIndex = indexValue.0
                    let obj = dataArr[GlobalConstants.currentIndex]
                    
                    let strN =  "\(obj[GlobalConstants.AppId] as! String)"
                    let Version =  "\(obj[GlobalConstants.Version] as! String)"//obj![GlobalConstants.Version] as! String
                    var ext = ""
                    let strUrl = obj[GlobalConstants.Image] as! String
                    
                    let fullNameArr = strUrl.components(separatedBy:".")
                    if fullNameArr.last == "gif"{
                        ext = ".gif"
                    }else{
                        ext = ".jpg"
                    }
                    let strName = strN + Version + ext
                    
                    let fileManager = FileManager.default
                    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(strName)
                    if fileManager.fileExists(atPath: paths) {
                        
                        let addVC = CrossPromoAdVC(nibName:"CrossPromoAdVC", bundle:nil)
                        
                       // let addVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CrossPromoAdViewController") as! CrossPromoAdViewController
                        addVC.modalPresentationStyle = .fullScreen
                        addVC.closed = {(isTap,strAPPID) in
                            DispatchQueue.main.async {
                                completion?(isTap,strAPPID)
                            }
                        }
                        (fromVC ?? topViewController()!).present(addVC, animated: true, completion: nil)
                    }else {
                        completion?(false,"")
                    }
                }
            }else {
                completion?(false,"")
            }

        }
    }
}



class PurchaseManager{

    /// It will return whether user already Purchased or not.
    public private(set) static var isPurchased = isPurchasedPersistent
    
    static func askForPurchaseRestoreOrCancel(fromVC:UIViewController? = nil, completion:(()->())?){
        let purchaseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PurchaseViewController") as! PurchaseViewController
        purchaseVC.modalPresentationStyle = .fullScreen
        purchaseVC.finished = {() in
            completion?()
        }
        (fromVC ?? topViewController()!).present(purchaseVC, animated: true, completion: nil)
        
    }
    static func purchase(fromVC:UIViewController? = nil, completion:((PurchaseResponse)->())?){
        HudManager.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            HudManager.dismiss()
            PurchasedSuccessfullyByUser()
            completion?(PurchaseResponse.PurchaseResponseSuccess)
        }
    }

    static func restorePurchase(fromVC:UIViewController? = nil, completion:((PurchaseResponse)->())?){
        HudManager.show()
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            DispatchQueue.main.async {
                HudManager.dismiss()
                if results.restoredPurchases.count > 0 {
                    PurchasedSuccessfullyByUser()
                    completion?(PurchaseResponse.PurchaseResponseSuccess)
                }else{
                    let alert = UIAlertController(title: GlobalConstants.AlerErrorTitle, message: GlobalConstants.inAppPurchaseFailedMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: GlobalConstants.AlertOkButton, style: .default, handler: { action in
                        completion?(PurchaseResponse.PurchaseResponseFail)
                    }))
                    (fromVC ?? topViewController()!).present(alert, animated: true, completion: nil)
                }
            }
        }
    }

    /// It will return In-App Purchase Price String i.e. "$0.99" append this in purchase button, it may return empty string if product is not fetched. you can add observer with .kPurchaseManagerProductFetchedNotification to get price string whenever it is fetched.
    public private(set) static var firstIAPPriceString : String = ""
    
    public private(set) static var isProductFetched:ProductFetchedStatus = .ProductFetchedStatusNotFetched
    
    private static var isPurchasedPersistent:Bool{
        get{
            return UserDefaults.standard.bool(forKey: GlobalConstants.appIsInAppPurchasedKey)
        }
        set{
            isPurchased = true
            UserDefaults.standard.set(true, forKey: GlobalConstants.appIsInAppPurchasedKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func setup(){
        
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    PurchasedSuccessfullyByUser()
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                    
                case .failed, .purchasing, .deferred:
                break // do nothing
                @unknown default:
                    break
                }
            }
        }
        
        SwiftyStoreKit.shouldAddStorePaymentHandler = { payment, product in
            if let _ = (topViewController()!) as? PurchaseViewController{
                
            }else{
                askForPurchaseRestoreOrCancel() { () in
                    
                }
            }
            
            return true
        }
        
    }
    
    static func retriveProducts(completion:(()->())?){
        if(PurchaseManager.isPurchased){
            completion?()
            return
        }
        
        if(isProductFetched == .ProductFetchedStatusNotFetched){
            isProductFetched = .ProductFetchedStatusFetching
            SwiftyStoreKit.retrieveProductsInfo([GlobalConstants.inAppPurchaseProductId]) { result in
                
                if let firstProduct = result.retrievedProducts.first {
                    firstIAPPriceString = firstProduct.localizedPrice ?? ""
                    isProductFetched = .ProductFetchedStatusSuccess
                    //                    products = result.retrievedProducts
//                    NotificationCenter.default.post(name: .kPurchaseManagerProductFetchedNotification, object: nil)
                    
                }else {
                    isProductFetched = .ProductFetchedStatusNotFetched
                }
                //                        else if let invalidProductId = result.invalidProductIDs.first {
                //                            print("Invalid product identifier: \(invalidProductId)")
                //                        }
                
                completion?()
            }
        }else{
            completion?()
        }
    }
    
    fileprivate static func askForBoredWithAdAlert(completion:(()->())?){
        
        if(Counters.shouldShowBoredWithAdAlert){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                let alert = UIAlertController(title: GlobalConstants.boredWithAdsAlertTitle, message: GlobalConstants.boredWithAdsAlertMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: GlobalConstants.boredWithAdsAlertNoPurchaseButton, style: .default, handler: { action in
                    completion?()
                }))
                alert.addAction(UIAlertAction(title: GlobalConstants.boredWithAdsAlertPurchaseButton, style: .default, handler: { action in
                    askForPurchaseRestoreOrCancel(completion: { () in
                        completion?()
                    })
                }))
                topViewController()!.present(alert, animated: true, completion: nil)
            }
        }else{
            completion?()
        }
    }
    
    private static func PurchasedSuccessfullyByUser() {
        isPurchasedPersistent = true
        AdManager.purchasedSuccefullyByUser()
    }
    
}


class AdManager:NSObject{
    private static let shared = AdManager()
    
    private enum AdType {
        case AdTypeShow
        case AdTypeNoAds
    }
    
    private static var AdStartCompletionsArray:[(()->())] = []
    private static var AdCompletionsArray:[(()->())] = []
    
    static func checkAndShowGamePlayStartAd(completion:(()->())?){
        let adType = AdManager.shouldShowGamePlayStartAd()
        if(adType != AdType.AdTypeNoAds){
            HudManager.show()
            AdManager.showGamePlayStartAd(adType:adType, startCompletion: {
                HudManager.dismiss()
            }, endCompletion: {
                HudManager.dismiss()
                completion?()
            })
        }else{
            completion?()
        }
    }
    
    static func checkAndShowGamePlayShareAd(completion:(()->())?){
        let adType = AdManager.shouldShowGamePlayShareAd()
        if(adType != AdType.AdTypeNoAds){
            HudManager.show()
            AdManager.showGamePlayShareAd(adType:adType, startCompletion: {
                HudManager.dismiss()
            }, endCompletion: {
                HudManager.dismiss()
                completion?()
            })
        }else{
            completion?()
        }
    }
    
    private func hideKeyboard() {
        if let keyWindow = UIWindow.key{
            for view in keyWindow.subviews{
                view.endEditing(true)
            }
        }
    }

    fileprivate static func purchasedSuccefullyByUser(){
        removeBanner()
    }
    
    //    private static var adView:FBAdView?
    
    private static var bannerDetails:(inViewController:UIViewController, containerViewForApp:UIView, extraPadding:CGFloat)? = nil
    
    static func addBanner(inViewController:UIViewController, containerViewForApp:UIView, extraPadding:Int = 10){
        if(PurchaseManager.isPurchased){
            return
        }
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 + GlobalConstants.splashScreenDisplayTimeInSeconds) {
            
            var bottomPadding : CGFloat = 0.0
            if #available(iOS 11.0, *) {
                bottomPadding = inViewController.view.safeAreaInsets.bottom
            }
            
            var height:CGFloat = 50
            if(Display.pad){
                height = 90
            }

            containerViewForApp.frame = CGRect(x: 0, y: 0, width: inViewController.view.bounds.size.width, height: inViewController.view.bounds.size.height - height - bottomPadding - CGFloat(extraPadding))
            
            bannerDetails = (inViewController,containerViewForApp,CGFloat(extraPadding))
        }
    }
    
    private static func removeBanner() {
        
        if let vc = AdManager.bannerDetails?.inViewController, let containerView = AdManager.bannerDetails?.containerViewForApp{
            
            containerView.frame = CGRect(x: 0, y: 0, width: vc.view.bounds.size.width, height: vc.view.bounds.size.height)
        }
        
        bannerDetails = nil
    }
    
    private static func shouldShowGamePlayStartAd() -> AdType {
        Counters.increamentGamePlayStartCounter()
        
        if(PurchaseManager.isPurchased){
            return AdType.AdTypeNoAds
        }
        
        if(Counters.gamePlayStartCounter == 1){
            
            let shouldShowAds = GlobalConstants.getGamePlayStartAdsShouldShowFirstTimeValue()
            
            if(!Counters.isFirstTimeAppLaunched && shouldShowAds){
                return AdType.AdTypeShow
            }else{
                return AdType.AdTypeNoAds
            }
        }else{
            let counter = Counters.gamePlayStartCounter
            let adsNthValue = GlobalConstants.getGamePlayStartAdsEveryNthTimeValue()
            if(counter % adsNthValue == 0){
                return AdType.AdTypeShow
            }else{
                return AdType.AdTypeNoAds
            }
        }
    }
    
    private static func showGamePlayStartAd(adType:AdType,startCompletion:(()->())?, endCompletion:(()->())?) {
        
        if(adType == .AdTypeNoAds){
            endCompletion?()
        }else{
            showAd(adType:adType, startCompletion:startCompletion, endCompletion: endCompletion)
        }
    }
    
    private static func shouldShowGamePlayShareAd() -> AdType {
        Counters.increamentGamePlayShareCounter()
        
        if(PurchaseManager.isPurchased){
            return AdType.AdTypeNoAds
        }
        
        if(Counters.gamePlayShareCounter == 1){
            
            let shouldShowAds = GlobalConstants.getGamePlayShareAdsShouldShowFirstTimeValue()
            
            if(shouldShowAds){
                return AdType.AdTypeShow
            }else{
                return AdType.AdTypeNoAds
            }
        }else{
            let counter = Counters.gamePlayShareCounter
            let adsNthValue = GlobalConstants.getGamePlayShareAdsEveryNthTimeValue()
            if(counter % adsNthValue == 0){
                return AdType.AdTypeShow
            }else{
                return AdType.AdTypeNoAds
            }
        }

    }
    
    private static func showGamePlayShareAd(adType:AdType,startCompletion:(()->())?, endCompletion:(()->())?) {
        
        if(adType == .AdTypeNoAds){
            endCompletion?()
        }else{
            showAd(adType:adType, startCompletion:startCompletion, endCompletion: endCompletion)
        }
    }

    private static func showAd(adType:AdType,startCompletion:(()->())?, endCompletion:(()->())?) {
        
        Counters.increamentAdRequestCounter()
        
        let counter = Counters.adRequestCounter
        
        shared.hideKeyboard()
        if let startCompletion = startCompletion{
            AdManager.AdStartCompletionsArray.append(startCompletion)
        }
        if let endCompletion = endCompletion{
            AdManager.AdCompletionsArray.append(endCompletion)
        }
        
        if(counter%2 == 0){
            //IronSource
            if let adStartCompletion = AdManager.AdStartCompletionsArray.first{
                adStartCompletion()
                AdManager.AdStartCompletionsArray.remove(safeAt: 0)
            }
            let alert = UIAlertController(title: "", message: "Will show IS Ad here", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                Counters.increamentAdShownCounter()
                if let adCompletion = AdManager.AdCompletionsArray.first{
                    PurchaseManager.askForBoredWithAdAlert() {
                        adCompletion()
                        AdManager.AdCompletionsArray.remove(safeAt: 0)
                    }
                }
            }))
            topViewController()!.present(alert, animated: true, completion: nil)
        }else{
            if let adStartCompletion = AdManager.AdStartCompletionsArray.first{
                adStartCompletion()
                AdManager.AdStartCompletionsArray.remove(safeAt: 0)
            }
            let alert = UIAlertController(title: "", message: "Will show CB Ad here", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                Counters.increamentAdShownCounter()
                if let adCompletion = AdManager.AdCompletionsArray.first{
                    PurchaseManager.askForBoredWithAdAlert() {
                        adCompletion()
                        AdManager.AdCompletionsArray.remove(safeAt: 0)
                    }
                }
            }))
            topViewController()!.present(alert, animated: true, completion: nil)
        }
    }
    
}
//TLCHECK AD - IronSource-ChartBoost Start
class RewardedAdManager:NSObject{
    
    static var isAdAvailable:Bool{
        
        return true

    }
    static func checkAndShowRewardedAd(completion:((Bool)->())?){
        let alert = UIAlertController(title: "", message: "Will show Rewarded Ad here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            completion?(true)
        }))
        topViewController()!.present(alert, animated: true, completion: nil)
    }

}
//TLCHECK AD - IronSource-ChartBoost End

fileprivate class FirebaseManager{
    
    static let remoteConfig = RemoteConfig.remoteConfig()
    
    static let settings = RemoteConfigSettings()
    
    
    
    //FIRRemoteConfigSettings.MinimumFetchInterval
    
    
    static func setup() {
       //settings.minimumFetchInterval = 0
        //settings.fetchTimeout = 20
        
       // remoteConfig.configSettings = settings
        
        if(GlobalConstants.shouldConfigFirebase){
            FirebaseApp.configure()
        }
        remoteConfig.setDefaults(GlobalConstants.firebaseDefaultValueArray)
        if(GlobalConstants.shouldConfigFirebase){
            remoteConfig.fetch(withExpirationDuration: 0.0) { (status, error) in
                if status == .success {
                    self.remoteConfig.activate(completion: nil)
                }
                CrosspromotionAdManager.getdata()
            }
        }
        
//        if #available(iOS 10.0, *) {
//            UNUserNotificationCenter.current().delegate = UIApplication.shared.delegate as! AppDelegate
//        }
        
    }
    
    private static func logEvent(eventName:String, parameter:[String : String]?) {
        Analytics.logEvent(eventName, parameters: parameter)
    }
    
    fileprivate static func logAppStoreReviewedEvent(fromReviewAlert:Bool){
        logEvent(eventName: GlobalConstants.FirebaseEventAppStoreReviewedKey, parameter: ["fromReviewAlert":fromReviewAlert ? "true" : "false"])
    }
}

class LocalNotificationManager {
    
    enum LocalNotificationPermisionStatus {
        case LocalNotificationPermisionStatusNotEvaluated
        case LocalNotificationPermisionStatusGiven
        case LocalNotificationPermisionStatusDenied
    }

    static func askForLocalNotificationsPermission(){
        
        if(isAskedForLocalNotificationOnce){
            return
        }
        isAskedForLocalNotificationOnce = true
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {(granted, error) in
                    if(granted){
                        isRegistered = .LocalNotificationPermisionStatusGiven
                    }else{
                        isRegistered = .LocalNotificationPermisionStatusDenied
                    }
            })
        } else {
            
            if (UIApplication.instancesRespond(to: #selector(UIApplication.registerUserNotificationSettings(_:)))) {
                let isRegisteredForLocalNotifications = GlobalConstants.sharedApp.currentUserNotificationSettings?.types.contains(UIUserNotificationType.alert) ?? false
                if(!isRegisteredForLocalNotifications){
                    let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                    GlobalConstants.sharedApp.registerUserNotificationSettings(settings)
                }else{
                }
                isRegistered = .LocalNotificationPermisionStatusGiven
            }
            
        }
        
        GlobalConstants.sharedApp.registerForRemoteNotifications()
        
    }
    static var isAskedForLocalNotificationOnce = false

    private static let localNotificationIdPrefix = "ln_"
    
    private static var isRegistered = LocalNotificationPermisionStatus.LocalNotificationPermisionStatusNotEvaluated
    
    private static let shared = LocalNotificationManager()
    
    fileprivate static func setup(){
        clearNotifications()
        NotificationCenter.default.addObserver(shared, selector: #selector(applicationDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(shared, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
    }
    @objc func applicationDidEnterBackground() {
        LocalNotificationManager.scheduleNotifications()
    }
    @objc func applicationWillEnterForeground() {
        LocalNotificationManager.clearNotifications()
    }
    
    private static func clearNotifications(){
        
        var localNotificationIds : [String] = []
        for (index, _) in GlobalConstants.localNotificationMessageArray.enumerated() {
            localNotificationIds.append("\(localNotificationIdPrefix)\(index)")
        }
        
        GlobalConstants.sharedApp.applicationIconBadgeNumber = 0
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: localNotificationIds)
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        }else{
            for notification in GlobalConstants.sharedApp.scheduledLocalNotifications ?? [] {
                if let userInfo = notification.userInfo as? Dictionary<String,String>, let notifcationObjectId = userInfo["objectId"]{
                    if localNotificationIds.contains(notifcationObjectId){
                        GlobalConstants.sharedApp.cancelLocalNotification(notification)
                    }
                }
            }
        }
    }
    
    private static func scheduleNotifications() {
        if(isRegistered == .LocalNotificationPermisionStatusNotEvaluated || isRegistered == .LocalNotificationPermisionStatusDenied){
            return
        }
        
        var localNotiArray: Array<String>
        let launchCount = Counters.appLaunchCounter
        let notificationsTotalCount = GlobalConstants.localNotificationMessageArray.count
        
        //Order message array
        if(launchCount > 1 && launchCount < (notificationsTotalCount+1)){
            localNotiArray = GlobalConstants.localNotificationMessageArray.shiftRight(launchCount-1)!
        }else{
            localNotiArray = GlobalConstants.localNotificationMessageArray
        }
        
        let calendar = Calendar(identifier: .gregorian)
        
        for (index, message) in localNotiArray.enumerated() {
            
            if index>=GlobalConstants.localNotificationDayArray.count{
                break
            }
            
            let day = GlobalConstants.localNotificationDayArray[index]
            
            if #available(iOS 10.0, *) {
                let components = calendar.dateComponents(in: .current, from: Date(timeIntervalSinceNow: TimeInterval(60*60*24*day)))
                //For Testing notification in few seconds
                //                let components = calendar.dateComponents(in: .current, from: Date(timeIntervalSinceNow: TimeInterval(30*(index+1))))
                let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
                let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
                let content = UNMutableNotificationContent()
                //                content.title = title
                content.body = message
                content.sound = UNNotificationSound.default
                content.badge =  NSNumber(value: index+1)
                let request = UNNotificationRequest(identifier: "\(localNotificationIdPrefix)\(index)", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }else {
                let notification = UILocalNotification()
                notification.fireDate = Date(timeIntervalSinceNow: TimeInterval(60*60*24*day))
                //            notification.fireDate = Date(timeIntervalSinceNow: TimeInterval(30*(index+1)))
                
                notification.soundName = UILocalNotificationDefaultSoundName
                //                if #available(iOS 8.2, *) {
                //                    notification.alertTitle = title
                //                }
                notification.alertBody = message
                notification.applicationIconBadgeNumber = index+1
                let infoDict :  Dictionary<String,String> = ["objectId" : "\(localNotificationIdPrefix)\(index)"]
                notification.userInfo = infoDict;
                GlobalConstants.sharedApp.scheduleLocalNotification(notification)
            }
        }
    }
    
}

struct ReviewManager {
    private static var isReviewed = isReviewedPersistent
    static func askForReview(fromVC:UIViewController? = nil, completion: ((Bool) -> ())?) {
        
        if(!isReviewed && !isAskedForReviewOnce){
            isAskedForReviewOnce = true
            let alert = UIAlertController(title: GlobalConstants.reviewAlertTitle, message: GlobalConstants.reviewAlertMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: GlobalConstants.AlerNextTimeButton, style: .default, handler: { action in
                completion?(false)
            }))
            alert.addAction(UIAlertAction(title: GlobalConstants.reviewAlertButtonRateMe, style: .default, handler: { action in
                reviewNowTapped()
                completion?(true)
            }))
            (fromVC ?? topViewController()!).present(alert, animated: true, completion: nil)
        }else{
            completion?(false)
        }
    }
    static func redirectToAppstoreReviewScreen(fromReviewAlert: Bool = false){
        if #available(iOS 10, *) {
            GlobalConstants.sharedApp.open(URL(string: GlobalConstants.appRateReviewLink)!, options: [:], completionHandler: nil)
        }else{
            GlobalConstants.sharedApp.openURL(URL(string: GlobalConstants.appRateReviewLink)!)
        }
    }

    private static var isAskedForReviewOnce = false
    
    private static func reviewNowTapped() {
        isReviewedPersistent = true
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }else{
            redirectToAppstoreReviewScreen(fromReviewAlert: true)
        }
    }
    
    private static var isReviewedPersistent:Bool{
        get{
            return UserDefaults.standard.bool(forKey: GlobalConstants.appIsReviewedKey)
        }
        set{
            isReviewed = newValue
            UserDefaults.standard.set(newValue, forKey: GlobalConstants.appIsReviewedKey)
            UserDefaults.standard.synchronize()
        }
    }
    
}
class NetworkManager:NSObject{
    
    public enum NetworkStatus {
        case NetworkStatusReachableThroughWiFi
        case NetworkStatusReachableThroughCellularData
        case NetworkStatusNotReachable
    }

    /**
        - It will return NetworkStatus Enum Type.
        - NetworkStatus.NetworkStatusNotReachable if Internet is  Not availabe
        - NetworkStatus.NetworkStatusReachableThroughCellularData if reachable through mobile data
        - NetworkStatus.NetworkStatusReachableThroughWifi if reachable through Wi-Fi
    */
    static var status : NetworkStatus{
        if(reachability.connection == .wifi){
            return .NetworkStatusReachableThroughWiFi
        }else if(reachability.connection == .cellular){
            return .NetworkStatusReachableThroughCellularData
        }else{
            return .NetworkStatusNotReachable
        }
    }
    
    /**
        Call this method from 1st/2nd View Controller(in app lifecycle) didAppear method, Test & Check that it should not go in infinite loop.

        - Parameter completion: will be called after user tap Ok button in Alert or instantly if user is already connected to internet.
    */
    static func checkAndShowNoInternetAlert(optional:Bool = false, fromVC:UIViewController? = nil, completion:(()->())?){
        if(status == .NetworkStatusNotReachable){
            let alert = UIAlertController(title: GlobalConstants.ConnectToInternetAlertTitle, message: (optional ? GlobalConstants.noInternetTryAgainAlertMessage : GlobalConstants.internetRequiredToUseAppAlertMessage), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: GlobalConstants.AlertOkButton, style: .default, handler: { action in
                completion?()
            }))
            (fromVC ?? topViewController()!).present(alert, animated: true, completion: nil)
        }else{
            completion?()
        }
    }
    
    private static let shared = NetworkManager()  // 2. Shared instance
    
    private static var reachabilityStatus: Reachability.Connection = .unavailable
    
    private static let reachability = try! Reachability()
    
    fileprivate static func setup(){
        NotificationCenter.default.addObserver(NetworkManager.shared,
                                               selector: #selector(NetworkManager.shared.reachabilityChanged),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do{
            try reachability.startNotifier()
        } catch {
            
        }
    }
    
    @objc private func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        
        NetworkManager.reachabilityStatus = reachability.connection
        
//        switch reachability.connection {
//        case .wifi:
//            print("Reachable via WiFi")
//        case .cellular:
//            print("Reachable via Cellular")
//        case .unavailable:
//            print("Network not reachable")
//        case .none:
//            print("Network none")
//        }
        
        if(reachability.connection == .cellular ||  reachability.connection == .wifi){
            PurchaseManager.retriveProducts(completion: nil)
        }
    }
}

class StoreManager:NSObject,SKStoreProductViewControllerDelegate{
    
    private static var completion:(()->())?

    static func showMoreApps(fromVC:UIViewController? = nil,completion: (() -> ())?){
        HudManager.show()
        
        let storeViewController = SKStoreProductViewController()
        storeViewController.delegate = StoreManager.shared
        
        let parameters = [ SKStoreProductParameterITunesItemIdentifier : GlobalConstants.artistId]
        storeViewController.loadProduct(withParameters: parameters) { (loaded, error) -> Void in
            
            DispatchQueue.main.async {
                HudManager.dismiss()
                
                if loaded {
                    StoreManager.completion = completion
                    (fromVC ?? topViewController()!).present(storeViewController, animated: true, completion: nil)
                }else{
                    completion?()
                }
            }
        }
    }
    
    static func showGiftItem(appID:String,fromVC:UIViewController? = nil,completion: (() -> ())?) {
        HudManager.show()

        let storeViewController = SKStoreProductViewController()
        storeViewController.delegate = StoreManager.shared
        
        let parameters = [ SKStoreProductParameterITunesItemIdentifier : appID]
        storeViewController.loadProduct(withParameters: parameters) { (loaded, error) -> Void in
            
            DispatchQueue.main.async {
                HudManager.dismiss()
                
                if loaded {
                    StoreManager.completion = completion
                    (fromVC ?? topViewController()!).present(storeViewController, animated: true, completion: nil)
                }else{
                    completion?()
                }
            }
        }
    }

    private static let shared = StoreManager()
        
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true) {
            StoreManager.completion?()
            StoreManager.completion = nil
        }
    }
}

class ShareManager:NSObject{
    /**
        It will Present UIActivityViewController for with Application Sharing Details.
     
     - Parameter fromVC: (Optional) you can ignore this variable, if any issue happen in presenting VC, then pass Self
     - Parameter sourceView: Pass share button or source view where user tapped, if unable to get it then pass self.view

    */
    static func shareApplicationLink(fromVC:UIViewController? = nil, sourceView:UIView, onlyMessageApps:Bool = false, completion:((Bool)->())?) {
        let textToShare = [ GlobalConstants.shareMessage ]
        share(activityItems: textToShare, fromVC: fromVC, sourceView: sourceView, onlyMessageApps: onlyMessageApps, completion: completion)
    }
    static func share(activityItems:[Any], fromVC:UIViewController? = nil, sourceView:UIView, onlyMessageApps:Bool = false, completion:((Bool)->())?) {
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = sourceView
        activityViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if(activityType?.rawValue == "com.apple.CloudDocsUI.AddToiCloudDrive") && onlyMessageApps {
                completion?(false)
            }else{
                completion?(completed)
            }
        }
        
        if(onlyMessageApps){
            activityViewController.excludedActivityTypes = [
                UIActivity.ActivityType(rawValue: "com.apple.CloudDocsUI.AddToiCloudDrive"),
                UIActivity.ActivityType.postToWeibo,
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.copyToPasteboard,
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.addToReadingList,
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.airDrop,
                UIActivity.ActivityType.openInIBooks,
                UIActivity.ActivityType(rawValue: "com.apple.reminders.sharingextension"),
                UIActivity.ActivityType(rawValue: "com.apple.mobilenotes.SharingExtension"),
                UIActivity.ActivityType(rawValue: "com.google.Drive.ShareExtension"),
                UIActivity.ActivityType(rawValue: "com.google.Keep.ShareExtension"),
            ]
        }
        // present the view controller
        (fromVC ?? topViewController()!).present(activityViewController, animated: true, completion: nil)
    }

}
/**
    It will return current keyWindow's rootViewController, if any VC is presented then it will return that VC.
*/
func topViewController(controller: UIViewController? = UIWindow.key?.rootViewController) -> UIViewController? {
    //        if let navigationController = controller as? UINavigationController {
    //            return topViewController(controller: navigationController.visibleViewController)
    //        }
    //        if let tabController = controller as? UITabBarController {
    //            if let selected = tabController.selectedViewController {
    //                return topViewController(controller: selected)
    //            }
    //        }
    if let presented = controller?.presentedViewController {
        return topViewController(controller: presented)
    }
    return controller
}

struct Counters {
    
    //AppLaunch Counter
    static var isFirstTimeAppLaunched : Bool {
        if(appLaunchCounter == 1){
            return true
        }else{
            return false
        }
    }
    
    public private(set) static var appLaunchCounter = appLaunchCounterPersistent
    
    fileprivate static func increamentAppLaunchCounter() {
        appLaunchCounterPersistent = appLaunchCounter+1
    }
    private static var appLaunchCounterPersistent:Int{
        get{
            return UserDefaults.standard.integer(forKey: GlobalConstants.appLaunchCounterKey)
        }
        set{
            appLaunchCounter = newValue
            UserDefaults.standard.set(newValue, forKey: GlobalConstants.appLaunchCounterKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    //Ad Request Counter
    fileprivate static var adRequestCounter : Int = 0
    fileprivate static func increamentAdRequestCounter() {
        adRequestCounter = adRequestCounter+1
    }
    
    //Game Play Start Counter
    fileprivate static var gamePlayStartCounter : Int = 0
    fileprivate static func increamentGamePlayStartCounter() {
        gamePlayStartCounter = gamePlayStartCounter+1
    }
    
    //Game Play Share Counter
    fileprivate static var gamePlayShareCounter : Int = 0
    fileprivate static func increamentGamePlayShareCounter() {
        gamePlayShareCounter = gamePlayShareCounter+1
    }
    
    //Ad Shown Counter
    fileprivate static var adShownCounter : Int = 0
    fileprivate static func increamentAdShownCounter() {
        adShownCounter = adShownCounter+1
    }
    private static var shownBoredWithAdAlert = false
    fileprivate static var shouldShowBoredWithAdAlert : Bool {
        if(!shownBoredWithAdAlert && adShownCounter >= 2 && !PurchaseManager.isPurchased){
            shownBoredWithAdAlert = true
            return true
        }else{
            return false
        }
    }
}
class HudManager {
    static func show(){
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    static func dismiss(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    fileprivate static func setup() {
        SVProgressHUD.setDefaultMaskType(.black)
        //        SVProgressHUD.setDefaultStyle(.dark)
    }
}

class ContactManager:NSObject, MFMailComposeViewControllerDelegate{
    /**
        It will Present mail composer if available, otherwise Present SafariViewController with contact webpage.
    */
    static func contactToDeveloper(fromVC:UIViewController? = nil){
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = shared
            composeVC.setToRecipients([GlobalConstants.emailToContactUs])
            composeVC.setSubject("Regarding \(GlobalConstants.appName)\(PurchaseManager.isPurchased ? " | Subscribed": "")")
            //                composeVC.setMessageBody("Hello this is my message body!", isHTML: false)
            (fromVC ?? topViewController()!).present(composeVC, animated: true, completion: nil)
            
        }else if let url = URL(string: GlobalConstants.contactUsLink) {
            let vc = SFSafariViewController(url: url)
            (fromVC ?? topViewController()!).present(vc, animated: true, completion: nil)
        }
    }
    
    private static let shared = ContactManager()
    internal func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

extension Array {
    func shiftRight(_ amount: Int = 1) -> [Element]? {
        var amount = amount
        if(!(-count...count ~= amount)){
            return nil
        }
        if amount < 0 { amount += count }  // this needs to be >= 0
        return Array(self[amount ..< count] + self[0 ..< amount])
    }
}

public final class Display {
    
    enum DisplayType {
        case unknown
        case iphone4
        case iphone5
        case iphone6
        case iphone6plus
        case iphoneX
        case iPadNonRetina
        case iPad
        case iPadProSmall
        case iPadProBig
    }
    
    class var width:CGFloat { return UIScreen.main.bounds.size.width }
    class var height:CGFloat { return UIScreen.main.bounds.size.height }
    class var maxLength:CGFloat { return max(width, height) }
    class var minLength:CGFloat { return min(width, height) }
    class var zoomed:Bool { return UIScreen.main.nativeScale >= UIScreen.main.scale }
    class var retina:Bool { return UIScreen.main.scale >= 2.0 }
    class var phone:Bool { return UIDevice.current.userInterfaceIdiom == .phone }
    class var pad:Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    //    class var carplay:Bool { return UIDevice.current.userInterfaceIdiom == .carPlay }
    //    class var tv:Bool { return UIDevice.current.userInterfaceIdiom == .tv }
    class var typeIsLike:DisplayType {
        
        if phone && maxLength == 568 {
            return .iphone5
        }
        else if phone && maxLength == 667 {
            return .iphone6
        }
        else if phone && maxLength == 736 {
            return .iphone6plus
        }
        else if phone && maxLength == 812 {
            return .iphoneX
        }
        else if pad && retina && maxLength == 1024 {
            return .iPad
        }else if pad && retina && maxLength == 1112 {
            return .iPadProSmall
        }
        else if pad && maxLength == 1366 {
            return .iPadProBig
        }
        else if phone && maxLength < 568 {
            return .iphone4
        }
        else if pad && !retina {
            return .iPadNonRetina
        }
        return .unknown
    }
}

extension Array {
    mutating func remove(safeAt index: Int) {
        guard index >= 0 && index < count else {
            print("Index out of bounds while deleting item at index \(index) in \(self). This action is ignored.")
            return
        }
        remove(at: index)
    }
    
    private mutating func insert(_ element: Element, safeAt index: Int) {
        guard index >= 0 && index <= count else {
            print("Index out of bounds while inserting item at index \(index) in \(self). This action is ignored")
            return
        }
        
        insert(element, at: index)
    }
    
    subscript (safe index: Int) -> Element? {
        get {
            return indices.contains(index) ? self[index] : nil
        }
        set {
            remove(safeAt: index)
            
            if let element = newValue {
                insert(element, safeAt: index)
            }
        }
    }
}

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        return self?.trimmingCharacters(in: .whitespaces).isEmpty ?? true
    }
}
extension String {
    var isEmptyWithoutWhiteSpaces: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

//extension AppDelegate: UNUserNotificationCenterDelegate{
//
//}
extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
