//
//  ViewController.swift
//  Animation
//
//  Created by Алена on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let bottomImage = UIImageView()
    let rocketImage = UIImageView()
    let rocketGoImage = UIImageView()
    let smokeFirstImage = UIImageView()
    let smokeSecondImage = UIImageView()
    let buttonGo = UIButton()
    let bounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeViews()
        setupViews()
    }
    
    func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(rocketGoImage)
        view.addSubview(bottomImage)
        view.addSubview(rocketImage)
        view.addSubview(smokeFirstImage)
        view.addSubview(smokeSecondImage)
        view.addSubview(buttonGo)
    }
    
    func makeViews() {
        imageView.image = UIImage(named: "image.png")
        
        rocketGoImage.image = UIImage(named: "rocketGo.png")
        rocketGoImage.alpha = 0
        
        bottomImage.image = UIImage(named: "bottom.png")
        
        rocketImage.image = UIImage(named: "rocket.png")
        
        smokeFirstImage.image = UIImage(named: "smoke.png")
        smokeFirstImage.alpha = 0
        
        smokeSecondImage.image = UIImage(named: "smoke.png")
        smokeSecondImage.alpha = 0
        
        buttonGo.layer.cornerRadius = 20
        buttonGo.backgroundColor = .lightGray
        buttonGo.setTitle("Поехали!", for: .normal)
        buttonGo.addTarget(self, action: #selector(buttonGoPressed), for: .touchDown)
    }
    
    func setupViews() {
        imageView.frame = CGRect(x: 0, y: -353, width: bounds.width, height: bounds.height + 353)
        rocketGoImage.frame = CGRect(x: ((bounds.width / 2) - 79.5), y: bounds.maxY - 128, width: 126.5, height: 932.5)
        bottomImage.frame = CGRect(x: 0, y: bounds.maxY - 133.5, width: bounds.width, height: 133.5)
        rocketImage.frame = CGRect(x: ((bounds.width / 2) - 78), y: bounds.maxY - 128, width: 126.5, height: 75.5)
        smokeFirstImage.frame = CGRect(x: 114, y: bounds.maxY - 108.5, width: 109, height: 110)
        smokeSecondImage.frame = CGRect(x: 134, y: bounds.maxY - 108.5, width: 109, height: 110)
        buttonGo.frame = CGRect(x: ((bounds.width / 2) - 75), y: ((bounds.height / 2) - 70), width: 150, height: 70)
    }
    
    @objc func buttonGoPressed() {
        buttonAnimation()
        emergenceAnimation()
        rocketGoAnimation()
        imageAnimation()
        finishAnimation()
    }
    
    func buttonAnimation() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.5
        buttonGo.layer.add(animation, forKey: "key")
        buttonGo.alpha = 0
    }
    
    func emergenceAnimation() {
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseInOut, animations: {
            self.smokeFirstImage.alpha = 1
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.8, options: .curveEaseInOut, animations: {
            self.smokeSecondImage.alpha = 1
        })
        
        UIView.animate(withDuration: 0.3, delay: 1.2, options: [], animations: {
            self.rocketGoImage.alpha = 1
        })
        
        UIView.animate(withDuration: 0, delay: 1.2, options: .curveEaseInOut, animations: {
            self.rocketImage.alpha = 0
        })
    }
    
    func rocketGoAnimation() {
        let animation = UIViewPropertyAnimator(duration: 6, curve: .linear) {
            self.rocketGoImage.center = CGPoint(x: self.rocketGoImage.center.x, y: -933)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(1.9)), execute: {
        animation.startAnimation()
        })
    }
    
    func imageAnimation() {
        UIView.animate(withDuration: 4, delay: 1, options: .curveEaseInOut, animations: {
            self.imageView.center = CGPoint(x: self.imageView.center.x, y: self.bounds.maxY - 253)
        })
        
        UIView.animate(withDuration: 4, delay: 1, options: .curveEaseInOut, animations: {
            self.bottomImage.center = CGPoint(x: self.bottomImage.center.x, y: self.bounds.maxY + 134)
            self.smokeFirstImage.center = CGPoint(x: self.smokeFirstImage.center.x, y: self.bounds.maxY + 134)
            self.smokeSecondImage.center = CGPoint(x: self.smokeSecondImage.center.x, y: self.bounds.maxY + 134)
        })
    }
    
    func finishAnimation() {
        let animation = CAAnimationGroup()
        
        let animation1 = CABasicAnimation(keyPath: "transform.scale")
        animation1.fromValue = 1
        animation1.toValue = 2
        
        let animation2 = CABasicAnimation(keyPath: "transform.rotation")
        animation2.fromValue = 0
        animation2.toValue = .pi / 10.0
        
        let animationsArray = [animation1, animation2]
        animation.animations = animationsArray
        animation.duration = 3
        animation.beginTime = CACurrentMediaTime() + 6
        self.imageView.layer.add(animation, forKey: "key")
    }
}

