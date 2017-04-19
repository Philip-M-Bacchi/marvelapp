//
//  CharacterViewController.swift
//  Marvel
//
//  Created by Thiago Lioy on 14/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit
import RxSwift
import SwiftIconFont

final class CharacterViewController: UIViewController {
    let characterView = CharacterView()
    let viewModel: CharacterDetailsViewModel
    
    init(viewModel: CharacterDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = characterView
    }
}

extension CharacterViewController: SceneControllerType {}

extension CharacterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        characterView.setup(with: viewModel.character)
        setupBackNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = viewModel.character.name
    }
}
