//
//  LoadViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/29/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class LoadViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    
    var countDown: Double = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    private func setupView() {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "LoadingVideo", ofType: "mov")!)
        let player = AVPlayer(url: path)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidPlayToEnd(_:)), name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem)
    }
    
    @objc func videoDidPlayToEnd(_ notification: Notification) {
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        // player.seek(to: CMTime.zero)
//        let nextVC = HomeViewController()
      //  nextVC.modalPresentationStyle = .fullScreen
//        self.present(nextVC, animated: true, completion: nil)
        
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "homeVC")
        homeVC!.modalPresentationStyle = .fullScreen
        
        present(homeVC!, animated: true, completion: nil)
        
    }
}
