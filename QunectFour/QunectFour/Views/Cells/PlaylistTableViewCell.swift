//
//  PlaylistTableViewCell.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//
import Foundation
import UIKit

class PlaylistTableViewCell: UITableViewCell {
    static var identifier: String = "PlaylistTableViewCell"
    private var thumbnailImageView: UIImageView = UIImageView()
    private var label: UILabel = UILabel()
    var image: UIImage?
    var text: String?
    var safeMargins: UILayoutGuide?
    // inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // prepare for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image = nil
        self.text = nil
    }
    // layout subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        safeMargins = self.contentView.safeAreaLayoutGuide
        if let image, let text, let safeMargins {
            setupUI(image: image, text: text, safeMargins: safeMargins)
        }
    }
    // setup the UI
    func setupUI(image: UIImage, text: String, safeMargins: UILayoutGuide) {
        // set up the image view
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.image = image
        self.contentView.addSubview(thumbnailImageView)
        thumbnailImageView.leadingAnchor.constraint(equalTo: safeMargins.leadingAnchor, constant: 15).isActive = true
        thumbnailImageView.centerYAnchor.constraint(equalTo: safeMargins.centerYAnchor).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        thumbnailImageView.layer.cornerRadius = 15
        thumbnailImageView.clipsToBounds = true
        // set up the label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        self.contentView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 5).isActive = true
        label.centerYAnchor.constraint(equalTo: safeMargins.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: safeMargins.trailingAnchor, constant: -5).isActive = true
        label.numberOfLines = 0
    }
}
