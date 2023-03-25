//
//  ViewController.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    // properties
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }
}
//MARK: - Play the video
extension ViewController {
    func playVideo() {

        let fileURL = URL(fileReferenceLiteralResourceName: "Top-Left.mp4")
        // create an av player from the data
        let player = AVPlayer(url: fileURL)
        // create a new av player view controller and pass in a reference to the player
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = false
        // Modally present the player and call the players play method when complete
        self.present(playerController, animated: true) {
            print("im in here")
            player.play()
            playerController.showsPlaybackControls = true
        }
    }
}
//MARK: - Try to crop the video
//extension ViewController {
//    func cropVideo() {
//        let videoAsset: AVAsset = AVAsset(url: URL(fileReferenceLiteralResourceName: "Harry Potter and the Deathly Hallows_ Part 2 (5_5) Movie CLIP - Harry vs. Voldemort (2011) HD.mp4"))
//        let clipVideoTrack = videoAsset.tracks(withMediaType: AVMediaType).first as AVAssetTrack
//
//
//    }
//}
//MARK: - Setup UI
extension ViewController {
    func setupUI() {
        self.view.backgroundColor = .red
    }
}
