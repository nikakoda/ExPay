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
    @IBOutlet weak var getHelpButton: UIButton!
    
    @IBOutlet weak var IAgreeLabel: UILabel!
    @IBOutlet weak var termsLabel: UILabel!
    
    @IBOutlet weak var checkbox: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // фон 
        let color1 = #colorLiteral(red: 0.06666666667, green: 0.2274509804, blue: 0.3725490196, alpha: 1).cgColor
        let color2 = #colorLiteral(red: 0.02352941176, green: 0.1019607843, blue: 0.1725490196, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
       gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        // внешний вид клавиатуры
         phoneNumberPlace.keyboardType = .phonePad
        phoneNumberPlace.keyboardAppearance = .dark
        
//    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//    gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        textField(phoneNumberPlace, didFillMandatoryCharacters: true, didExtractValue: phoneNumberPlace.text!)
        
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.phoneNumberPlace.addBottomBorder()
       
       // phoneNumberPlace.textColor = #colorLiteral(red: 0.4941176471, green: 0.5450980392, blue: 0.5960784314, alpha: 1)
        
        
        
        
        // внешний вид кнопки Apply
        applyNumberButton.backgroundColor = #colorLiteral(red: 0, green: 0.6, blue: 1, alpha: 1)
        applyNumberButton.tintColor = .white
        applyNumberButton.layer.cornerRadius = 25
        
        
        // внешний вид кнопки Get help
              // applyNumberButton.backgroundColor = #colorLiteral(red: 0, green: 0.6, blue: 1, alpha: 1)
               getHelpButton.tintColor = .white
            //   applyNumberButton.layer.cornerRadius = 25
        
        
        IAgreeLabel.textColor = .white
        termsLabel.textColor = .white
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
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your phone number", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    
    
}




// нижняя белая полоса для поля ввода номера телефона
extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height + 4, width: self.frame.size.width, height: 1.5)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
