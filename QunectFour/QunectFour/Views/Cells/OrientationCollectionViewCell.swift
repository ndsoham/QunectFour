//
//  OrientationCollectionViewCell.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//

import UIKit

class OrientationCollectionViewCell: UICollectionViewCell {
    var quadrant: Int?
    private var label: UILabel = UILabel()
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
        setupUI()
    }
    // setup ui
    func setupUI() {
        
    }
    
}
