//
//  ViewController.swift
//  HomeWork.2.02.2
//
//  Created by Alexander Shevtsov on 16.03.2024.
//

import UIKit

// не забывать final !!!
final class ViewController: UIViewController {
    
    // свойства и методы по хорошему лучше делать приватными
    @IBOutlet private var redLight: UIView!
    @IBOutlet private var yellowLight: UIView!
    @IBOutlet private var greenLight: UIView!
    
    @IBOutlet private var startButton: UIButton!
    
    private var currentLight = CurrentLight.red // начать с красного
    private let lightIsOn: CGFloat = 1 // не прозрачный, чтоб не писать вручную
    private let lightIsOff: CGFloat = 0.3 // полупрозрачность, чтоб не писать вручную
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10 // скругление кнопки
        
        // выключаем все сигналы, так читабельнее
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
    }
    
    // скругление квадратов
    // вместо присваивания 50 поинтов ширине или высоте, мы делим рамку на 2
    //значения нужно вычислять! не хардкодить!
    //        redLight.layer.cornerRadius = 50
    //        yellowLight.layer.cornerRadius = 50
    //        greenLight.layer.cornerRadius = 50
    
    // метод вызывается до расстановки элементов на экране и знает их размеры
// юзаем только когда нужно знать размеры и подстраивать под разные экраны
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }
    
    @IBAction private func startButtonPressed() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOff
            currentLight = .red
        }
    }
}

// MARK: - CurrentLight     расширения нужно подписывать!
// расширение позволяет расширять функционал любого типа данных не имея доступа
extension ViewController { // расширяем наш класс, add приватный enum
    private enum CurrentLight { // состояние светофора
        case red, yellow, green
    }
}
