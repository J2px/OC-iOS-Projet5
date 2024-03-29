//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    var simpleCalc = SimpleCalc()

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = simpleCalc.elements.joined(separator: "")

    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
                    return
                }
                simpleCalc.elements.append(numberText)
                textView.text.append(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {

        if simpleCalc.canAddOperator {
            simpleCalc.elements.append("+")
            textView.text = simpleCalc.elements.joined(separator: "")
           } else {
               let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
               alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
               self.present(alertVC, animated: true, completion: nil)
           }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {

        if simpleCalc.canAddOperator {
            simpleCalc.elements.append("-")
            textView.text = simpleCalc.elements.joined(separator: "")
        } else {
                let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {

        if simpleCalc.canAddOperator {
            simpleCalc.elements.append("*")
            textView.text = simpleCalc.elements.joined(separator: "")
        } else {
                let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            }
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {

        if simpleCalc.canAddOperator {
            simpleCalc.elements.append("/")
            textView.text = simpleCalc.elements.joined(separator: "")
        } else {
                let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            }
    }
    
    
    @IBAction func tappedClearButton(_ sender: Any) {
        simpleCalc.elements.removeAll()
            textView.text = ""
    }
    
    @IBAction func tappedPointButton(_ sender: Any) {
        if !simpleCalc.elements.isEmpty && !simpleCalc.elements.last!.contains(".") {
                simpleCalc.elements.append(".")
                textView.text.append(".")
            }
    }
    
    

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        /*guard simpleCalc.expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
                }

        guard simpleCalc.expressionHaveEnoughElement else {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    return self.present(alertVC, animated: true, completion: nil)
                        }
        
        guard simpleCalc.divisionByZero else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
                }*/

        if let result = simpleCalc.calculateExpression(from: simpleCalc.elements) {
            let resultString = String(result)
            textView.text = "\(textView.text ?? "") = \(resultString)"
        } else {
            textView.text = "\(textView.text ?? "") = Error" // En cas d'erreur de calcul
        }
    }

    func initCalcultor() {
            if simpleCalc.expressionHaveResult {
                textView.text = ""
            }
        }
}
