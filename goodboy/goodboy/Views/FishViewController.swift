//
//  FishViewController.swift
//  goodboy
//
//  Created by Sergey Patrakov on 16.08.2024.
//

import UIKit

class FishViewController: UIViewController {

    @IBOutlet weak var textFishViewController: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFish()
    }
    
    func textFish() {
        textFishViewController.text = "Что-то я уже не хочу кушать, может ты меня просто погладишь?"
        textFishViewController.numberOfLines = 0
        textFishViewController.textAlignment = .center
    }
}
