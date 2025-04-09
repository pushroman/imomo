//
//  URLFactory.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import Foundation

class URLFactory: urlComponentProtocol {

static func urlComponent() -> URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = APIConstants.URLScheme
        urlComponent.host = APIConstants.URLHost
        urlComponent.path = APIConstants.URLPath
        return urlComponent
    }
}
