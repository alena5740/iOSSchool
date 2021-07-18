//
//  ViewController.swift
//  ActivityVС
//
//  Created by Алена on 14.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let buttonShare = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        let bounds = UIScreen.main.bounds
        view.addSubview(buttonShare)
        
        buttonShare.backgroundColor = .lightGray
        buttonShare.frame = CGRect(x: 16, y: bounds.height - 120, width: bounds.width - 32, height: 64)
        buttonShare.addTarget(self, action: #selector(buttonShareVC), for: .touchUpInside)
        buttonShare.setTitle("Share", for: .normal)
    }
    
    @objc func buttonShareVC() {
        
        let arrayActivity: [Any] = ["Тест"]
                
        let activityAction = ActivityAction(title: "Моя активити", image: UIImage(named: "smile.jpg")) { arrayActivity in
            print("Привет, Вероника!")
        }
        
        let vc = UIActivityViewController(activityItems: arrayActivity, applicationActivities: [activityAction])
        vc.excludedActivityTypes = [
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.saveToCameraRoll
        ]
        present(vc, animated: true, completion: nil)
    }
}

