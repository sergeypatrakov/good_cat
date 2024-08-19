//
//  ConstraintViewController.swift
//  goodboy
//
//  Created by Sergey Patrakov on 19.08.2024.
//

import UIKit

class ConstraintViewController: UIViewController {

    var isAnimated: Bool = false
    let button = UIButton()
    var squareBlueTopConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    func setupLayout() {
        configureSquareBlue()
        configureSquareRed()
        configureSquareYellow()
        configureSquareGreen()
        configureButton()
    }

    func configureSquareBlue() {
        let squareBlue = UIView()
        view.addSubview(squareBlue)
        squareBlue.backgroundColor = .blue
        squareBlue.translatesAutoresizingMaskIntoConstraints = false
        
        squareBlueTopConstraint = squareBlue.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        
        NSLayoutConstraint.activate([
            squareBlueTopConstraint!,
            squareBlue.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            squareBlue.widthAnchor.constraint(equalToConstant: 50),
            squareBlue.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func configureSquareRed() {
        let squareRed = UIView()
        view.addSubview(squareRed)
        squareRed.backgroundColor = .red
        squareRed.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            squareRed.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            squareRed.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            squareRed.widthAnchor.constraint(equalToConstant: 50),
            squareRed.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func configureSquareYellow() {
        let squareYellow = UIView()
        view.addSubview(squareYellow)
        squareYellow.backgroundColor = .yellow
        squareYellow.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            squareYellow.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            squareYellow.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            squareYellow.widthAnchor.constraint(equalToConstant: 50),
            squareYellow.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func configureSquareGreen() {
        let squareGreen = UIView()
        view.addSubview(squareGreen)
        squareGreen.backgroundColor = .green
        squareGreen.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            squareGreen.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            squareGreen.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            squareGreen.widthAnchor.constraint(equalToConstant: 50),
            squareGreen.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configureButton() {
        view.addSubview(button) // Add to parents view
        button.backgroundColor = .black
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.white, for: .normal)
    
        button.translatesAutoresizingMaskIntoConstraints = false
    
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc func buttonPressed() {
        guard let squareBlueTopConstraint = squareBlueTopConstraint else { return }
        if !isAnimated {
            squareBlueTopConstraint.constant = 60
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3) {
                self.view.layoutIfNeeded()
            }
            isAnimated = true
        } else {
            squareBlueTopConstraint.constant = 15
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3) {
                self.view.layoutIfNeeded()
            }
            isAnimated = false
        }
    }
}
