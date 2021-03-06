//
//  ViewController.swift
//  PruebaSlideMenuWithLibrary
//
//  Created by Eliana Ferreira on 7/16/15.
//  Copyright (c) 2015 roshka.com. All rights reserved.
//

import UIKit


extension ViewController: MenuViewControllerDelegate {
    func colorSelected(color: String) {
        println("Main: " + color)
    }
}

class ViewController: UIViewController {

    //@IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.purpleColor()
        
        var revealController:SWRevealViewController = self.revealViewController()
        //VERIFICAR agrega el gesture solo al navigationBar por el momento
        self.navigationController?.navigationBar.addGestureRecognizer(revealController.panGestureRecognizer())
        
        var menuButton = UIBarButtonItem(title: "menu", style: UIBarButtonItemStyle.Plain, target: revealController, action: "revealToggle:")
        self.navigationItem.leftBarButtonItem = menuButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

