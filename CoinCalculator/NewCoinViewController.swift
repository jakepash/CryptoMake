//
//  NewCoinViewController.swift
//  CoinCalculator
//
//  Created by Adam Eliezerov on 03/07/2018.
//  Copyright © 2018 jacobpashman. All rights reserved.
//

import UIKit

class NewCoinViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    

    var coinOptions: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CoinPickerView.delegate = self
        self.CoinPickerView.dataSource = self
        

        // Do any additional setup after loading the view.
        coinOptions = ["Bitcoin","Ethereum","Ripple","Bitcoin-Cash","EOS","LiteCoin","Cardano","Stellar","IOTA","NEO","Monero","Dash","NEM","TRON","Tether"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var CoinPickerView: UIPickerView!
    @IBOutlet weak var AmountBought: UITextField!
    @IBOutlet weak var CostBasis: UITextField!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinOptions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinOptions[row]
    }
    


}
