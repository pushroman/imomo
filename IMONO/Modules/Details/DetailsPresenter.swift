//
//  DetailsPresenter.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import UIKit


//// MARK: - View Protocol
//protocol MainMovieDitailViewProtocol: AnyObject {
//    func showMovies(movie: Movies?)
//}
//
//// MARK: - Presenter Protocol
//protocol MainMovieDetailPresenterProtocol: AnyObject {
//    init (view: MainMovieDitailViewProtocol, networkService: NetworkManager, movie: Movies?)
//    func setMovies()
//}
//
//// MARK: - Реализация протоколов
//class MainMovieDetailPresenter: MainMovieDetailPresenterProtocol {
//    private weak var view: MainMovieDitailViewProtocol?
//        private let networkService: NetworkManager
//        var movie: Movies?
//    
//    required init(view: any MainMovieDitailViewProtocol, networkService: NetworkManager, movie: Movies?) {
//        self.view = view
//        self.networkService = networkService
//        self.movie = movie
//    }
//    
//   public func setMovies() {
//       self.view?.showMovies(movie: movie)
//    }
//
//}
