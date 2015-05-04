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
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var inventoryMoney = 20
    var inventoryLemons = 5
    var inventroyIceCubes = 5
    
    var numberLemonsToPurchase = 0
    var numberIceCubesToPurchase = 0
    
    var numberLemonsInMix = 0
    var numberIceCubesInMix = 0
    
    var numberOfCustomersToday = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateLabels()
        weather()
    
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
        if inventoryMoney >= 2 {
            numberLemonsToPurchase += 1
            inventoryMoney -= 2
            inventoryLemons += 1
        }
        updateLabels()
    }
   
    @IBAction func decreasePurchaseLemons(sender: UIButton) {
        if numberLemonsToPurchase > 0 {
            numberLemonsToPurchase -= 1
            inventoryMoney += 2
            inventoryLemons -= 1
        }
        updateLabels()
    }
    
    @IBAction func increasePurchaseIceCubes(sender: UIButton) {
        if inventoryMoney >= 1 {
            numberIceCubesToPurchase += 1
            inventoryMoney -= 1
            inventroyIceCubes += 1
        }
        updateLabels()
    }
    
    @IBAction func decreasePurchaseIceCubes(sender: UIButton) {
        if numberIceCubesToPurchase > 0 {
            numberIceCubesToPurchase -= 1
            inventoryMoney += 1
            inventroyIceCubes -= 1
        }
        updateLabels()
    }
    
    @IBAction func increaseMixLemons(sender: UIButton) {
        if inventoryLemons > 0 {
            numberLemonsInMix += 1
            //inventoryLemons -= 1
        }
        updateLabels()
    }
    
    @IBAction func decreaseMixLemons(sender: UIButton) {
        if numberLemonsInMix > 0 {
            numberLemonsInMix -= 1
            //inventoryLemons += 1
        }
        updateLabels()
    }
    
    @IBAction func increaseMixIceCubes(sender: UIButton) {
        if inventroyIceCubes > 0 {
            numberIceCubesInMix += 1
            //inventroyIceCubes -= 1
        }
        updateLabels()
    }
    
    @IBAction func decreaseMixIceCubes(sender: UIButton) {
        if numberIceCubesInMix > 0 {
            numberIceCubesInMix -= 1
            //inventroyIceCubes += 1
        }
        updateLabels()
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
        
        // calculate the lemon to ice cube ration
        var lemonToIceRatio:Float = 0.00
        lemonToIceRatio = Float(numberLemonsInMix) / Float(numberIceCubesInMix)
        println("\(lemonToIceRatio)")

        // calculate the random number of customes for the day
        numberOfCustomersToday = Int(arc4random_uniform(UInt32(10)))
        
        inventoryLemons -= numberLemonsInMix
        inventroyIceCubes -= numberIceCubesInMix
        
        //
        var customerPreferenceArray:[Float] = []
        var customerPreference:Float = 0.0
        
        for var i = 0; i < numberOfCustomersToday; i++ {
            let randomPreferenceNumber = Float(arc4random_uniform(UInt32(10))) * 0.1
            customerPreferenceArray.append(randomPreferenceNumber)
        }
        
        // test
        for var i = 0; i < numberOfCustomersToday; i++ {
            println("\(customerPreferenceArray[i])")
        }
        
        // determine how much you get paid
        for var i = 0; i < numberOfCustomersToday; i++ {
            if customerPreferenceArray[i] < 0.4 && lemonToIceRatio < 1 {
                inventoryMoney += 1
                println("Paid!")
            } else if customerPreferenceArray[i] >= 0.4 && customerPreferenceArray[i] < 0.6 && lemonToIceRatio == 1 {
                inventoryMoney += 1
                println("Paid!")
            } else if customerPreferenceArray[i] >= 0.6 && customerPreferenceArray[i] <= 1 && lemonToIceRatio > 1 {
                inventoryMoney += 1
                println("Paid!")
            } else {
                println("Not paid.")
            }
        }
        
        numberLemonsToPurchase = 0
        numberIceCubesToPurchase = 0
        numberLemonsInMix = 0
        numberIceCubesInMix = 0
        updateLabels()
        weather()

    }
    
    func weather () {
        let randomWeatherInt = Int(arc4random_uniform(UInt32(3)))
        
        switch randomWeatherInt {
            
        case 0:
            myImageView.image = UIImage(named: "cold")
            numberOfCustomersToday -= 3
        case 1:
            myImageView.image = UIImage(named: "mild")
        case 2:
            myImageView.image = UIImage(named: "warm")
            numberOfCustomersToday += 4
        default:
            myImageView.image = UIImage(named: "mild")
        }
        
        if numberOfCustomersToday < 0 {
            numberOfCustomersToday = 0
        }
    }
    
}

