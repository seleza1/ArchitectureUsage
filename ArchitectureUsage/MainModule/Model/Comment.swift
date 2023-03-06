//
//  Comment.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String 
}
