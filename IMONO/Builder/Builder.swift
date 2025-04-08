//
//  Builder.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import Foundation
import UIKit


class ModuleBilder: Builder {
    static func modulDetail() -> UIViewController {
        let viewController = DetailsViewController()
        let networkService = NetworkManager()
        let presenter = MainDetailPresenter(view: viewController, networkService: networkService)
        viewController.presenter = presenter
        return viewController
    }
}
