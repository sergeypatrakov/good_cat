//
//  FinalViewController.swift
//  goodboy
//
//  Created by Sergey Patrakov on 28.08.2024.
//

import UIKit

class FinalViewController: UIViewController {
    lazy var text = UILabel()
    lazy var button = UIButton()
    lazy var image = UIImageView()
    lazy var alertButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
    }
    
    func setUpLayout() {
        configurateImage()
        configurateButton()
        configurateText()
        configureAlertButton()
    }
    
    func configurateImage() {
        view.addSubview(image)
        image.image = UIImage(named: "goodboy")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configurateText() {
        view.addSubview(text)
        text.text = "Хороший мальчик"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configurateButton() {
        view.addSubview(button)
        button.setTitle("Вернуться в начало", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.goToFirstView()
        button.addTarget(self, action: #selector(navigateToFinalViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configureAlertButton() {
        view.addSubview(alertButton)
        let buttonWidth: CGFloat = 120
        let buttonHeight: CGFloat = 80
        alertButton.frame = CGRect(x: (view.frame.width - buttonWidth) / 2, y: 300, width: buttonWidth, height: buttonHeight)
        alertButton.setTitle("Погладить против шерсти", for: .normal)
        alertButton.titleLabel?.textAlignment = .center
        alertButton.titleLabel?.numberOfLines = 0
        
        alertButton.goNextView()
        alertButton.addTarget(self, action: #selector(againstWool), for: .touchUpInside)
    }
    
    @objc func navigateToFinalViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func againstWool() {
        someAlert()
    }
}

extension FinalViewController {
    func someAlert() {
        let alertController = UIAlertController(title: "Эй, кожанный!", message: "А если тебя погладить против шерсти, а?", preferredStyle: .alert)
        let noMoreAction = UIAlertAction(title: "Больше не буду", style: .default, handler: nil)
        alertController.addAction(noMoreAction)
        
        present(alertController, animated: true) {
            print("ALERT!")
        }
    }
}
