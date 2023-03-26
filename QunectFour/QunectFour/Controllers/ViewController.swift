//
//  ViewController.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//

import UIKit
import AVKit
import AVFoundation
import Firebase
import FirebaseCore
class ViewController: UIViewController {
    // properties
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    private var playing: Bool = false
    private var timestamp: Double = 0
    private var player: AVPlayer?
    var ref: DatabaseReference {
        return (UIApplication.shared.delegate as! AppDelegate).ref
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
        let currentFile = "SWTop-Right.mp4"
        let fileURL = URL(fileReferenceLiteralResourceName: currentFile)
        
        // create an av player from the data
        player = AVPlayer(url: fileURL)
        // create a new av player view controller and pass in a reference to the player
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = false
        // Modally present the player and call the players play method when complete
        if let player {
            print("im in here")
//            self.present(playerController, animated: true) {
//                if (currentFile == "HPTop-Left.mp4") {
//                    self.play()
//                }
//                self.listen(player: player)
//                playerController.showsPlaybackControls = true
//            }
            player.play()
        }
    }
}
//MARK: - Query the data base
extension ViewController {
    // listen to the database
    func listen(player: AVPlayer) {
        let _ = ref.observe(DataEventType.value) { snapshot in
            if let snapshot = snapshot.value as? [String:Any], let play = snapshot["play"] as? Bool {
                if play {
                    player.play()
                } else {
                    player.pause()
                }
            }
        }
    }
    // change the database value
    func play() {
        let post: [String:Any] = [
            "play":true,
            "timestamp":0
        ]
        ref.updateChildValues(post)
        
        self.ref.setValue(["play": true, "timestamp":0])
    }
    func pause() {
        self.ref.setValue(["play": false, "timestamp":0])
    }
}

//MARK: - Setup UI
extension ViewController {
    func setupUI() {
        self.view.backgroundColor = .red
    }
}
