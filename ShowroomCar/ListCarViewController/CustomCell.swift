//
//  CustomCell.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/29/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    } ()
    
    let imageCar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    } ()
    
    let nameCarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size: 24)
        return label
    } ()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupCell()
        
        }
    
    func setupCell () {
        self.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        containerView.addSubview(imageCar)
        imageCar.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 90).isActive = true
        imageCar.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
       // imageCar.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        imageCar.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageCar.heightAnchor.constraint(equalToConstant: 160).isActive = true

        containerView.addSubview(nameCarLabel)
        nameCarLabel.centerYAnchor.constraint(equalTo: imageCar.centerYAnchor, constant: 0).isActive = true
        nameCarLabel.leftAnchor.constraint(equalTo: imageCar.rightAnchor, constant: 2).isActive = true
        nameCarLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 12).isActive = true
        
    
    }

}
