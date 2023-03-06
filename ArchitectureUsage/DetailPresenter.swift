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

}
