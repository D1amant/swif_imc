//
//  ViewController.swift
//  IMC
//
//  Created by Luis Fernando Rodrigues  on 2/19/18.
//  Copyright © 2018 Luis Fernando Rodrigues . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var vIReult: UIView!
    
    var imc: Double = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        if let peso = Double(tfWeight.text!) , let  altura = Double(tfHeight.text!){
            imc = peso / (altura*altura)
            showResults()
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func showResults(){
        var result: String = "";
        var image: String = "";
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        tfResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named : image)
        vIReult.isHidden = false
        view.endEditing(true)
    }
}

