//
//  GameProtocols.swift
//  WhackAMole
//
//  Created by Ivan Semenov on 30.04.2023.
//

import Foundation

protocol GameView: AnyObject {
    func displayResultView()
    func hideResultView()
    func updateResultTitle(_ title: String)
    func updateGameScoreTitle(_ title: String)
    func updateResultScoreTitle(_ title: String)
    func refreshCollectionItems(at items: [IndexPath])
    func refreshCollection()
}

protocol GameViewPresenter: AnyObject {
    var numberOfMoles: Int { get }
    var gameProgress: Progress { get }
    
    func viewWillAppear()
    func didTapOnPlayAgain()
    func didTapOnMole(at item: Int)
    func configure(cell: MoleView, forItem item: Int)
}
