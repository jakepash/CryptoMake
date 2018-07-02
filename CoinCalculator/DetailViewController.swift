//
//  DetailViewController.swift
//  CoinCalculator
//
//  Created by Jacob Pashman on 4/12/18.
//  Copyright © 2018 jacobpashman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var availableSupplyLabel: UILabel!
    @IBOutlet weak var totalSupplyLabel: UILabel!
    @IBOutlet weak var change1hLabel: UILabel!
    @IBOutlet weak var change24hLabel: UILabel!
    @IBOutlet weak var change7dLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = "\(list[clickedCoin].name): \(list[clickedCoin].symbol)"
        rankLabel.text = String(list[clickedCoin].rank)
        availableSupplyLabel.text = String(list[clickedCoin].availableSupply)
        change1hLabel.text = String(list[clickedCoin].percentChange1h) + "%"
        change24hLabel.text = String(list[clickedCoin].percentChange24h) + "%"
        change7dLabel.text = String(list[clickedCoin].percentChange7d) + "%"
        
        if list[clickedCoin].percentChange1h < 0 {
            change1hLabel.textColor = UIColor.red
        }
        if list[clickedCoin].percentChange24h < 0 {
            change24hLabel.textColor = UIColor.red
        }
        if list[clickedCoin].percentChange7d < 0 {
            change7dLabel.textColor = UIColor.red
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
