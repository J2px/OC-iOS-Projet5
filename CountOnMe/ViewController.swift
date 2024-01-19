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
    var expression: String!
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        expression = simpleCalc.elements.joined(separator: "")
        textView.text = expression
        
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
                    return
                }

                initCalcultor()

                //expression.append(numberText)
                textView.text.append(numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        initCalcultor()
        if simpleCalc.canAddOperator {
            textView.text.append(" + ")
           } else {
               let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
               alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
               self.present(alertVC, animated: true, completion: nil)
           }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        initCalcultor()
        if simpleCalc.canAddOperator {
            textView.text.append(" - ")
            expression.append(" - ")
        } else {
                let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            }
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        initCalcultor()
        if simpleCalc.canAddOperator {
            textView.text.append(" * ")
            } else {
                let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        initCalcultor()
        if simpleCalc.canAddOperator {
            textView.text.append(" / ")
            } else {
                let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
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
        
                let result = simpleCalc.calculateResult()
                textView.text.append(" = \(result)")
    }
    
    func initCalcultor() {
            if simpleCalc.expressionHaveResult {
                textView.text = ""
            }
        }
}
