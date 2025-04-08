//
//  DetailsPresenter.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import UIKit

// MARK: - View Protocol
protocol DetailsViewProtocol: AnyObject {
    func success() // данные пришли
    func failure(error: Error) // ошибка
}

// MARK: - Presenter Protocol
protocol MainDitailsPresenterProtocol: AnyObject {
    init (view: DetailsViewProtocol, networkService: NetworkManager)
    var radioStations: [RadioStation] { get set }
    var selectedRadio: RadioStation? { get set }
    func setRadio()
}

// MARK: - Реализация протоколов
class MainDetailPresenter: MainDitailsPresenterProtocol {

    private weak var view: DetailsViewProtocol?
        private let networkService: NetworkManager
        var radioStations: [RadioStation] = []
        var selectedRadio: RadioStation?
    
    required init(view: any DetailsViewProtocol, networkService: NetworkManager) {
        self.view = view
        self.networkService = networkService

    }
    
   public func setRadio() {
       networkService.reqest { [weak self] result in
           guard let self = self else { return }
           
           DispatchQueue.main.async {
               switch result {
               case .success(let response):
                   self.radioStations.append(contentsOf: response)
                   self.view?.success()
                   
               case .failure(let error):
                self.view?.failure(error: error)
               }
           }
       }
    }
}
