//
//  TrainDataSource.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/14/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation

protocol TrainDataSource {
    func trainData() -> [String]
}

struct SpentDataSource : TrainDataSource {
    func trainData() -> [String] {
        return [
            "gотратил","издержал", "израсходовал", "израсходовала",
            "истратил","потратила","потратило","пробил","промотал","промотало",
            "просадил","тратил","подкупил","покупал" ,"прикупил","приобрел","приобретало","раздобыл"
        ]
    }
}

struct RemainingDataSource : TrainDataSource {
    func trainData() -> [String] {
        return [
            "жаловал","заполучил", "заработал", "заслужил",
            "обзавелся","обрел","приобрел",
        ]
    }
}