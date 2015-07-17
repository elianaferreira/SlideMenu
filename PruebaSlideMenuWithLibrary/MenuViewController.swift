//
//  MenuViewController.swift
//  PruebaSlideMenuWithLibrary
//
//  Created by Eliana Ferreira on 7/16/15.
//  Copyright (c) 2015 roshka.com. All rights reserved.
//

import UIKit

@objc
protocol MenuViewControllerDelegate {
    func colorSelected(color: String)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var _presentedRow: Int = 0
    
    //var delegate: MenuViewControllerDelegate?
    
    @IBOutlet weak var tableViewOpciones: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewOpciones.delegate = self
        self.tableViewOpciones.dataSource = self
        
        self.tableViewOpciones.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        //configuraciones para el manejo de las vistas frontales y este menu
        var parentRevealController: SWRevealViewController = self.revealViewController()
        
        self.navigationItem.title = "menu"
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        if(indexPath.row == 0){
            cell.textLabel?.text = "purpura"
        } else {
            cell.textLabel?.text = "verde"
        }
        
        return cell
        
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var revealController: SWRevealViewController = self.revealViewController()
        
        var row = indexPath.row
        
        if(row == _presentedRow){
            self.revealViewController().setFrontViewPosition(FrontViewPosition.Left, animated: true)
            return
        }
        
        
        //inicializamos un viewController
        var newFrontViewController = UIViewController()
        if row == 0 {
            //self.delegate?.categorySelected("purpura")
            var purpleViewController = ViewController()
            purpleViewController.colorSelected("purpura")
            newFrontViewController = UINavigationController(rootViewController: purpleViewController)
        } else {
            //self.delegate?.categorySelected("verde")
            var greenViewController = SegundoViewController()
            greenViewController.colorSelected("verde")
            newFrontViewController = UINavigationController(rootViewController: greenViewController)
        }
        
        revealViewController().pushFrontViewController(newFrontViewController, animated: true)
        
        _presentedRow = row
        
    }
    
    
    
}

