//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Matthew Wood on 2015-04-28.
//  Copyright (c) 2015 Matthew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var youHaveMoneyLabel: UILabel!
    @IBOutlet weak var youHaveLemonsLabel: UILabel!
    @IBOutlet weak var youHaveIceCubesLabel: UILabel!
    
    @IBOutlet weak var purchaseLemonsLabel: UILabel!
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceCubesLabel: UILabel!
    
    var inventoryMoney = 5
    var inventoryLemons = 5
    var inventroyIceCubes = 5
    
    var numberLemonsToPurchase = 5
    var numberIceCubesToPurchase = 5
    
    var numberLemonsInMix = 5
    var numberIceCubesInMix = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupLabels()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLabels () {
        
        youHaveMoneyLabel.text = "$\(inventoryMoney)"
        youHaveLemonsLabel.text = "\(inventoryLemons)"
        youHaveIceCubesLabel.text = "\(inventroyIceCubes)"
        
        purchaseLemonsLabel.text = "\(numberLemonsToPurchase)"
        purchaseIceCubesLabel.text = "\(numberIceCubesToPurchase)"
        
        mixLemonsLabel.text = "\(numberLemonsInMix)"
        mixIceCubesLabel.text = "\(numberIceCubesInMix)"
    }
    
    @IBAction func increasePurchaseLemons(sender: UIButton) {
    }
   
    @IBAction func decreasePurchaseLemons(sender: UIButton) {
    }
    
    @IBAction func increasePurchaseIceCubes(sender: UIButton) {
    }
    
    @IBAction func decreasePurchaseIceCubes(sender: UIButton) {
    }
    
    @IBAction func increaseMixLemons(sender: UIButton) {
    }
    
    @IBAction func decreaseMixLemons(sender: UIButton) {
    }
    
    @IBAction func increaseMixIceCubes(sender: UIButton) {
    }
    
    @IBAction func decreaseMixIceCubes(sender: UIButton) {
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
    }
    
}

