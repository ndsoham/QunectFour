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
class PlaybackViewController: UIViewController {
    // properties
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    private var player: AVPlayer?
    var quadrant: String?
    var movie: Movie?
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
extension PlaybackViewController {
    func playVideo() {
        var fileURL: URL?
        switch quadrant {
        case "👑":
            fileURL = movie?.topLeft
            break
        case "2️⃣":
            fileURL = movie?.topRight
            break
        case "3️⃣":
            fileURL = movie?.bottomLeft
            break
        case "4️⃣":
            fileURL = movie?.bottomRight
            break
        default:
            fileURL = nil
        }
        guard let fileURL else {return}
        // create an av player from the data
        player = AVPlayer(url: fileURL)
        // create a new av player view controller and pass in a reference to the player
        let playerController = AVPlayerViewController()
        playerController.player = player
        // hide controls except for master
        if let player {
            self.present(playerController, animated: true) {
                if (self.quadrant == "👑") {
                    playerController.showsPlaybackControls = true
                    let _ = player.observe(\.rate) { player, value in
                        print(value)
                    }
                    self.play()
                } else {
                    playerController.showsPlaybackControls = false
                }
                self.listen(player: player)
            }
        }
    }
}
//MARK: - Query the data base
extension PlaybackViewController {
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
    // change the
    @objc func pause() {
        self.ref.setValue(["play": false, "timestamp":0])
    }
}

//MARK: - Setup UI
extension PlaybackViewController {
    func setupUI() {
        self.view.backgroundColor = .black
    }
}
