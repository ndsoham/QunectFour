//
//  Constants.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//

import Foundation
import UIKit

struct Constants {
    static let movies: [Movie] = [
    Movie(url: URL(fileReferenceLiteralResourceName: "Star Wars_ Revenge of the Sith - Obi Wan vs Anakin Fight Part 1 4k.mp4"), title: "Star Wars - Revenge of the Sith", topLeft: URL(fileReferenceLiteralResourceName: "SWTop-Left.mp4"), topRight: URL(fileReferenceLiteralResourceName: "SWTop-Right.mp4"), bottomLeft: URL(fileReferenceLiteralResourceName: "SWBottom-Left.mp4"), bottomRight: URL(fileReferenceLiteralResourceName: "SWBottom-Right.mp4"), thumbnail: UIImage(named: "SW-Thumbnail")),
    Movie(url: URL(fileReferenceLiteralResourceName: "The Fast and the Furious (2001) - Chasing the Killers Scene (9_10) _ Movieclips.mp4"), title: "The Fast and the Furious (2001)", topLeft: URL(fileReferenceLiteralResourceName: "FFTop-Left.mp4"), topRight: URL(fileReferenceLiteralResourceName: "FFTop-Right.mp4"), bottomLeft: URL(fileReferenceLiteralResourceName: "FFBottom-Left.mp4"), bottomRight: URL(fileReferenceLiteralResourceName: "FFBottom-Right.mp4"), thumbnail: UIImage(named: "FF-Thumbnail")),
    Movie(url: URL(fileReferenceLiteralResourceName: "Harry Potter and the Deathly Hallows_ Part 2 (5_5) Movie CLIP - Harry vs. Voldemort (2011) HD.mp4"), title: "Harry Potter and the Deathly Hallows Part 2", topLeft: URL(fileReferenceLiteralResourceName: "HPTop-Left.mp4"), topRight: URL(fileReferenceLiteralResourceName: "HPTop-Right.mp4"), bottomLeft: URL(fileReferenceLiteralResourceName: "HPBottom-Left.mp4"), bottomRight: URL(fileReferenceLiteralResourceName: "HPBottom-Right.mp4"), thumbnail: UIImage(named: "HP-Thumbnail"))
    ]
    static let quadrants: [String] = ["👑","2️⃣","3️⃣","4️⃣"]
}
