//
//  ViewController.swift
//  UIKitHomework
//
//  Created by Алена on 22.07.2021.
//

import UIKit

class ViewController: UIViewController {

    let donutView = DonutView()
    let holeView = SquareView()

    override func viewDidLoad() {
        super.viewDidLoad()
        donutView.frame = .init(x: 45, y: 260, width: 300, height: 300)
        holeView.frame = .init(x: 150, y: 320, width: 100, height: 100)
        holeView.backgroundColor = .cyan
        donutView.backgroundColor = .lightGray
        donutView.layer.cornerRadius = 150
        view.backgroundColor = .white
        view.addSubview(holeView)
        view.addSubview(donutView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }
}


