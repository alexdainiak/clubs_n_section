//
//  HomePageInput.swift
//  Coordinators
//
//  Created by 1 on 15.12.2020.
//

import SwiftUI
import Domain

public protocol HomePageInput {
    
    var tabBarTitle: Text { get }
    var tabBarIcon: Image { get }
    var clubDetailsViewCombiner: ((_ club: Club) -> AnyView)? { get set }
    
}
