//
//  SelectCompareViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/26/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class SelectCompareViewController: UIViewController {
    
    @IBOutlet weak var timButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timButton.layer.cornerRadius = 15
        timButton.clipsToBounds = true
        timButton.layer.shadowColor = UIColor.white.cgColor
        timButton.layer.shadowOffset = .zero
        timButton.layer.shadowOpacity = 1
        timButton.layer.shadowRadius = 15
        
    }
    
    @IBAction func searchButton(_ sender: Any) {
        print("Next to compare VC")
//        let nextVC = storyboard?.instantiateViewController(withIdentifier: "compareVC")
//        nextVC!.modalPresentationStyle = .fullScreen
//        present(nextVC!, animated: true, completion: nil)
    }
}
