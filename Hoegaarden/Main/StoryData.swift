//
//  OthersData.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/07/22.
//

import Foundation

struct OthersData {
    let date: String
    let content: String
}

struct commentData {
    let content: String
}


//func parseCarouselDataFromServer(jsonData: Data) -> [CarouselData]? {
//    do {
//        let decoder = JSONDecoder()
//        let carouselDataList = try decoder.decode([CarouselData].self, from: jsonData)
//        return carouselDataList
//    } catch {
//        print("Error decoding JSON data: \(error)")
//        return nil
//    }
//}
