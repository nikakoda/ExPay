//
//  ContentVCViewController.swift
//  ExPay
//
//  Created by Ника Перепелкина on 07/10/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {

    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
       
       var pageIndex: Int = 0
       var strTitle: String!

    
    
    var moneyTHB = 2500.0
          lazy var moneyDRG = moneyTHB * 0.36
          lazy var moneyBTC = moneyTHB * 0.000004
          lazy var moneyETC = moneyTHB * 0.007
          lazy var moneyABC = moneyTHB * 0.004
          
         lazy var moneyArr = ["\(Int(moneyTHB))", "\(Int(moneyDRG))", "\(Int(moneyBTC))", "\(Int(moneyETC))", "\(Int(moneyABC))"]
          lazy var valueArr = ["THB", "DRG", "BTC", "ETC", "ABC"]
          
    
    
    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           nameLabel.text = strTitle
        
        
        
        
        // спрятать кнопку "назад"
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        
        /*
        let color1 = #colorLiteral(red: 0.06666666667, green: 0.2274509804, blue: 0.3725490196, alpha: 1).cgColor
        let color2 = #colorLiteral(red: 0.02352941176, green: 0.1019607843, blue: 0.1725490196, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
 */
        

        view.endEditing(false)
       }
    
   // let vcvc = ViewController2()

  // var t = ViewController2()

    ////////////
    @IBAction func backButtonPressed(_ sender: UIButton) {
       
       // nameLabel.text = valueArr[3]
        print("777")
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        
        
    }
    
    
}
