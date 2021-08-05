//
//  ViewController.swift
//  DemotivatorApp
//
//  Created by Алена on 02.08.2021.
//

import UIKit

final class ViewController: UIViewController, UINavigationControllerDelegate {
    
    private let bounds = UIScreen.main.bounds
    private let demotivator = UIView()
    private let buttonImage = UIButton()
    private let imageView = UIImageView()
    private let textField = UITextField()
    private let labelFilter = UILabel()
    private let buttonFilterSepia = UIButton()
    private let buttonFilterBW = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        setupViewImage()
        setupFilterButton()
        setupNavigation()
    }
    
    private func setupViewImage() {
        view.addSubview(demotivator)
        demotivator.addSubview(buttonImage)
        demotivator.addSubview(textField)
        demotivator.addSubview(imageView)
        
        demotivator.frame = CGRect(x: bounds.width / 2 - 175, y: bounds.height / 2 - 256, width: 350, height: 450)
        demotivator.backgroundColor = .black
        
        buttonImage.frame = CGRect(x: demotivator.bounds.minX + 50, y: demotivator.bounds.minY + 30, width: 250, height: 300)
        imageView.frame = CGRect(x: demotivator.bounds.minX + 50, y: demotivator.bounds.minY + 30, width: 250, height: 300)
        textField.frame = CGRect(x: demotivator.bounds.minX + 50, y: demotivator.bounds.maxY - 90, width: 250, height: 50)
        
        buttonImage.backgroundColor = .white
        buttonImage.setTitle("Добавьте фото", for: .normal)
        buttonImage.setTitleColor(.darkGray, for: .normal)
        buttonImage.addTarget(self, action: #selector(buttonImagePressed), for: .touchUpInside)
        
        imageView.alpha = 0
        
        textField.attributedPlaceholder = NSAttributedString(string: "Введите текст..", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .white
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)
        
    }
    
    private func setupFilterButton() {
        view.addSubview(labelFilter)
        view.addSubview(buttonFilterSepia)
        view.addSubview(buttonFilterBW)
        
        labelFilter.frame = CGRect(x: bounds.width / 2 - 150, y: demotivator.frame.maxY + 15, width: 300, height: 30)
        buttonFilterSepia.frame = CGRect(x: demotivator.frame.minX, y: demotivator.frame.maxY + 55, width: 150, height: 70)
        buttonFilterBW.frame = CGRect(x: demotivator.frame.maxX - 150, y: demotivator.frame.maxY + 55   , width: 150, height: 70)
        
        labelFilter.text = "Примените фильтры"
        labelFilter.textColor = .darkGray
        labelFilter.textAlignment = .center
        
        buttonFilterSepia.backgroundColor = .white
        buttonFilterSepia.layer.cornerRadius = 25
        buttonFilterSepia.setTitle("Сепия", for: .normal)
        buttonFilterSepia.setTitleColor(.darkGray, for: .normal)
        buttonFilterSepia.addTarget(self, action: #selector(buttonFilterSepiaPressed), for: .touchUpInside)
        
        
        buttonFilterBW.backgroundColor = .white
        buttonFilterBW.layer.cornerRadius = 25
        buttonFilterBW.setTitle("Ч/Б", for: .normal)
        buttonFilterBW.setTitleColor(.darkGray, for: .normal)
        buttonFilterBW.addTarget(self, action: #selector(buttonFilterBWPressed), for: .touchUpInside)
        
    }
    
    private func setupNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
    }
    
    
    @objc func buttonImagePressed() {
        let alertController = UIAlertController(title: "", message: "Добавить фото", preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction(title: "Камера", style: .default) {[weak self] (_) in
            self?.showImagePicker(selecterSourse: .camera)
        }
        let galleryButton = UIAlertAction(title: "Галерея", style: .default) {[weak self] (_) in
            self?.showImagePicker(selecterSourse: .photoLibrary)
        }
        let cancelButton = UIAlertAction(title: "Закрыть", style: .cancel) { (_) in
            print("закрыть")
        }
        alertController.addAction(cameraButton)
        alertController.addAction(galleryButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func buttonFilterSepiaPressed() {
        let inputImage = imageView.image!
        let context = CIContext(options: nil)
        
        if let currentFilter = CIFilter(name: "CISepiaTone") {
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            currentFilter.setValue(0.8, forKey: kCIInputIntensityKey)
            
            if let output = currentFilter.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    imageView.image = processedImage
                }
            }
        }
    }
    
    @objc func buttonFilterBWPressed() {
        let inputImage = imageView.image!
        let beginImage = CIImage(image: inputImage)
        
        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(beginImage, forKey: "inputImage")
        
        filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")
        
        filter?.setValue(1.0, forKey: "inputIntensity")
        guard let outputImage = filter?.outputImage else { return }
        
        let context = CIContext()
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            imageView.image = processedImage
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @objc func shareImage() {
        let arrayActivity: [UIImage] = [demotivator.asImage()]
        
        let vc = UIActivityViewController(activityItems: arrayActivity, applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    func showImagePicker(selecterSourse: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selecterSourse) else {
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selecterSourse
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.imageView.alpha = 1
                self.buttonImage.isHidden = true
                self.imageView.image = image
            }
        } else {
            print("Фото не выбрано")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

private extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
