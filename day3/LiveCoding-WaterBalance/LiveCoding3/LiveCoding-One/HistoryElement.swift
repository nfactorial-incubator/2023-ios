//
//  HistoryElement.swift
//  LiveCoding-One
//
//  Created by ablai erzhanov on 08.06.2023.
//

import Foundation


struct HistoryElement: Codable {
    var date: Date
    var dailyIntakes: [DailyIntakeModel]
}

struct DailyIntakeModel: Codable {
    var amount: Int
    var time: String
}
