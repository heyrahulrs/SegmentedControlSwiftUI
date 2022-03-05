//
//  SegmentedControl.swift
//  SegmentedControlSwiftUI
//
//  Created by Rahul Sharma on 05/03/22.
//

import SwiftUI

struct SegmentedControl: View {
    
    var items: [String]
    
    @Binding var selectedIndex: Int
    
    @Namespace var namespace
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items.indices, id: \.self) { index in
                        Text(items[index])
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .padding(.vertical, 8.0)
                            .matchedGeometryEffect(
                                id: index,
                                in: namespace,
                                isSource: true
                            )
                            .onTapGesture {
                                withAnimation {
                                    selectedIndex = index
                                    proxy.scrollTo(index)
                                }
                            }
                    }
                }
            }
            .clipShape(Capsule())
            .padding(8.0)
            .background {
                Capsule()
                    .fill(Material.regular)
                    .matchedGeometryEffect(
                        id: selectedIndex,
                        in: namespace,
                        isSource: false
                    )
            }
            .background {
                Capsule()
                    .fill(Material.thin)
            }
            .clipShape(Capsule())
        }
    }
    
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl(
            items: ["Years", "Months", "Days", "All Photos"],
            selectedIndex: .constant(1)
        )
    }
}
