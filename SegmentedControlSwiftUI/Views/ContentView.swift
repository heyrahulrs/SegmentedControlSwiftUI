//
//  ContentView.swift
//  SegmentedControlSwiftUI
//
//  Created by Rahul Sharma on 05/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 0
    
    var items: [String] = [
        "Years",
        "Months",
        "Days",
        "All Photos"
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(
                colors: [.blue, .green, .yellow, .red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            SegmentedControl(
                items: items,
                selectedIndex: $selectedIndex
            )
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
