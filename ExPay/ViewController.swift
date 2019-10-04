//
//  ViewController.swift
//  ExPay
//
//  Created by Ника Перепелкина on 01/10/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit
import InputMask

class ViewController: UIViewController, MaskedTextFieldDelegateListener {
    
    @IBOutlet weak var phoneNumberPlace: UITextField!
    @IBOutlet weak var applyNumberButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // фон 
        let color1 = #colorLiteral(red: 0.06666666667, green: 0.2274509804, blue: 0.3725490196, alpha: 1).cgColor
        let color2 = #colorLiteral(red: 0.02352941176, green: 0.1019607843, blue: 0.1725490196, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        // внешний вид клавиатуры
         phoneNumberPlace.keyboardType = .phonePad
        phoneNumberPlace.keyboardAppearance = .dark
        
        textField(phoneNumberPlace, didFillMandatoryCharacters: true, didExtractValue: phoneNumberPlace.text!)
        
        
    }
    
    
    //подключение формата для номера телефона
    open func textField(
        _ textField: UITextField,
        didFillMandatoryCharacters complete: Bool,
        didExtractValue value: String
    ) {
        print(value)
    }
    
    
    
    
    
    
    //  override func viewDidAppear(_ animated: Bool) {
    //      super.viewDidAppear(animated)
    //
    //
    //      print(phoneNumberPlace.text)
    //             print(validate(value: phoneNumberPlace.text!))
    //
    //  }
    
    
    
    
    
    // первичная валидация номера телефона
    func validate(value: String) -> Bool {
        
        let PHONE_REGEX = "^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    
    
    
    // переход на 3 экран - SecurityCodeVC
    @IBAction func applyNumberButtonPressed(_ sender: UIButton) {

        guard phoneNumberPlace.text?.isEmpty == false else {return}
        
      //  print(phoneNumberPlace.text)
      //  print(validate(value: phoneNumberPlace.text!))
        
        if (validate(value: phoneNumberPlace.text!) == true) {

            performSegue(withIdentifier: "codeSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your phone number!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
}



