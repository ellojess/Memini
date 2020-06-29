//
//  ButtonGrid.swift
//  Memini
//
//  Created by Jessica Trinh on 6/29/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import SwiftUI

enum ColorButton: String {
    
    case one, two, three, four, five, six, seven, eight, nine
    
    var title: String {
        switch self {
        case .one: return ""
        case .two: return ""
        case .three: return ""
        case .four: return ""
        case .five: return ""
        case .six: return ""
        case .seven: return ""
        case .eight: return ""
        case .nine: return ""
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .one: return Color(.red)
        case .two: return Color(.systemPink)
        case .three: return Color(.orange)
        case .four: return Color(.yellow)
        case .five: return Color(.green)
        case .six: return Color(.systemTeal)
        case .seven: return Color(.blue)
        case .eight: return Color(.systemIndigo)
        case .nine: return Color(.purple)
        }
    }
    
}

// Environment object
class GlobalEnvironment: ObservableObject {
    
    @Published var display = ""
    
    func receiveInput(colorButton: ColorButton) {
//        self.display = colorButton.title
    }
    
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[ColorButton]] = [
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .three]
    ]
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                
                HStack {
                    Spacer()
                    Text(env.display).foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                
                ForEach(buttons, id: \.self) { row in
                    HStack (spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            ColorButtonView(button: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
}

struct ColorButtonView: View {
    
    var button: ColorButton
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        Button(action: {
            self.env.receiveInput(colorButton: self.button)
        }) {
            Text(button.title)
            .font(.system(size: 32))
                .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(self.buttonWidth(button: button))
        }
    }
    
    private func buttonWidth(button: ColorButton) -> CGFloat {
        
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
