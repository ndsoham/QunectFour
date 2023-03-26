//
//  OrientationCollectionViewCell.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//

import UIKit

class OrientationCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "OrientationCollectionViewCell"
    var quadrant: String?
    private var label: UILabel = UILabel()
    private var safeMargins: UILayoutGuide?
    // inits
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // prepare for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    // layout subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        if let quadrant {
            setupUI(quad: quadrant)
        }
    }
    // setup ui
    func setupUI(quad: String) {
        safeMargins = self.contentView.safeAreaLayoutGuide
        if let safeMargins {
            label.translatesAutoresizingMaskIntoConstraints = false
            let attributes: [NSAttributedString.Key:Any] = [
                .font:UIFont.systemFont(ofSize: 50)
            ]
            let attributedText: NSAttributedString = NSAttributedString(string: quad, attributes: attributes)
            label.attributedText = attributedText
            self.contentView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: safeMargins.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: safeMargins.centerYAnchor).isActive = true
        }
    }
    
}
