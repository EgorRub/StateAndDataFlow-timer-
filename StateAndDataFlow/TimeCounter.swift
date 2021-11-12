//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Егор on 02.11.2021.
//

import Foundation
// Импортируем комбайн чтобы подписать класс под протокол, который будет отслеживать изменения, подпиисываем под ObservableObject
import Combine

class TimeCounter: ObservableObject {
    // Благодаря жэтому свойтсву мы можем следтиь за изменениями в классе, Never-потому что не обрабатываем ошибкиб ObjectWillChange отправляет уведомления об изменениях и какой тип данных будет изменяться, который будет возвращать наш тип лданных (по сути класс наш)
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCounter),
            userInfo: nil,
            repeats: true)
        }
        buttonDidTap()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTap() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        objectWillChange.send(self)
    }
    
}
