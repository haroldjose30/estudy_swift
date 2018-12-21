
import Foundation


class Meal {
    let name:String
    let happiness:Int
    let itens = Array<Item>()
    
    init(name:String,happiness:Int) {
        self.name = name;
        self.happiness = happiness;
    }
    
    func allCalories() -> Double {
        var total:Double = 0.0
        for item in self.itens {
            total += item.calories
        }
        
        return total
    }
}
