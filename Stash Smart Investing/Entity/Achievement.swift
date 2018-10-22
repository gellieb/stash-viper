//
//  Achievement.swift
//  Stash Smart Investing
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import Foundation

struct Achievement: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case level
        case progress
        case total
        case bgImageUrl = "bg_image_url"
        case accessible
    }
    
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let bgImageUrl: String
    let accessible: Bool
    
}
