//
//  ClubDto.swift
//  Data
//
//  Created by 1 on 13.12.2020.
//

import Domain


struct ClubsDto: Decodable {
    
    let data: [ClubDto]
    
}

struct ClubDto: Decodable {
    
    let id: String
    let name: String
    
    var domainModel: Club {
        .init(
            id: id,
            name: name
        )
    }
}

extension ClubsDto {
    
    func asDomain() -> [Club] {
       
        return data.compactMap { $0.domainModel }
    }
}
