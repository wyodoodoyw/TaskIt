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
    
    var inventoryMoney = 20
    var inventoryLemons = 5
    var inventroyIceCubes = 5
    
    var numberLemonsToPurchase = 0
    var numberIceCubesToPurchase = 0
    
    var numberLemonsInMix = 0
    var numberIceCubesInMix = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateLabels()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels () {
        
        youHaveMoneyLabel.text = "$\(inventoryMoney)"
        youHaveMoneyLabel.textAlignment = NSTextAlignment.Right
        youHaveLemonsLabel.text = "\(inventoryLemons)"
        youHaveLemonsLabel.textAlignment = NSTextAlignment.Right
        youHaveIceCubesLabel.text = "\(inventroyIceCubes)"
        youHaveIceCubesLabel.textAlignment = NSTextAlignment.Right
        
        purchaseLemonsLabel.text = "\(numberLemonsToPurchase)"
        purchaseIceCubesLabel.text = "\(numberIceCubesToPurchase)"
        
        mixLemonsLabel.text = "\(numberLemonsInMix)"
        mixIceCubesLabel.text = "\(numberIceCubesInMix)"
    }
    
    @IBAction func increasePurchaseLemons(sender: UIButton) {
        if true {
            numberLemonsToPurchase += 1
        }
        updateLabels()
    }
   
    @IBAction func decreasePurchaseLemons(sender: UIButton) {
        if numberLemonsToPurchase > 0 {
            numberLemonsToPurchase -= 1
        }
        updateLabels()
    }
    
    @IBAction func increasePurchaseIceCubes(sender: UIButton) {
        if true {
            numberIceCubesToPurchase += 1
        }
        updateLabels()
    }
    
    @IBAction func decreasePurchaseIceCubes(sender: UIButton) {
        if numberIceCubesToPurchase > 0 {
            numberIceCubesToPurchase -= 1
        }
        updateLabels()
    }
    
    @IBAction func increaseMixLemons(sender: UIButton) {
        if inventoryLemons > 0 {
            numberLemonsInMix += 1
            inventoryLemons -= 1
        }
        updateLabels()
    }
    
    @IBAction func decreaseMixLemons(sender: UIButton) {
        if numberLemonsInMix > 0 {
            numberLemonsInMix -= 1
            inventoryLemons += 1
        }
        updateLabels()
    }
    
    @IBAction func increaseMixIceCubes(sender: UIButton) {
        if inventroyIceCubes > 0 {
            numberIceCubesInMix += 1
            inventroyIceCubes -= 1
        }
        updateLabels()
    }
    
    @IBAction func decreaseMixIceCubes(sender: UIButton) {
        if numberIceCubesInMix > 0 {
            numberIceCubesInMix -= 1
            inventroyIceCubes += 1
        }
        updateLabels()
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
        let numberOfCustomersToday = Int(arc4random_uniform(UInt32(10)))
        println("Number of Customers = \(numberOfCustomersToday)")
    }
    
}

