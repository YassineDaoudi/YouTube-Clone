//
//  Video.swift
//  YoutubeClone
//
//  Created by Findl MAC on 05/03/2019.
//  Copyright © 2019 Findl MAC. All rights reserved.
//

import UIKit


class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    
    var channel: Channel?
    
    
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
