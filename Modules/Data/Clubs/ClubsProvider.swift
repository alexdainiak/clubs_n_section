//
//  ClubsProvider.swift
//  Data
//
//  Created by 1 on 13.12.2020.
//

import Foundation
import Moya

public class ClubsProvider: MoyaProvider<ClubsTarget> {
    
    public required init() {
        super.init(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    }
}
