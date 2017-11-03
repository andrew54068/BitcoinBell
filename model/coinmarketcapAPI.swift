//
//  coinmarketcapAPI.swift
//  BitcoinBell
//
//  Created by kidnapper on 25/10/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//
import UIKit
import Foundation

class coinmarketcapAPI {
    static func getDataFromCMC(nameOfCoin: String, fiatCoinCategory: String , specifyExchange: String? = nil) -> [[String:Any]]? {
        var Json: [[String:Any]]?
        let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/\(nameOfCoin)/?convert=\(fiatCoinCategory)")
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard error == nil else{
                print("error = \(error as AnyObject)")
                return
            }
            if data != nil{
                do{
                    Json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String:Any]]
                    print("Json = \(String(describing: Json!))")
                    if dataFromJson.arrayForUser == nil{
                        dataFromJson.arrayForUser = [Json![0]]
                    }else{
                        dataFromJson.arrayForUser!.append(Json![0])
                    }
                    print("arrayForUser 2 = \(String(describing: dataFromJson.arrayForUser))")
//                    let element = Json! as! [[String:Any]]
//                    print("element = \(element)")
                    
                    if let name = Json![0]["name"] as? String{
                        dataFromJson.name = name
                    }
                    if let symbol = Json![0]["symbol"] as? String{
                        dataFromJson.symbol = symbol
                    }
                    if let price_usd = Json![0]["price_usd"] as? String{
                        
                        dataFromJson.price_usd = Float(price_usd)!
                    }
                    if let price_btc = Json![0]["price_btc"] as? String{
                        dataFromJson.price_btc = Float(price_btc)!
                    }
                    if let percent_change_7d = Json![0]["percent_change_7d"] as? String{
                        dataFromJson.percent_change_7d = Float(percent_change_7d)!
                    }
                    if let percent_change_1h = Json![0]["percent_change_1h"] as? String{
                        dataFromJson.percent_change_1h = Float(percent_change_1h)!
                    }
                    if let percent_change_24h = Json![0]["percent_change_24h"] as? String{
                        dataFromJson.percent_change_24h = Float(percent_change_24h)!
                    }
                    if let volume_usd_24h = Json![0]["24h_volume_usd"] as? String{
                        print("volume_usd_24h = \(type(of: volume_usd_24h))")
                        dataFromJson.volume_usd_24h = Int(Float(volume_usd_24h)!)
                    }
                    if let market_cap_usd = Json![0]["market_cap_usd"] as? String{
                        print("market_cap_usd = \(type(of: market_cap_usd))")
                        dataFromJson.market_cap_usd = Int(market_cap_usd)!
                    }
                }catch{
                    print("error occur when transform data to json, error = \(error)")
                }
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait(timeout: .distantFuture)
        
        return Json
    }
    
    func makeRequest(path: String, log: String? = nil) -> URLRequest {
        if log != nil{
            print(log!)
        }
        return URLRequest(url: URL(string: "https://api.coinmarketcap.com/v1/ticker/")!)
    }
}
