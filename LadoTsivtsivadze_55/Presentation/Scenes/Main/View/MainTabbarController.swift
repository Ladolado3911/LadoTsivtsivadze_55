//
//  MainTabbarController.swift
//  LadoTsivtsivadze_51
//
//  Created by Ladolado3911 on 12.07.21.
//

import UIKit

class MainTabbarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    var coordinator: CoordinatorProtocol?
    
    private var page1Coordinator = Page1Coordinator()
    private var page2Coordinator = Page2Coordinator()
    private var page3Coordinator = Page3Coordinator()
    private var page4Coordinator = Page4Coordinator()


    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            page1Coordinator.navigationController!,
            page2Coordinator.navigationController!,
            page3Coordinator.navigationController!,
            page4Coordinator.navigationController!
        ]
    }
}
