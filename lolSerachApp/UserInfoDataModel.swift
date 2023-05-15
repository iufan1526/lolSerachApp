//
//  UserInfoDataModel.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/03.
//

import Foundation

struct LeagueDataModel : Codable {
    let rank: String?
    let tier: String?
    let leaguePoints: Int?
    let wins: Int?
    let losses: Int?
}

struct UserInfoDataModel : Codable {
    let userInfo: [LeagueDataModel]
}
