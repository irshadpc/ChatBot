
import Foundation

protocol TrainDataSource {
    func trainData() -> [String]
}

struct SpentDataSource : TrainDataSource {
    func trainData() -> [String] {
        return [
            "потратил","на","еду","истратил","потратила","потратило","пробил","промотал","промотало",
            "просадил","тратил","подкупил","покупал" ,"прикупил","приобрел","приобретало","раздобыл","в","магазин"
        ]
    }
}

struct RemainingDataSource : TrainDataSource {
    func trainData() -> [String] {
        return [
            "жаловал","заполучил", "заработал", "заслужил",
            "обзавелся","обрел","приобрел","получил","денег","вернули","долг","долга","зарплата","пришла","заплатил","заплатили",
            "зарплата","зарплату","деньги",
        ]
    }
}

struct ReportDataSource : TrainDataSource {
    
    func trainData() -> [String] {
        return [
            "сколько", "потратил","отчет", "трачу","потратил","за","покажи","cформируй","дай","отчитайся"
        ]
    }
}

struct StopWordsSource : TrainDataSource {
    func trainData() -> [String] {
        return [
            "привет", "здравствуй","как","дела"
        ]
    }

}
