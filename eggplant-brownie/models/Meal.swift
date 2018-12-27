
import Foundation


class Meal {
    let name:String
    let happiness:Int
    let itens:Array<Item>
    
    init(name:String,happiness:Int, itens: Array<Item> = []) {
        self.name = name;
        self.happiness = happiness;
        self.itens = itens
    }
    
    func allCalories() -> Double {
        var total:Double = 0.0
        for item in self.itens {
            total += item.calories
        }
        
        return total
    }
}
