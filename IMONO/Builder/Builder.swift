//
//  Builder.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

//import Foundation
//
//import UIKit
//
//protocol Builder {
//    static func modulList() -> UIViewController
//    static func modulDetail(movie: Movies?) -> UIViewController
//}
//
//class ModuleBilder: Builder {
//   
//    static func modulList() -> UIViewController {
//        let viewController = MovieListViewController()
//        let networkService = NetworkManager()
//        let presenter = MainMovieListPresenter(view: viewController, networkService: networkService)
//        viewController.presenter = presenter
//        return viewController
//    }
//    
//    static func modulDetail(movie: Movies?) -> UIViewController {
//        let viewController = MovieDetailsViewController()
//        let networkService = NetworkManager()
//        let presenter = MainMovieDetailPresenter(view: viewController, networkService: networkService, movie: movie)
//        viewController.presenter = presenter
//        return viewController
//       }
//}
