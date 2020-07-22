//
//  SupportViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 3/18/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit
import Photos

class SupportViewController: UIViewController {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    } ()
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    } ()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back_white"), for: .normal)
        button.backgroundColor = .black
        return button
    } ()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bạn gặp vấn đề gì ?"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 26)
        return label
    } ()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Gửi", for: .normal)
        return button
    } ()
    
    let botView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    } ()
    
    let reasonTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .black
        tf.placeholder = "Ghi ngắn gọn vấn đề của bạn gặp phải."
        return tf
    } ()
    
    let chooseImageButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        view.setTitle("Chọn ảnh", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        return view
    } ()
    
    let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        return imageView
    } ()
    
    var shapeLayer: CAShapeLayer?
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupView()
        setupButton()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    
    func setupView() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(topView)
        topView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        topView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        topView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.addSubview(botView)
        botView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        botView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        botView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        botView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        topView.addSubview(backButton)
        backButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        backButton.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 12).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        topView.addSubview(topLabel)
        topLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        topLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 14).isActive = true
        
        topView.addSubview(sendButton)
        sendButton.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -12).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        
        botView.addSubview(reasonTF)
        reasonTF.centerXAnchor.constraint(equalTo: botView.centerXAnchor, constant: 0).isActive = true
        reasonTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        reasonTF.widthAnchor.constraint(equalTo: botView.widthAnchor, multiplier: 0.75).isActive = true
        reasonTF.topAnchor.constraint(equalTo: botView.topAnchor, constant: 42).isActive = true
        
        let line = UIBezierPath()
        line.move(to: CGPoint(x: 50, y: 72 ))
        line.addLine(to: CGPoint(x: 350, y: 72))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = line.cgPath
        self.shapeLayer = shapeLayer
        
        botView.layer.addSublayer(shapeLayer)
        
        botView.addSubview(chooseImageButton)
        chooseImageButton.topAnchor.constraint(equalTo: reasonTF.bottomAnchor, constant: 24).isActive = true
        chooseImageButton.centerXAnchor.constraint(equalTo: botView.centerXAnchor, constant: 0).isActive = true
        chooseImageButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func setupButton() {
        
        sendButton.addTarget(self, action: #selector(sendProblem), for: .touchUpInside)
        
        chooseImageButton.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func sendProblem(){
        print("sended")
        let alert = UIAlertController(title: "Thông báo", message: "Đã gửi đến trung tâm hỗ trợ", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .destructive) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    @objc func chooseImage(){
        print("abc")
        botView.addSubview(previewImageView)
        previewImageView.topAnchor.constraint(equalTo: chooseImageButton.bottomAnchor, constant: 20).isActive = true
        previewImageView.leftAnchor.constraint(equalTo: botView.leftAnchor, constant: 12).isActive = true
        previewImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        previewImageView.heightAnchor.constraint(equalToConstant: 380).isActive = true
        
        let alert = UIAlertController(title: "Chọn ảnh từ", message: "", preferredStyle: .actionSheet) //để alert thì thông báo hiện giữa màn
        
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Camera", style: .default) { (_) in
            self.fromCamera()
        }
        let library = UIAlertAction(title: "Thư viện", style: .default) { (_) in
            self.fromLibrary()
        }
        
        alert.addAction(camera)
        alert.addAction(library)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func confirm(message: String, viewController: UIViewController?, success: @escaping () -> Void){
        let alert = UIAlertController(title: "My App", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func setting(){
        let message = "App cần truy cập máy ảnh và thư viện của bạn. Ảnh của bạn sẽ không được chia sẻ khi chưa được phép của bạn."
        confirm(message: message, viewController: self) {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.openURL(settingsUrl)
                } else {
                    UIApplication.shared.openURL(settingsUrl)
                }
            }
        }
    }
    
    private func fromLibrary(){
        func choosePhoto(){
            
            DispatchQueue.main.async {
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                self.imagePicker.modalPresentationStyle = .popover
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        // khai báo biến để lấy quyền truy cập
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == PHAuthorizationStatus.authorized) {
            // quyền truy cập đã được cấp
            choosePhoto()
        }else if (status == PHAuthorizationStatus.denied) {
            // quyền truy cập bị từ chối
            setting()
        }else if (status == PHAuthorizationStatus.notDetermined) {
            // quyền truy cập chưa được xác nhận
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                    choosePhoto()
                }else {
                    print("Không được cho phép truy cập vào thư viện ảnh")
                    self.setting()
                }
            })
        }else if (status == PHAuthorizationStatus.restricted) {
            // Truy cập bị hạn chế, thông thường sẽ không xảy ra
            print("Restricted access")
            setting()
        }
    }
    
    private func fromCamera(){
        func takePhoto(){
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.imagePicker.cameraCaptureMode = .photo
                self.imagePicker.cameraDevice = .front
                self.imagePicker.modalPresentationStyle = .fullScreen
                DispatchQueue.main.async {
                    self.present(self.imagePicker, animated: true,completion: nil)
                }
            }else{
                print("abc")
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Thông báo", message: "Không tìm thấy máy ảnh", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        //Camera
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                takePhoto()
            } else {
                print("camera denied")
                self.setting()
            }
        }
    }
    
}

extension SupportViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("error \(info)")
            return
        }
        if let asset = info[UIImagePickerController.InfoKey.phAsset] as? PHAsset {
            let assetResources = PHAssetResource.assetResources(for: asset)
            
            var nameImage: String?
            nameImage = assetResources.first!.originalFilename
        }
        previewImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}
