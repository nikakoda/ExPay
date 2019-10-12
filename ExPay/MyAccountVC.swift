//
//  ViewController2.swift
//  ExPay
//
//  Created by Ника Перепелкина on 08/10/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

class MyAccountVC: UIViewController, ScrollPagerDelegate {

    @IBOutlet var scrollPager: ScrollPager!
   // @IBOutlet var secondScrollPager: ScrollPager!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var viewWithButtons: UIView!
    
    
    // баланс
     var moneyTHB = 2500.0
     lazy var moneyDRG = moneyTHB * 0.36
     lazy var moneyBTC = moneyTHB * 0.000004
     lazy var moneyETC = moneyTHB * 0.007
     lazy var moneyABC = moneyTHB * 0.004
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // фон
        let color2 = #colorLiteral(red: 0.1725490196, green: 0.231372549, blue: 0.2823529412, alpha: 1).cgColor
        let color1 = #colorLiteral(red: 0.03137254902, green: 0.03529411765, blue: 0.03921568627, alpha: 1).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.4, y: 0.4)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 0.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        // фон для поля с кнопками
        viewWithButtons.backgroundColor = UIColor(patternImage: UIImage(named: "MaskGroup")!)
        
        
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        //addSublayer
        

        // внешний вид навигационной панели
                       navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.06274509804, green: 0.08235294118, blue: 0.09803921569, alpha: 1)
                      navigationController?.navigationBar.isTranslucent = false

       // scrollPager.scrollView?.backgroundColor = #colorLiteral(red: 0, green: 0.6, blue: 1, alpha: 1)

        
        // спрятать кнопку "назад"
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        
        // label для баланса
        let firstView = UILabel()
        firstView.text = "\(Int(moneyTHB))"
        firstView.textColor = .white
        firstView.font = UIFont.systemFont(ofSize: 40)
        firstView.textAlignment = .center
        
        let secondView = UILabel()
        secondView.text = "\(Int(moneyDRG))"
        secondView.textColor = .white
        secondView.font = UIFont.systemFont(ofSize: 40)
        secondView.textAlignment = .center
        
        let thirdView = UILabel()
        thirdView.text = "\(Int(moneyBTC))"
        thirdView.textColor = .white
        thirdView.font = UIFont.systemFont(ofSize: 40)
        thirdView.textAlignment = .center
        
        let fourthView = UILabel()
        fourthView.text = "\(Int(moneyETC))"
        fourthView.textColor = .white
        fourthView.font = UIFont.systemFont(ofSize: 40)
        fourthView.textAlignment = .center
        
        let fifthView = UILabel()
        fifthView.text = "\(Int(moneyABC))"
        fifthView.textColor = .white
        fifthView.font = UIFont.systemFont(ofSize: 40)
        fifthView.textAlignment = .center
        
        
        
        
        // label для валют
        let firstView1 = UILabel()
       // firstView1.backgroundColor = UIColor.white
        firstView1.text = "THB"
        firstView1.textColor = .white
        firstView1.font = UIFont.systemFont(ofSize: 14)
        firstView1.textAlignment = .right
        
        let secondView1 = UILabel()
        secondView1.text = "DRG"
        secondView1.textColor = .white
        secondView1.font = UIFont.systemFont(ofSize: 14)
        secondView1.textAlignment = .right
        
        let thirdView1 = UILabel()
        thirdView1.text = "BTC"
        thirdView1.textColor = .white
        thirdView1.font = UIFont.systemFont(ofSize: 14)
        thirdView1.textAlignment = .right
        
        let fourthView1 = UILabel()
        fourthView1.text = "ETC"
        fourthView1.textColor = .white
        fourthView1.font = UIFont.systemFont(ofSize: 14)
        fourthView1.textAlignment = .right
        
        let fifthView1 = UILabel()
        fifthView1.text = "ABC"
        fifthView1.textColor = .white
        fifthView1.font = UIFont.systemFont(ofSize: 14)
        fifthView1.textAlignment = .right
        
        
        // label для пояснения
        let firstView2 = UILabel()
        firstView2.text = "Money in your wallet"
        firstView2.textColor = #colorLiteral(red: 0.6549019608, green: 0.8274509804, blue: 0.9411764706, alpha: 1)
        firstView2.font = UIFont.systemFont(ofSize: 14)
        firstView2.textAlignment = .center
        
        let secondView2 = UILabel()
        secondView2.text = "Money in your wallet"
        secondView2.textColor = #colorLiteral(red: 0.6549019608, green: 0.8274509804, blue: 0.9411764706, alpha: 1)
        secondView2.font = UIFont.systemFont(ofSize: 14)
        secondView2.textAlignment = .center
        
        let thirdView2 = UILabel()
        thirdView2.text = "Money in your wallet"
        thirdView2.textColor = #colorLiteral(red: 0.6549019608, green: 0.8274509804, blue: 0.9411764706, alpha: 1)
        thirdView2.font = UIFont.systemFont(ofSize: 14)
        thirdView2.textAlignment = .center
        
        let fourthView2 = UILabel()
        fourthView2.text = "Money in your wallet"
        fourthView2.textColor = #colorLiteral(red: 0.6549019608, green: 0.8274509804, blue: 0.9411764706, alpha: 1)
        fourthView2.font = UIFont.systemFont(ofSize: 14)
        fourthView2.textAlignment = .center
        
        let fifthView2 = UILabel()
        fifthView2.text = "Money in your wallet"
        fifthView2.textColor = #colorLiteral(red: 0.6549019608, green: 0.8274509804, blue: 0.9411764706, alpha: 1)
        fifthView2.font = UIFont.systemFont(ofSize: 14)
        fifthView2.textAlignment = .center
        
        
        scrollPager.delegate = self
       scrollPager.addSegmentsWithTitlesAndViews(segments: [
           ("THB", firstView, firstView1, firstView2),
           ("DRG", secondView, secondView1, secondView2),
           ("BTC", thirdView, thirdView1, thirdView2),
           ("ETC", fourthView, fourthView1, fourthView2),
           ("ABC", fifthView, fifthView1, fifthView2)
           ])
    
    }
    
    // MARK: - ScrollPagerDelegate -
    
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int) {
        print("scrollPager index changed: \(changedIndex)")
    }
    
//    let t = ScrollPager()
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        forwardButton.isEnabled = true
        
        if (scrollPager.getCurrentIndex() == 0){
            sender.isEnabled = false
        } else {
            scrollPager.setSelectedIndex(index: scrollPager.getCurrentIndex()-1, animated: true)
           // sender.isEnabled = true
        }
        
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIButton) {
        
        backButton.isEnabled = true
        
        if (scrollPager.getCurrentIndex() == 4){
            sender.isEnabled = false
        } else {
            scrollPager.setSelectedIndex(index: scrollPager.getCurrentIndex()+1, animated: true)
            //sender.isEnabled = true
        }
        
        
        
     //  t.setSelectedIndex(index: 2, animated: true, moveScrollView: false)
     //  t.scrollViewDidScroll(view as! UIScrollView)
      }
   
    

}
