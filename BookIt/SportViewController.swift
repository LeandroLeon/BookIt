//
//  ViewController.swift
//  BookIt
//
//  Created by Laura on 28/6/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

import UIKit


class SportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        var controler = PersistenceController()
        controler.initializeData()
        //self.tableView.reloadData() // Recarga la tabla
        self.tableView.separatorColor = UIColor.white
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - SegueSetting Fire
    
    @IBAction func segueSettingFire(){
        performSegue(withIdentifier: "SegueToSettings", sender: nil)
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
        let result = String.init(format: "Soy la celda %d, de la seccion %d", indexPath.row, indexPath.section)
        self.tableView.deselectRow(at: indexPath, animated: true)
        print(result)

    }

    
    //MARK: - Funciones del DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportCell") as! SportTableViewCell
        
        cell.sportName.text = String.init("futbol")
        cell.sportName.textColor = UIColor.white
        cell.price.text = String.init(format: "%2.2lf €/hora ", Double(3.5))
        cell.price.textColor = UIColor.white
        cell.sportDescription.text = String.init("")
        cell.sportImageView.image = UIImage(named :"futbol.jpeg")
        return cell
    }
}

