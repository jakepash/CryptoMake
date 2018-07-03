//
//  DetailViewController.swift
//  CoinCalculator
//
//  Created by Jacob Pashman on 4/12/18.
//  Copyright © 2018 jacobpashman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

   // @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var availableSupplyLabel: UILabel!
    @IBOutlet weak var totalSupplyLabel: UILabel!
    @IBOutlet weak var change1hLabel: UILabel!
    @IBOutlet weak var change24hLabel: UILabel!
    @IBOutlet weak var change7dLabel: UILabel!
    @IBOutlet weak var costBasisLabel: UILabel!
    @IBOutlet weak var amountMadeLabel: UILabel!
    @IBOutlet weak var percentMadeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //nameLabel.text = String("\(list[clickedCoin].name): \(list[clickedCoin].symbol)")
        rankLabel.text = String(list[clickedCoin].rank)
        availableSupplyLabel.text = String(list[clickedCoin].availableSupply)
        change1hLabel.text = String(list[clickedCoin].percentChange1h) + "%"
        change24hLabel.text = String(list[clickedCoin].percentChange24h) + "%"
        change7dLabel.text = String(list[clickedCoin].percentChange7d) + "%"
        costBasisLabel.text = "$" + String(list[clickedCoin].costBasis)
        let amountMade = list[clickedCoin].price-list[clickedCoin].costBasis
        amountMadeLabel.text = String(format: "$%.02f", amountMade)
        let percentMade = (list[clickedCoin].price - list[clickedCoin].costBasis) / list[clickedCoin].costBasis  * 100.0
        percentMadeLabel.text = String(format: "%.02f", percentMade) + "%"
        
        
        if list[clickedCoin].percentChange1h < 0 {
            change1hLabel.textColor = UIColor.red
        }
        if list[clickedCoin].percentChange24h < 0 {
            change24hLabel.textColor = UIColor.red
        }
        if list[clickedCoin].percentChange7d < 0 {
            change7dLabel.textColor = UIColor.red
        }
        if amountMade < 0 {
            amountMadeLabel.textColor = UIColor.red
        }
        if percentMade < 0 {
            percentMadeLabel.textColor = UIColor.red
        }
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
