//
//  DetailPresenter.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject { //input
    func setComment(comment: Comment)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkService, comment: Comment?)
    func setComment() // output
}

class DetailPresenter: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var comment: Comment?

    required init(view: DetailViewProtocol, networkService: NetworkService, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }

    func setComment() {
        view?.setComment(comment: comment!)
    }
}
