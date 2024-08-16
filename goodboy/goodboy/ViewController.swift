//
//  ViewController.swift
//  goodboy
//
//  Created by Sergey Patrakov on 16.08.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonFirstViewController: UIButton!
    @IBOutlet weak var textFirstViewController: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        standartText()
    }
    
    func standartText() {
        textFirstViewController.text = "Привет! Данное приложение позволяет тебе взаимодействовать с котиками 😻"
        textFirstViewController.numberOfLines = 0
    }
    
    @IBAction func buttonTouch(_ sender: Any) {
        textFirstViewController.text = "Может покормим котика? \nДля этого нажми на котика"
        textFirstViewController.textAlignment = .center
    }
}

