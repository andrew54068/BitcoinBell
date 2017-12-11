//
//  CryptoCategory.swift
//  BitcoinBell
//
//  Created by kidnapper on 09/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class CryptoObject: NSObject{
    
    var id: String?
    var name: String?
    var symbol: String?
    var rank: Int?
    var price_usd: Float?
    var price_btc: Float?
    //name change from 24h_volume_usd to volume_usd_24h
    var volume_usd_24h: Float?
    var market_cap_usd: Float?
    var available_supply: Float?
    var total_supply: Float?
    var max_supply: Float?
    var percent_change_1h: Float?
    var percent_change_24h: Float?
    var percent_change_7d: Float?
    var last_updated: Float?
    
//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "1"{
//            total_supply = (value as? String)!
//        }
//        else{
//            super.setValue(value, forKey: key)
//        }
//    }
    
    //        , completionHandler: ([CryptoObject]) -> () )
    static func fetchCryptoInfo(requestType: requestType, name: String?, limit: Int?, completionHandler: @escaping ([CryptoObject]) -> () ){
        let urlRootString = "https://api.coinmarketcap.com/v1/ticker/"
        var urlString: String = ""
        
        switch requestType {
            case .top100:
                urlString = urlRootString + "?limit=100"
                break
            case .specific:
                urlString = urlRootString + name!
                break
            default:
                urlString = urlRootString
                break
        }
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print("error = \(String(describing: error))")
            }
            else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String:AnyObject]]
                    print("json = \(json!)")
                    
                    var cryptoObjects = [CryptoObject]()
                    
                    if let js = json{
                        for eachCrypto in js{
                            print("eachCrypto = \(eachCrypto)")
                            let crypto = CryptoObject()
//                            crypto.setValuesForKeys(eachCrypto)
//                            cryptoObjects.append(crypto)
                            
                            crypto.id = eachCrypto["id"] as? String
                            crypto.name = eachCrypto["name"] as? String
                            crypto.symbol = eachCrypto["symbol"] as? String
                            crypto.rank = Int(eachCrypto["rank"] as! String)
                            crypto.price_usd = Float(eachCrypto["price_usd"] as! String)
                            crypto.price_btc = Float(eachCrypto["price_btc"] as! String)
                            crypto.volume_usd_24h = Float(eachCrypto["24h_volume_usd"] as! String)
                            crypto.market_cap_usd = Float(eachCrypto["market_cap_usd"] as! String)
                            crypto.available_supply = Float(eachCrypto["available_supply"] as! String)
                            crypto.percent_change_1h = Float(eachCrypto["percent_change_1h"] as! String)
                            crypto.percent_change_24h = Float(eachCrypto["percent_change_24h"] as! String)
                            crypto.percent_change_7d = Float(eachCrypto["percent_change_7d"] as! String)
                            crypto.last_updated = Float(eachCrypto["last_updated"] as! String)
                            cryptoObjects.append(crypto)
                            
                        }
                    }
                    
                    DispatchQueue.main.async {
                        completionHandler(cryptoObjects)
                    }
                    
//                    print("cryptoObjects[0] = \(cryptoObjects[0])")
                    print("cryptoObjects = \(cryptoObjects)")
                }
                catch let err {
                    print("err = \(err)")
                }
            }
        }.resume()
    }
    
    
}

enum requestType {
    case top100
    case specific
    case none
}
