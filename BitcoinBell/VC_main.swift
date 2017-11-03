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
    var a = [[1,2,3], [1,2], [3,2,1]]
    
    @IBOutlet var plus: UIButton!
    @IBOutlet var tableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = dataFromJson.arrayForUser?.count{
            print("$$$$$$$$$")
            return count
        }else{
            print("arrayForUser = \(String(describing: dataFromJson.arrayForUser))")
            print("count = \(String(describing: dataFromJson.arrayForUser?.count))")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cryptoCell
        cell.name.text = dataFromJson.arrayForUser![indexPath.row]["name"] as? String
        cell.symbol.text = dataFromJson.arrayForUser![indexPath.row]["symbol"] as? String
        cell.price.text = dataFromJson.arrayForUser![indexPath.row]["price_usd"] as? String
        cell.cap.text = dataFromJson.arrayForUser![indexPath.row]["market_cap_usd"] as? String
        return cell
    }
    
    @IBAction func createBitcoin(_ sender: Any) {
        let result = coinmarketcapAPI.getDataFromCMC(nameOfCoin: "bitcoin", fiatCoinCategory: "USD")
        print("result = \(String(describing: result))")
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
        print(dataFromJson.name)
        print(dataFromJson.price_btc)
        print(dataFromJson.price_usd)
        print(dataFromJson.percent_change_1h)
        print(dataFromJson.percent_change_24h)
        print(dataFromJson.percent_change_7d)
        print(dataFromJson.market_cap_usd)
        print("count for a = \(a.count)")
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

