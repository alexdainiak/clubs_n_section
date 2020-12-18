//
//  SecondSectionCoordinator.swift
//  Coordinators
//
//  Created by __ on 14/13/20.
//

import SwiftUI
import Coordinator

class SecondSectionCoordinator: AssemblyCoordinator<Void> {
    
    // MARK: - Nested types
    
    private enum Consts {
        static let tabBarTitle: String = "Избранное"
        static let tabBarIcon: Image = Image("")
    }
    
    var tabBarData: ApplicationCoordinator.TabBarSection {
        ApplicationCoordinator.TabBarSection(
            itemTitle: Text(Consts.tabBarTitle),
            itemIcon: Consts.tabBarIcon,
            view: view
        )
    }
    
    var view: AnyView {
        AnyView(Text("Tab 1"))
    }
    
    public override func assemblies() -> [Assembly] {
        [
        ]
    }
    
    public override func start() {
    }
    
}
