//
//  ApplicationCoordinator.swift
//  ApplicationCoordinator
//
//  Created by __ on 14/13/20.
//

import SwiftUI
import Coordinator
import TabBar

public class ApplicationCoordinator: RootCoordinator {
    
    struct TabBarSection {
        var itemTitle: Text
        var itemIcon: Image
        var view: AnyView
        
        fileprivate func toTabSection(for number: Int) -> TabSection {
            TabSection(
                title: itemTitle,
                image: itemIcon,
                tag: number,
                view: view
            )
        }
    }
    
    public var tabBarViewController: UIHostingController<TabBarView>?
    
    var homePageCoordinator: HomePageCoordinator!
    var secondSectionCoordinator: SecondSectionCoordinator!
    
    var sectionsData: [TabSection] {
        [
            homePageCoordinator.tabBarData,
            secondSectionCoordinator.tabBarData
        ]
        .enumerated()
        .flatMap( { $0.element?.toTabSection(for: $0.offset) } )
    }
    
    
    public override func assemblies() -> [Assembly] {
        [
            HomePageCoordinatorAssembly(),
            SecondSectionCoordinatorAssembly()
        ]
    }
    
    public override init(assembler: Assembler) {
        
        tabBarViewController = UIHostingController(
            rootView: TabBarView()
        )
        
        super.init(assembler: assembler)
        
    }
    
    public override func start() {
        coordinate(to: homePageCoordinator)
        
        configurateTabBar()
    }
    
    func configurateTabBar() {
        tabBarViewController?.rootView.configure(
            with: sectionsData
        )
    }
    
}
