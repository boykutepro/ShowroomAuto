//
//  ViewController.swift
//  ShowroomCar
//
//  Created by Thiện Tùng on 2/3/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "merBlack")
        image.contentMode = .scaleAspectFill
        
        return image
    } ()
    
    let logo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        
        return image
    } ()
    
    let loadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LOADING..."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    } ()
    
    let goButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Bấm để vào", for: .normal)
        button.titleLabel?.font = UIFont(name: "Hiragino Mincho ProN W3", size: 24)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 1
        button.alpha = 0
        return button
    } ()
    
    var i: Int = 0
    
    weak var shapeLayer: CAShapeLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
        
        drawLoadLine()
        
        UIView.animate(withDuration: 4) {
            self.goButton.alpha = 1
        }
        
        goButton.addTarget(self, action: #selector(goTo), for: .touchUpInside)
    }
    
    @objc func goTo() {
        let nextVC = SelectLanguage()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    func setupLayout() {
        //ContainerView
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        //Background
        containerView.addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: -10).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        //Logo
        containerView.addSubview(logo)
        logo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 64).isActive = true
        logo.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 164).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 222).isActive = true
        //loading
        containerView.addSubview(loadLabel)
        loadLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        loadLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        //button
        view.addSubview(goButton)
        goButton.bottomAnchor.constraint(equalTo: loadLabel.topAnchor, constant: -40).isActive = true
        goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        goButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func drawLoadLine(){
        
        // remove old shape layer if any
        //self.shapeLayer?.removeFromSuperlayer()
        
        // creat whatever path you want
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: view.center.x - 150, y: view.bounds.maxY - 50))
        path1.addLine(to: CGPoint(x: view.center.x + 150, y: view.bounds.maxY - 50))
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: view.center.x - 152, y: view.bounds.maxY - 50))
        path2.addLine(to: CGPoint(x: view.center.x + 152, y: view.bounds.maxY - 50))
        
        // create shape layer for path
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.strokeColor = UIColor.white.cgColor
        shapeLayer1.lineWidth = 4
        shapeLayer1.path = path1.cgPath
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.strokeColor = UIColor.black.cgColor
        shapeLayer2.lineWidth = 4
        shapeLayer2.path = path2.cgPath
        
        // create animation
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.2
        animation.duration = 2
        shapeLayer1.add(animation, forKey: "MyAnimation")
        self.shapeLayer = shapeLayer1
        
        view.layer.addSublayer(shapeLayer2)
        view.layer.addSublayer(shapeLayer1)
        
    }
    
}

