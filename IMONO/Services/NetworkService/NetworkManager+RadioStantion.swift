//
//  NetworkManager+RadioStantion.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import Foundation

extension NetworkManager: RadioStationProtocol {
    func reqest(complition: @escaping (Result<[RadioStation], Error>) -> Void) {
        let url = URLFactory.urlComponent()
        self.mainRequest(component: url, complition: complition)
    }
}
     
