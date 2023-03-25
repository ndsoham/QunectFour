//
//  Movie.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//

import Foundation
import UIKit
import AVFoundation
import AVKit
import GroupActivities

struct Movie: Hashable, Codable {
    var url: URL
    var title: String
}

struct MovieWatchingActivity: GroupActivity {
    let movie: Movie
    
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.type = .watchTogether
        metadata.fallbackURL = movie.url
        metadata.title = movie.title
        return metadata
    }
}
