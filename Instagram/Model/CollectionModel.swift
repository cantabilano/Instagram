//
//  CollectionModel.swift
//  Instagram
//
//  Created by Jason Yang on 1/30/24.
//

import Foundation

class CollectionModel {
    var id: Int
    var name: String
    var imageName: String
    
    init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}
