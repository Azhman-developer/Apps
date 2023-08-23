//
//  MainCoordinator.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = VideListViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}


extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let sourceController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
    
        if navigationController.viewControllers.contains(sourceController) {
            return
        }
        
        //        if let vc = sourceViewController as? vc type {
        //            childDidFinish(vc.coordinator)
        //        }
    }
}
