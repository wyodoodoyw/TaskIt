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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

