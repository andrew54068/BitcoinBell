//
//  data.swift
//  BitcoinBell
//
//  Created by kidnapper on 02/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import Foundation

public class dataFromJson {
    static var name: String = ""
    static var symbol: String = ""
    static var price_usd: Float = 0
    static var price_btc: Float = 0
    static var percent_change_7d: Float = 0
    static var percent_change_1h: Float = 0
    static var percent_change_24h: Float = 0
    static var volume_usd_24h: Int = 0
    static var market_cap_usd: Int = 0
    static var arrayForUser: [[String:Any]]?
}
