//
//  TrendingCell.swift
//  YoutubeClone
//
//  Created by Findl MAC on 07/03/2019.
//  Copyright © 2019 Findl MAC. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedinstance.fetchTrendingFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
}
