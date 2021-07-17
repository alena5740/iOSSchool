//
//  MassiveViewController.swift
//  MVC
//
//  Created by Алена on 10.07.2021.
//

import UIKit


final class MassiveViewController: UIViewController {
    
    private let buttonBlue = UIButton()
    private let buttonGreen = UIButton()
    private let buttonRed = UIButton()
    private let buttonYellow = UIButton()
    private let viewColor = UIView()
    
    private var model = ColorModel(backgroundColor: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        makeViews()
    }
    
    private func setup() {
        
        buttonBlue.backgroundColor = .blue
        buttonGreen.backgroundColor = .green
        buttonRed.backgroundColor = .red
        buttonYellow.backgroundColor = .yellow
        viewColor.backgroundColor = model.backgroundColor
        
        buttonBlue.layer.cornerRadius = 10
        buttonGreen.layer.cornerRadius = 10
        buttonRed.layer.cornerRadius = 10
        buttonYellow.layer.cornerRadius = 10
        viewColor.layer.cornerRadius = 45
        
        buttonBlue.addTarget(self, action: #selector(changeColorBlue), for: .touchUpInside)
        buttonGreen.addTarget(self, action: #selector(changeColorGreen), for: .touchUpInside)
        buttonRed.addTarget(self, action: #selector(changeColorRed), for: .touchUpInside)
        buttonYellow.addTarget(self, action: #selector(changeColorYellow), for: .touchUpInside)

    }
    
    private func makeViews() {
        
        let bounds = UIScreen.main.bounds
        view.addSubview(buttonBlue)
        view.addSubview(buttonGreen)
        view.addSubview(buttonRed)
        view.addSubview(buttonYellow)
        view.addSubview(viewColor)
        
        buttonBlue.frame = CGRect(x: 16, y: view.frame.maxY - 100, width: (bounds.width - 80) / 4, height: 68)
        buttonGreen.frame = CGRect(x: buttonBlue.frame.maxX + 16, y: view.frame.maxY - 100, width: (bounds.width - 80) / 4, height: 68)
        buttonRed.frame = CGRect(x: buttonGreen.frame.maxX + 16, y: view.frame.maxY - 100, width: (bounds.width - 80) / 4, height: 68)
        buttonYellow.frame = CGRect(x: buttonRed.frame.maxX + 16, y: view.frame.maxY - 100, width: (bounds.width - 80) / 4, height: 68)
        
        viewColor.frame = CGRect(x: 16, y: 80, width: bounds.width - 32, height: bounds.height - 212)
    }
    
    @objc func changeColorBlue() {
        model.backgroundColor = .blue
        viewColor.backgroundColor = model.backgroundColor
    }
    
    @objc func changeColorGreen() {
        model.backgroundColor = .green
        viewColor.backgroundColor = model.backgroundColor
    }
    
    @objc func changeColorRed() {
        model.backgroundColor = .red
        viewColor.backgroundColor = model.backgroundColor
    }
    
    @objc func changeColorYellow() {
        model.backgroundColor = .yellow
        viewColor.backgroundColor = model.backgroundColor
    }
}
