//
//  StartViewController.swift
//  WhackAMole
//
//  Created by Ivan Semenov on 23.04.2023.
//

import UIKit
import SnapKit

final class StartViewController: BaseViewController {
    
    var presenter: StartViewPresenter?
    
    private enum Constants {
            enum HeaderImageView {
                static let insetTop: CGFloat = 50
                static let ratioWidth: CGFloat = 0.5
            }
        
            enum MoleImageView {
                static let insetTop: CGFloat = 120
                static let size: CGFloat = 150
            }
            
            enum StartButton {
                static let insetTop: CGFloat = 90
                static let size: CGFloat = 95
                static let borderWidth: CGFloat = 4
                static let cornerRadius: CGFloat = size / 2
            }
    }
    
    private let headerImageView = UIImageView()
    private let moleImageView = UIImageView()
    private let startButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @objc
    private func startButtonHandle() {
        presenter?.didGoToGameScreen()
    }
    
    private func setup() {
        setupSuperView()
        setupHeaderImageView()
        setupMoleImageView()
        setupStartButton()
    }
    
    private func setupSuperView() {
        setBackgroundImage(named: "app-background")
    }
    
    private func setupHeaderImageView() {
        view.addSubview(headerImageView)
        
        let image = UIImage(named: "header-image")
        headerImageView.image = image
        headerImageView.contentMode = .scaleAspectFill
        
        headerImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constants.HeaderImageView.insetTop)
            make.width.equalToSuperview().multipliedBy(Constants.HeaderImageView.ratioWidth)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupMoleImageView() {
        view.addSubview(moleImageView)
        
        moleImageView.image = UIImage(named: "mole-appearing3")
        moleImageView.contentMode = .scaleAspectFit
        
        moleImageView.snp.makeConstraints { make in
            make.top.equalTo(headerImageView.snp.bottom).offset(Constants.MoleImageView.insetTop)
            make.width.height.equalTo(Constants.MoleImageView.size)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupStartButton() {
        view.addSubview(startButton)
        
        startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        startButton.imageView?.layer.transform = CATransform3DMakeScale(2, 2, 2)
        startButton.tintColor = .startButton
        startButton.backgroundColor = UIColor.startButtonBackground
        startButton.layer.cornerRadius = Constants.StartButton.cornerRadius
        startButton.layer.borderWidth = Constants.StartButton.borderWidth
        startButton.layer.borderColor = UIColor.startButton.cgColor
        startButton.addTarget(self, action: #selector(startButtonHandle), for: .touchUpInside)
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(moleImageView.snp.bottom).offset(Constants.StartButton.insetTop)
            make.height.width.equalTo(Constants.StartButton.size)
            make.centerX.equalToSuperview()
        }
    }
}

extension StartViewController: StartView {}
