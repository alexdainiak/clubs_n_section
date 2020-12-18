//
//  ClubPreView.swift
//  HomePage
//
//  Created by 1 on 17.12.2020.
//

import SwiftUI

struct ClubPreView: View {
    
    struct Data: Identifiable {

        var id: String
        var name: String
        
    }
    
    private var viewData: Data?

    @State private var selectedTab = 0

    var body: some View {
        HStack {
            Image(systemName: "airpods")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 8))
                .foregroundColor(.black)
            
            
            Text(viewData?.name ?? "")
                .foregroundColor(.black)
            
            Spacer()
        }
    }
    
    init(viewData: Data) {
        self.viewData = viewData
    }
}
