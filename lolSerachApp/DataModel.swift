//
//  DataModel.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/02.
//

import Foundation

struct DataModel : Codable {
    let id: String?
    let name: String?
    let summonerLevel: Int?
    var rank: String?
    var leaguePoints: Int?
    var wins: Int?
    var losses: Int?
}
