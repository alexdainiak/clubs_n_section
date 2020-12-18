//
//  HomePageCoordinator.swift
//  Coordinators
//
//  Created by __ on 14/13/20.
//

import SwiftUI
import Coordinator
import HomePage
import Domain
import Data

class HomePageCoordinator: AssemblyCoordinator<Void> {
    
    var tabBarData: ApplicationCoordinator.TabBarSection?
    
    public override func assemblies() -> [Assembly] {
        [
            HomePageModuleAssembly(),
            ClubsDataAssembly()
        ]
    }
    
    public override func start() {
        let module = resolver.resolve(HomePageModule.self)!
        
        module.input.clubDetailsViewCombiner = { club in
            .init(Text("\(club.name) детальки и все такое"))
        }
        
        tabBarData = .init(
            itemTitle: module.input.tabBarTitle,
            itemIcon: module.input.tabBarIcon,
            view: module.view
        )
    }
    
}
