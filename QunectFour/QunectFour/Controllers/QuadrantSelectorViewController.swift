//
//  QuadrantSelectorViewController.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//

import Foundation
import UIKit
import Firebase
class QuadrantSelectorViewController: UIViewController {
    // attributes
    var movie: Movie?
    private var safeMargins: UILayoutGuide?
    private var collectionView: UICollectionView?
    private var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
    var ref: DatabaseReference {
        return (UIApplication.shared.delegate as! AppDelegate).ref
    }
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // layout subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    // setup ui
    func setupUI() {
        safeMargins = self.view.safeAreaLayoutGuide
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        if let collectionView {
            self.view.addSubview(collectionView)
            collectionView.register(OrientationCollectionViewCell.self, forCellWithReuseIdentifier: OrientationCollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        
        }
        
    }
}

extension QuadrantSelectorViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.quadrants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrientationCollectionViewCell.identifier, for: indexPath) as! OrientationCollectionViewCell
        cell.quadrant = Constants.quadrants[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let toVC = PlaybackViewController()
        toVC.quadrant = Constants.quadrants[indexPath.row]
        toVC.movie = self.movie
        setPlayingToFalseByDefault()
        navigationController?.pushViewController(toVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2, height: self.view.frame.height/3)
    }
    func setPlayingToFalseByDefault() {
        self.ref.setValue(["play": false, "timestamp":0])
    }
    
}
