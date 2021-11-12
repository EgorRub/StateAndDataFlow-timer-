//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Егор on 02.11.2021.
//

import Combine
    // Класс который управляет данными, не сохранением А САМИМИ ДАННЫМИ
// Published используется для того, чтобы зависить от одно конкретного свойтсва (в завиисимости от него уже и строить UI)
// Всякий раз когда обертка Published будет применять новое свойство все представлениия будут перегруженны в соответствии с новыми данными
// Инициализируем экземпляр модели
final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
