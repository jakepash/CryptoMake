//
//  ViewController.swift
//  CoinCalculator
//
//  Created by Jacob Pashman on 4/11/18.
//  Copyright © 2018 jacobpashman. All rights reserved.
//
import UIKit
import CryptoCurrencyKit
var clickedCoin: Int!
var list: [Coin]!
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var time: Int = 0
    var totalMoney: Double = 0.0
    var totalCostBasis: Double = 0.0
    @IBOutlet weak var tbv: UITableView!
    @IBOutlet weak var totalCashLabel: UILabel!
    @IBOutlet weak var totalPercentChangeLabel: UILabel!
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return(list.count)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            cell.textLabel?.text = String(list[indexPath.row].name)
            
            let priceLabel = UILabel(frame: CGRect(x: cell.contentView.frame.width-20, y: 12, width: 100, height: 25))
            if list[indexPath.row].costBasis > 0 {
                let percent = abs(list[indexPath.row].price - list[indexPath.row].costBasis) / list[indexPath.row].costBasis  * 100.0
                priceLabel.text = String(Double(round(1000*percent)/1000)) + "%"
                if list[indexPath.row].price > list[indexPath.row].costBasis {
                    priceLabel.textColor = UIColor(red:0.4, green:0.8, blue:0.63, alpha:1.0)
                } else {
                    priceLabel.textColor = UIColor(red:0.93, green:0.45, blue:0.44, alpha:1.0)
                }
            } else {
                priceLabel.text = "none owned"
            }
            
            priceLabel.textAlignment = NSTextAlignment.right
            cell.contentView.addSubview(priceLabel)
            
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        clickedCoin = indexPath.row
        performSegue(withIdentifier: "segue", sender: indexPath.row)
        
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetch()
        refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list = [Coin(name: "Bitcoin"), Coin(name: "Ethereum"), Coin(name: "Ripple"), Coin(name: "Bitcoin-Cash"), Coin(name: "EOS"), Coin(name: "LiteCoin"), Coin(name: "Cardano"), Coin(name: "Stellar"),Coin(name: "IOTA"), Coin(name: "NEO"), Coin(name: "Monero"), Coin(name: "Dash"), Coin(name: "NEM"), Coin(name: "TRON"), Coin(name: "Tether")]
//        list = [Coin(name: "Bitcoin")]
        // Do any additional setup after loading the view, typically from a nib.
        fetch()
        self.tbv.addSubview(self.refreshControl)
        //_ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(reload), userInfo: nil, repeats: true)
        
        self.tbv.allowsSelection = true
     
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        totalMoney = 0.0
        
        // Total Money
        for row in 0...list.count-1 {
            totalMoney += list[row].price*list[row].amountOwned
            print(totalMoney)
        }
        self.totalCashLabel.text = String("$\(totalMoney)")
        
        // Total percent change
        
        for row in 0...list.count-1{
            totalCostBasis += list[row].costBasis
        }
        let total = (totalMoney-totalCostBasis)/totalCostBasis

        self.totalPercentChangeLabel.text = String(format: "%.02f", total*100) + "%"
        
        
    }
    
    func fetch() {
        for i in 0...list.count-1 {
             list[i].fetch()
            
        }
        tbv.reloadData()
        
    }
    
    @objc func reload() {
        tbv.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(ViewController.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.black
        
        return refreshControl
    }()
    
    
}
