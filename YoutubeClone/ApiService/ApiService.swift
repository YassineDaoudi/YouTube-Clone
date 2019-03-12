//
//  ApiService.swift
//  YoutubeClone
//
//  Created by Findl MAC on 07/03/2019.
//  Copyright © 2019 Findl MAC. All rights reserved.
//

import UIKit

class ApiService: NSObject {

    static let sharedinstance = ApiService()
    
    
    func fetchVideo (completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForRessourceString(ressourceString: "home") { (videos) in
            completion(videos)
        }
    }
    
    
    
    func fetchTrendingFeed (completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForRessourceString(ressourceString: "trending") { (videos) in
            completion(videos)
        }
    }
    
    
    func fetchSubscriptionFeed (completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForRessourceString(ressourceString: "trending") { (videos) in
            completion(videos)
        }
    }
    
    func fetchFeedForRessourceString(ressourceString: String, completion: @escaping ([Video]) -> ()) {
        
        
        if let path = Bundle.main.path(forResource: ressourceString , ofType: "json") {
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                
                var videos = [Video]()
                
                for dictionary in jsonResult as! [[String: AnyObject]] {
                    
                    
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                   
                   /// video.setValuesForKeys(<#T##keyedValues: [String : Any]##[String : Any]#>)
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    
                    video.channel = channel
                    videos.append(video)
                    
                    
                }
                
                DispatchQueue.main.async {
                    completion(videos)
                }
                
                
            } catch let jsonError{
                // handle error
                print(jsonError)
            }
        }
        
        }
        
        
        
    
    
    
    
}
