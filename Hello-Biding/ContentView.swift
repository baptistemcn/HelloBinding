//
//  ContentView.swift
//  Hello-Biding
//
//  Created by Baptiste MARCON on 01/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    var model = Dish.all()
    
    
    @State private var isSpicy: Bool = false
    
    var body: some View {
        List {
            
            Toggle(isOn: $isSpicy) {
                Text("Spicy")
                    .font(.title3)
            }
            
            ForEach(model.filter { $0.isSpicy == self.isSpicy}) { dish in
                HStack {
                    Image(dish.imageURL)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text(dish.name)
                        .font(.title3)
                        .lineLimit(nil)
                    
                    Spacer()
                    
                    if(dish.isSpicy) {
                        Image("spicy-icon")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
