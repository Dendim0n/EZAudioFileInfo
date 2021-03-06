//
//  EZAudioFileInfo.swift
//  EZAudioFileInfo
//
//  Created by 任岐鸣 on 2016/11/18.
//  Copyright © 2016年 Ned. All rights reserved.
//

import UIKit
import AVFoundation

class EZAudioFileInfo: NSObject {
    
    var asset:AVAsset?
    var filePath:String?
    var fileLoaded = false
    var placeHolderImage:UIImage?
    var fileUrl:URL {
        get {
            return URL.init(fileURLWithPath: self.filePath!)
        }
    }
    
    func loadFile(_ path:String) {
        filePath = path
        asset = AVAsset.init(url: fileUrl)
        fileLoaded = true
    }
    
    func getTitle() -> String {
        guard fileLoaded else {
            return ""
        }
        let tmpAsset = asset!
        for format in tmpAsset.availableMetadataFormats {
            let metaData = tmpAsset.metadata(forFormat: format)
            for metaDataItem in metaData {
                if metaDataItem.commonKey == "title" {
                    return metaDataItem.stringValue!
                }
            }
        }
        return ""
    }
    func getAlbum() -> String {
        guard fileLoaded else {
            return ""
        }
        let tmpAsset = asset!
        for format in tmpAsset.availableMetadataFormats {
            let metaData = tmpAsset.metadata(forFormat: format)
            for metaDataItem in metaData {
                if metaDataItem.commonKey == "albumName" {
                    return metaDataItem.stringValue!
                }
            }
        }
        return ""
    }
    func getArtist() -> String {
        guard fileLoaded else {
            return ""
        }
        let tmpAsset = asset!
        for format in tmpAsset.availableMetadataFormats {
            let metaData = tmpAsset.metadata(forFormat: format)
            for metaDataItem in metaData {
                if metaDataItem.commonKey == "artist" {
                    return metaDataItem.stringValue!
                }
            }
        }
        return ""
    }
    func getArtwork() -> UIImage {
        guard fileLoaded else {
            if placeHolderImage != nil {
                return placeHolderImage!
            }
            return UIImage.init()
        }
        let tmpAsset = asset!
        let metaData = tmpAsset.metadata(forFormat: tmpAsset.availableMetadataFormats[0])
        for metaDataItem in metaData {
            if metaDataItem.commonKey == "artwork" {
                return UIImage.init(data: metaDataItem.dataValue!)!
            }
        }
        if placeHolderImage != nil {
            return placeHolderImage!
        }
        return UIImage.init()
    }
    func getDuration() -> String {
        guard fileLoaded else {
            return ""
        }
        let tmpAsset = asset!
        let second = Double(tmpAsset.duration.value) / Double(tmpAsset.duration.timescale)
        
        return "\(Int(floor(second/60.0))):\(Int(second) % 60)"
    }
    func getData() -> Data {
        return NSData.init(contentsOf: fileUrl) as! Data
    }
    
}
