//
//  ViewController.swift
//  BitcoinBell
//
//  Created by kidnapper on 25/10/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class VC_main: UIViewController, UITableViewDelegate, UITableViewDataSource{
//    var numberOfCell: Int = 0

    private let cellId = "crypto_TVCell"
    
    var cryptoInfos: [CryptoObject] = []
    
    @IBOutlet var plus: UIButton!
    @IBOutlet var tableView: UITableView!
    
    @IBAction func createBitcoin(_ sender: Any) {
        CryptoObject.fetchCryptoInfo(requestType: requestType.specific, name: "bitcoin", limit: nil) { (cryptoInfos) in
            self.cryptoInfos.append(cryptoInfos[0])
            print("self.cryptoInfos = \(self.cryptoInfos)")
            print("cryptoInfos = \(cryptoInfos)")
            self.tableView.reloadData()
        }
//        let result = coinmarketcapAPI.getDataFromCMC(nameOfCoin: "bitcoin", fiatCoinCategory: "USD")
//        print("result = \(String(describing: result))")
        print(dataFromJson.name)
        print(dataFromJson.price_btc)
        print(dataFromJson.price_usd)
        print(dataFromJson.percent_change_1h)
        print(dataFromJson.percent_change_24h)
        print(dataFromJson.percent_change_7d)
        print(dataFromJson.market_cap_usd)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
//        print(dataFromJson.name)
//        print(dataFromJson.price_btc)
//        print(dataFromJson.price_usd)
//        print(dataFromJson.percent_change_1h)
//        print(dataFromJson.percent_change_24h)
//        print(dataFromJson.percent_change_7d)
//        print(dataFromJson.market_cap_usd)
        // Do any additional setup after loading the view, typically from a nib.
        //        tableView.separatorInset.left = 10
        //        tableView.separatorInset.right = 10
        
        let nib = UINib(nibName: "Crypto_TVCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        plus.backgroundColor = UIColor.blue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cryptoInfos.count != 0{
            print("$$$$$$$$$")
            return cryptoInfos.count
        }else{
            print("arrayForUser = \(String(describing: dataFromJson.arrayForUser))")
            print("count = \(String(describing: dataFromJson.arrayForUser?.count))")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! Crypto_TVCell
        
        cell.name.text = cryptoInfos[indexPath.item].name
        cell.symbol.text = cryptoInfos[indexPath.item].symbol
        cell.price.text = cryptoInfos[indexPath.item].price_usd?.description
        cell.volume.text = cryptoInfos[indexPath.item].volume_usd_24h?.description
        
        cell.selectionStyle = .none
        
        return cell
    }

}






