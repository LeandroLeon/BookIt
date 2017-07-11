//
//  SettingsViewController.swift
//  BookIt
//
//  Created by Laura on 30/6/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Funciones del Delegado
    
    // Dar formato a las cabeceras
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = UIColor.cyan
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        label.text = String.init(format: "Section %d", section)
        view.addSubview(label)
        return view
    }
    // Altura de las cabeceras
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // Que pasa cuando seleccionas una celda X en una seccion Y
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
    //MARK: - Funciones del DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
