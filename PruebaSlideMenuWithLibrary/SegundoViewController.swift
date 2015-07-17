//
//  SegundoViewController.swift
//  PruebaSlideMenuWithLibrary
//
//  Created by Eliana Ferreira on 7/16/15.
//  Copyright (c) 2015 roshka.com. All rights reserved.
//

import UIKit

extension SegundoViewController: MenuViewControllerDelegate {
    func colorSelected(color: String) {
        println("Segundo: " + color)
    }
}

class SegundoViewController: UIViewController {
    
    //@IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.greenColor()
        
        var revealController: SWRevealViewController = self.revealViewController()
        self.navigationController?.navigationBar.addGestureRecognizer(revealController.panGestureRecognizer())
        
        var menuButton = UIBarButtonItem(title: "menu", style: UIBarButtonItemStyle.Plain, target: revealController, action: "revealToggle:")
        self.navigationItem.leftBarButtonItem = menuButton
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

