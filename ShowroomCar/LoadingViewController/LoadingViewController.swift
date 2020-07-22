//
//  LoadingViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/29/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class LoadingViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let path = Bundle.main.path(forResource: "LoadingVideo", ofType: "mov") else {return}
        let videoURL = URL(fileURLWithPath: path)
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
