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
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cryptoCell
        cell.name.text = dataFromJson.arrayForUser![indexPath.row]["name"] as? String
        cell.symbol.text = dataFromJson.arrayForUser![indexPath.row]["symbol"] as? String
        cell.price.text = dataFromJson.arrayForUser![indexPath.row]["price_usd"] as? String
        cell.cap.text = dataFromJson.arrayForUser![indexPath.row]["market_cap_usd"] as? String
//        cell.separatorInset.left = 5
//        cell.separatorInset.right = 5
        cell.layer.cornerRadius = 30
        cell.layer.borderWidth = 6
        
        
//        cell.layer.borderColor = UIColor.white.cgColor
//        cell = cell.makeFakeBorder(inputView: cell, width: 2, color: UIColor.blue)
//        cell.separatorInset.right = 0
//        let bottom_border = CALayer()
//        let bottom_padding = CGFloat(10.0)
//        bottom_border.borderColor = UIColor.white.cgColor
//        bottom_border.frame = CGRect(x: 0, y: cell.frame.size.height - bottom_padding, width:  cell.frame.size.width, height: cell.frame.size.height)
//        bottom_border.borderWidth = bottom_padding
//
//        let right_border = CALayer()
//        let right_padding = CGFloat(15.0)
//        right_border.borderColor = UIColor.white.cgColor
//        right_border.frame = CGRect(x: cell.frame.width - right_padding, y: 0, width: right_padding, height: cell.frame.size.height)
//        print("cell.frame.width = \(cell.frame.width)")
//        print("cell.frame.maxX = \(cell.frame.maxX)")
//        right_border.backgroundColor = UIColor.blue.cgColor
//        right_border.borderWidth = right_padding
//
//        let left_border = CALayer()
//        let left_padding = CGFloat(15.0)
//        left_border.borderColor = UIColor.white.cgColor
//        left_border.frame = CGRect(x: 0, y: 0, width: left_padding, height: cell.frame.size.height)
//        left_border.borderWidth = left_padding
//
//        let top_border = CALayer()
//        let top_padding = CGFloat(10.0)
//        top_border.borderColor = UIColor.white.cgColor
//        top_border.frame = CGRect(x: 0, y: 0, width: cell.frame.size.width, height: top_padding)
//        top_border.borderWidth = top_padding
//
//
//        cell.layer.addSublayer(bottom_border)
//        cell.layer.addSublayer(right_border)
//        cell.layer.addSublayer(left_border)
//        cell.layer.addSublayer(top_border)
        
        let rectOfCell = self.tableView.rectForRow(at: indexPath)
        let rectOfCellInSuperview = self.tableView.convert(rectOfCell, to: tableView.superview)
        print(rectOfCellInSuperview)
        
        let fakeBorder = UIView()
        fakeBorder.frame = CGRect(x: 0, y: 0, width: rectOfCellInSuperview.width, height: rectOfCellInSuperview.height)
        fakeBorder.backgroundColor = UIColor.white
        fakeBorder.addSubview(cell)
//        cell.addSubview(fakeBorder)
        cell.backgroundColor = UIColor.red
        cell.layer.borderColor = cell.superview?.backgroundColor?.cgColor
//        print("cell's right coordinate = \(cell.frame.)")
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
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
        // Do any additional setup after loading the view, typically from a nib.
//        tableView.separatorInset.left = 10
//        tableView.separatorInset.right = 10
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//extension cryptoCell{
//    func makeFakeBorder(inputView:cryptoCell,width:CGFloat,color:UIColor) -> cryptoCell {
//        let fakeBorder = cryptoCell()
//        fakeBorder.frame = CGRect(x:inputView.frame.minX, y:inputView.frame.minY, width:inputView.bounds.width, height: inputView.bounds.height)
//        fakeBorder.backgroundColor = color
////        fakeBorder.clipsToBounds = true
//        fakeBorder.layer.cornerRadius = 30
//        fakeBorder.addSubview(inputView)
//        inputView.backgroundColor = UIColor.brown
//        inputView.center = CGPoint(x: inputView.center.x, y: inputView.center.y)
//        inputView.separatorInset = UIEdgeInsets.zero
//        return fakeBorder
//    }
//}





