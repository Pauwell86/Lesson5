//
//  main.swift
//  Lesson5
//
//  Created by Pauwell on 20.03.2021.
//

protocol CarProtocol: class {
    
    var carBrand: String { get }
    var yearOfRelease: Int { get }
    var trunkVolume: Double { get }
    var engineRunning: Bool { get set }
    var windowsIsOpen: Bool { get set }
    
    func printInfo()
}

extension CarProtocol {
    
    func printInfo() {
        print("Марка авто: \(self.carBrand)")
        print("Год выпуска: \(self.yearOfRelease)")
        print("Объем багажника: \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineRunning ? "Запущен" : "Заглушен")")
        print("Положение окон: \(self.windowsIsOpen ? "Открыты" : "Закрыты")")
    }
    
    func changeEgine(value: Bool) {
        engineRunning = value
    }
    
    func changeWindows(value: Bool) {
        windowsIsOpen = value
    }
}

class SportCar: CarProtocol {
    var carBrand: String
    var yearOfRelease: Int
    var trunkVolume: Double
    var engineRunning: Bool
    var windowsIsOpen: Bool
    var hatchIsOpen: Bool
    
    static var carCount = 0
    
    init(carBrand: String,
         yearOfRelease: Int,
         trunkVolume: Double,
         engineRunning: Bool,
         windowsIsOpen: Bool,
         hatchIsOpen: Bool) {
        self.carBrand = carBrand
        self.yearOfRelease = yearOfRelease
        self.trunkVolume = trunkVolume
        self.engineRunning = engineRunning
        self.windowsIsOpen = windowsIsOpen
        self.hatchIsOpen = hatchIsOpen
        SportCar.carCount += 1
    }
    
    static func countInfo(){
        print("Выпущено \(self.carCount) автомобилей")
    }
    
    func hatchIsOpen(value: Bool) {
        hatchIsOpen = value
    }
}

class TruckCar: CarProtocol {
    var carBrand: String
    var yearOfRelease: Int
    var trunkVolume: Double
    var engineRunning: Bool
    var windowsIsOpen: Bool
    var trailerHave: Bool
    
    static var carCount = 0
    
    init(carBrand: String,
         yearOfRelease: Int,
         trunkVolume: Double,
         engineRunning: Bool,
         windowsIsOpen: Bool,
         trailerHave: Bool) {
        self.carBrand = carBrand
        self.yearOfRelease = yearOfRelease
        self.trunkVolume = trunkVolume
        self.engineRunning = engineRunning
        self.windowsIsOpen = windowsIsOpen
        self.trailerHave = trailerHave
        TruckCar.carCount += 1
    }
    
    static func countInfo(){
        print("Выпущено \(self.carCount) грузовиков")
    }
    
    func trailerHave(value: Bool) {
        trailerHave = value
    }
    
}

extension SportCar: CustomStringConvertible {
    var description: String {
        """
            Марка авто: \(carBrand)
            Год выпуска: \(yearOfRelease)
            Объем багажника \(trunkVolume)
            Состояние двигателя: \(engineRunning ? "Запущен" : "Заглушен")
            Положение окон: \(windowsIsOpen ? "Открыты" : "Закрыты")
            Люк: \(hatchIsOpen ? "Открыт" : "Закрыт")
            """
    }
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        """
            Марка авто: \(carBrand)
            Год выпуска: \(yearOfRelease)
            Объем багажника \(trunkVolume)
            Состояние двигателя: \(engineRunning ? "Запущен" : "Заглушен")
            Положение окон: \(windowsIsOpen ? "Открыты" : "Закрыты")
            Прицеп: \(trailerHave ? "Есть" : "Нет")
            """
    }
}
let sportCar1 = SportCar(carBrand: "Honda", yearOfRelease: 2020, trunkVolume: 150, engineRunning: true, windowsIsOpen: false, hatchIsOpen: true)

print(sportCar1)
sportCar1.changeEgine(value: false)
print(sportCar1)

let truckCar1 = TruckCar(carBrand: "MAN", yearOfRelease: 2015, trunkVolume: 1000, engineRunning: false, windowsIsOpen: true, trailerHave: true)

let truckCar2 = TruckCar(carBrand: "KAMAZ", yearOfRelease: 2000, trunkVolume: 1300, engineRunning: true, windowsIsOpen: true, trailerHave: true)


print(truckCar1)
truckCar1.trailerHave(value: false)
print(truckCar1)
print(truckCar2)
TruckCar.countInfo()
truckCar2.printInfo()
