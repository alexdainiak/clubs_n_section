//
//  TabBarView.swift
//  Coordinators
//
//  Created by 1 on 14.12.2020.
//

import SwiftUI

public struct TabBarView: View {
    private var tabSections: [TabSection] = []

    @State private var selectedTab = 0

    public var body: some View {

        TabView(selection: $selectedTab) {

            ForEach(tabSections) { section in
                 section.view
                    .tabItem {
                        section.title
                        section.image
                }.tag(section.tag)
            }
            
        }

    }
    
    public init() {}
    
    public mutating func configure(with sections: [TabSection]) {
        self.tabSections = sections
    }
}

public struct TabSection: Identifiable {
    public typealias ID = String
    
    public var id: String
    public var title: Text
    public var image: Image
    public var tag: Int
    public var view: AnyView
    
    public init(
        title: Text,
        image: Image,
        tag: Int,
        view: AnyView
    ) {
        self.title = title
        self.image = image
        self.tag = tag
        self.view = view
        id = "\(tag)"
    }
}
