//
//  ClubsTarget.swift
//  Data
//
//  Created by 1 on 13.12.2020.
//

import Domain
import Moya
import Network

public enum ClubsTarget {
    case getClubs
}

// MARK: - FirebaseApiTarget extension

extension ClubsTarget: FirebaseApiTarget {
    
    public var path: String {
        switch self {
        case .getClubs:
            return "clubs.json"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getClubs:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .getClubs:
            return .requestPlain
        }
    }
}
