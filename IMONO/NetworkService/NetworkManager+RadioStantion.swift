//
//  NetworkManager+RadioStantion.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import Foundation

extension NetworkManager: MoviesNetworkProtocol {
    func reqest(page: APIConstants, complition: @escaping (Result<RadioStation, any Error>) -> Void) {
        let url = URLFactory.urlComponent(page: page)
        self.mainReqest(component: url, complition: complition)
    }
    

}
     
