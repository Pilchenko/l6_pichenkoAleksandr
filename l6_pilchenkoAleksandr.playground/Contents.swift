import Cocoa

class Car {
    let marka: String
    let model: String
    let yearMaking: Int
    
    init(marka: String, model: String, yearMaking: Int) {
        self.marka = marka
        self.model = model
        self.yearMaking = yearMaking
    }
}

extension Car {
    var description: String {
        """
        Марка: \(marka).
        Модель: \(model).
        Год выпуска: \(yearMaking)
        ----------
        """
    }
}

struct Queue<L> {
    
    private var elements: [L] = []
    
    func filter(predicate:(L) -> Bool) -> [L] {
        var tempArray: [L] = []
        for element in elements {
            if predicate(element) {
                tempArray.append(element)
            }
        }
        return tempArray
    }
    
    mutating func push (_ element: L) {
        elements.append(element)
    }
    
    mutating func pop() -> L? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}

extension Queue {
    
    subscript(index: Int) -> L? {
        guard index >= 0 && index < elements.count else {
            return nil
        }
        return elements[index]
    }
}

var cars = Queue<Car>()

cars.push(Car(marka: "Ford", model: "Bronco", yearMaking: 2021))
cars.push(Car(marka: "Honda", model: "Civic", yearMaking: 2001))
cars.push(Car(marka: "Ferrari", model: "458 Spider", yearMaking: 2019))
cars.push(Car(marka: "BMW", model: "5", yearMaking: 2017))

var filterCar = cars.filter() { element in element.yearMaking > 2010 }
filterCar.forEach { print($0.description) }


