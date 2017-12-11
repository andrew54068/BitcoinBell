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
    
    func fetchCryptoList(requestType: requestType, name: String?, limit: Int?, completionHandler: ([CryptoCategory]) -> () ){
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
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print("error = \(String(describing: error))")
            }
            else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String:AnyObject]]
                    print("json = \(json!)")
                    
                    if let js = json{
                        for eachCrypto in js{
                            let crypto = CryptoObject()
                            crypto.id = eachCrypto["id"] as? String
                            crypto.name = eachCrypto["name"] as? String
                            crypto.symbol = eachCrypto["symbol"] as? String
                            crypto.rank = eachCrypto["rank"] as? Int
                            crypto.price_usd = eachCrypto["price_usd"] as? Float
                            crypto.price_btc = eachCrypto["price_btc"] as? Float
                            crypto.volume_usd_24h = eachCrypto["24h_volume_usd"] as? Float
                            crypto.market_cap_usd = eachCrypto["market_cap_usd"] as? Float
                            crypto.available_supply = eachCrypto["available_supply"] as? Float
                            crypto.total_supply = eachCrypto["total_supply"] as? Float
                            crypto.max_supply = eachCrypto["max_supply"] as? Float
                            crypto.percent_change_1h = eachCrypto["percent_change_1h"] as? Float
                            crypto.percent_change_24h = eachCrypto["percent_change_24h"] as? Float
                            crypto.percent_change_7d = eachCrypto["percent_change_7d"] as? Float
                        }
                    }
                    
                }
                catch let err {
                    print("err = \(err)")
                }
            }
        }
    }
    
    enum requestType {
        case top100
        case specific
        case none
    }
}
