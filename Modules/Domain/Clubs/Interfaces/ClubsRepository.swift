//
//  ClubsRepository.swift
//  Domain
//
//  Created by 1 on 12.12.2020.
//

import RxSwift

public protocol ClubsRepository {
    func getClubs(for page: Int) -> Single<[Club]>
}
