//
//  UserInfoDataModel.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/03.
//

import Foundation

struct UserInfoDataModel : Codable {
    let rank: String?
    let leaguePoints: Int?
    let wins: Int?
    let losses: Int?
}
