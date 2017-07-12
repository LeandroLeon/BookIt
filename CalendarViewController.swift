//
//  CalendarViewController.swift
//  BookIt
//
//  Created by Laura on 4/7/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

import UIKit
import JTAppleCalendar


class CalendarViewController: UIViewController, JTAppleCalendarViewDataSource,JTAppleCalendarViewDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var year: UILabel!
    @IBOutlet var month: UILabel!
    @IBOutlet var calendarView: JTAppleCalendarView!
    @IBOutlet var calendarViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewBottonMarginConstraint: NSLayoutConstraint!
    @IBOutlet var tableViewHeigthConstraint: NSLayoutConstraint!
    
    var numberOfRows : Int = 5
    var generateInDates = InDateCellGeneration.forAllMonths
    var generateOutDates = OutDateCellGeneration.off
    
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCalendarView()
        
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setUpCalendarView(){
        reloadHeaderLabels()
    }
    
    //MARK: - SegueSetting Fire
    
    func bookSegueFire(){
        performSegue(withIdentifier: "calendarToBook", sender: nil)
    }
    
    func checkDate(_ date: Date) -> Bool{
        formatter.dateFormat = "yyyy/MM/dd"
        let formatedDate = formatter.string(from: date)
        let now = formatter.string(from: Date())
        return formatedDate == now
    }
    
    func reloadHeaderLabels(){
        calendarView.visibleDates { (visibleDates) in
            let date = visibleDates.monthDates.first?.date
            if let dateUnwrapped = date{
                
                let locale = Locale(identifier: "es_ES")
                self.formatter.dateFormat = "yyyy"
                self.year.text = self.formatter.string(from: dateUnwrapped)
                
                self.formatter.locale = locale
                self.formatter.dateFormat = "MMMM"
                var monthToTreat = self.formatter.string(from: dateUnwrapped)
                monthToTreat.capitalizeFirstLetter()
                self.month.text = monthToTreat
            } else {
                self.month.text = "Month"
                self.year.text = "Year"
            }
        }
    }
    
    func setBackgroundCircleFor(cell: CustomCollectionViewCell){
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 17
        cell.backgroundCircle.isHidden = false
    }
    
    func showTimeSlots(){
        tableViewHeigthConstraint.constant = 197.0
        tableViewBottonMarginConstraint.constant = 8.0
        tableView.isHidden = false
        UIView.animate(withDuration: 0.25) { 
            self.tableView.layoutIfNeeded()
        }
    }
    
    
    //MARK: - JTAppleCalendar DataSource
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = Date()
        let sixtyDays = Double(60*60*24*60)
        let endDate = Date(timeIntervalSinceNow: sixtyDays)
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: self.numberOfRows,generateInDates: .forAllMonths, generateOutDates: .off, firstDayOfWeek: DaysOfWeek.monday)
        return parameters
    }
    
    //MARK: - JTAppleCalendar Delegate
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell{
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.dateLabel.text = cellState.text
        setBackgroundCircleFor(cell: cell)
        
        
        if cellState.isSelected{
            cell.dateLabel.textColor = UIColor.init(red: CGFloat(41)/255, green: CGFloat(50)/255, blue: CGFloat(64)/255, alpha: 1.0)
            cell.backgroundCircle.isHidden = false
        } else {
            cell.dateLabel.textColor = UIColor.white
            cell.backgroundCircle.isHidden = true
        }
        
        if checkDate(date){
            setBackgroundCircleFor(cell: cell)
            cell.backgroundCircle.backgroundColor = UIColor.green
        } else {
            cell.backgroundCircle.backgroundColor = UIColor.init(red: CGFloat(251)/255, green: CGFloat(238)/255, blue: CGFloat(97)/255, alpha: 1.0)
        }
        return cell
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        reloadHeaderLabels()
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCollectionViewCell else {return}
        validCell.dateLabel.textColor = UIColor.init(red: CGFloat(41)/255, green: CGFloat(50)/255, blue: CGFloat(64)/255, alpha: 1.0)
        setBackgroundCircleFor(cell: validCell)
        if checkDate(date){
            // 251 238 97
            validCell.backgroundCircle.backgroundColor = UIColor.init(red: CGFloat(251)/255, green: CGFloat(238)/255, blue: CGFloat(97)/255, alpha: 1.0)
        }
        numberOfRows = 1
        calendarViewHeightConstraint.constant = 52
        showTimeSlots()
        generateInDates = .off
        generateOutDates = .off
        self.calendarView.reloadData()
        calendarView.scrollToDate(date)

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCollectionViewCell else {return}
        if !checkDate(date){
            validCell.dateLabel.textColor = UIColor.init(red: CGFloat(41)/255, green: CGFloat(50)/255, blue: CGFloat(64)/255, alpha: 1.0)
            validCell.dateLabel.textColor = UIColor.white
            validCell.backgroundCircle.isHidden = true
        } else {
            validCell.backgroundCircle.backgroundColor = UIColor.green
            
        }
        
    }
    
    //MARK: - UITableViewController DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FieldCell") as! FieldTableViewCell
        return cell
        
    }
    
    //MARK: - UITableViewController Delegate
    
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
            bookSegueFire()
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
