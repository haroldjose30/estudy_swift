
import Foundation


class Meal : NSObject,NSCoding {
    let name:String
    let happiness:Int
    let itens:Array<Item>
    
    init(name:String,happiness:Int, itens: Array<Item> = []) {
        self.name = name;
        self.happiness = happiness;
        self.itens = itens
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.happiness = aDecoder.decodeInteger(forKey: "happiness")
        self.itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happiness, forKey: "happiness")
        aCoder.encode(itens, forKey: "itens")
    }
    
    func allCalories() -> Double {
        var total:Double = 0.0
        for item in self.itens {
            total += item.calories
        }
        
        return total
    }
    
    func details() -> String {
        var message = "Happines: \(self.happiness)"
        for item in self.itens {
            message += "\n \(item.details())"
        }
        return message
    }
}
