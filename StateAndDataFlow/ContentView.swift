//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Егор on 02.11.2021.
//

import SwiftUI

struct ContentView: View {
    // Обертки @State
    // 1. State свойства используются только в том случае, если значение свойства должно меняться при взаимодействиии с UI 
    // 2. State свойство должно быть единственным и постоянным для связанным с ним представления
    // 3. Сами State свойства треют обязательной иницииализации
    // 4. Свойства должны быть приватными
//    @State private var tapCount = 0
    
    // MARK: - Timer
    // Экземпляр класса - @StateObject помечается так для того чтобы отслеживать изменения в классе в реальном времени, принцип как у State
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi,  \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 200)
            
            Spacer()
            
            VStack {
            Spacer()
            ButtonView(title: timer.buttonTitle, color: .red) {
                timer.startTimer()
                }
            Spacer()
                ButtonView(title: "Log Out", color: .blue) {
                    DataManager.shared.clear(userManager: userManager)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}



//struct ButtonView: View {
//    // @Binding Свойства - Правила
//    // 1. Binding свойства определяют зависимость от State (родительской)
//    // 2. Не требует инициализации тк это не первичный источник данных, эти переменные будут приинимать значениия где мы их ииниициалиизируем
//    // 3. $ устанавлиивает двухстороннюю связь
//
////    @Binding var tapCount: Int
//
//    // @ObservedObject определяет зависимость от свойств с оберткой @StateObject
//
//    @ObservedObject var timer: TimeCounter
//
//    var body: some View {
//        Button(action: { timer.startTimer() }) {
//            Text(timer.buttonTitle)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//        }
//        .frame(width: 200, height: 60)
//        .background(Color(.red))
//        .cornerRadius(20)
//        .overlay(
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(Color.black, lineWidth: 4)
//        )
//    }
//}
