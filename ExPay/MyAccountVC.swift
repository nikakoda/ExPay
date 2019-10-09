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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        


////////////// добавить кнопу
        
      //          let frame1 = CGRect(x: 20, y: 20, width: 45, height: 45 )
      //          let button = UIButton(frame: frame1)
      //  button.imageView?.image = UIImage(named: "home")
      // // button.setTitle("asdfasdf", for: .normal)
      //  button.backgroundColor = UIColor.yellow
      //  self.scrollPager.addSubview(button)

        
        
        
        
        
        
        
        
        // спрятать кнопку "назад"
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        let firstView = UILabel()
        firstView.backgroundColor = UIColor.white
        firstView.text = "first View"
        firstView.textAlignment = .center
        
        let secondView = UILabel()
        secondView.backgroundColor = UIColor.white
        secondView.text = "second view"
        secondView.textAlignment = .center
        
        let thirdView = UILabel()
        thirdView.backgroundColor = UIColor.white
        thirdView.text = "third view"
        thirdView.textAlignment = .center
        
        let fourthView = UILabel()
        fourthView.backgroundColor = UIColor.white
        fourthView.text = "fourth view"
        fourthView.textAlignment = .center
        
        scrollPager.delegate = self
        scrollPager.addSegmentsWithTitlesAndViews(segments: [
            ("Home", firstView),
            ("Public Feed", secondView),
            ("Profile", thirdView),
            ("One More", fourthView)
            ])
        
    
    }
    
    // MARK: - ScrollPagerDelegate -
    
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int) {
        print("scrollPager index changed: \(changedIndex)")
    }
    
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIButton) {
      }
   
    

}
