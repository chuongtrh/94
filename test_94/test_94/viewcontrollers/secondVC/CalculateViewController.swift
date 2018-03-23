//
//  CalculateViewController.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var tfSalary:UITextField!
    @IBOutlet weak var slMonth:UISlider!
    @IBOutlet weak var lbMonth:UILabel!
    @IBOutlet weak var tfUnpaidLeave:UITextField!
    @IBOutlet weak var lbWorkingDay:UILabel!
    @IBOutlet weak var lbResult:UILabel!

    //Hardcode: year 2018
    var year:Int = 2018
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        updateUI()
        
        updateFinalSalary()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Helper
    
    func setupUI()  {
        
        //Init value
        let today:Date = Date()
        let monthInNumber:Int = today.month
        slMonth.value = (Float)(monthInNumber)

        //Done button
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 40))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height - 20.0)
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = UIColor.black
        toolBar.backgroundColor = UIColor.white
        
        
        let okBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(CalculateViewController.donePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexSpace, flexSpace, okBarBtn], animated: true)
        
        tfSalary.inputAccessoryView = toolBar
        tfUnpaidLeave.inputAccessoryView = toolBar
        
        tfSalary.addTarget(self, action: #selector(CalculateViewController.textFieldValueChange), for: UIControlEvents.editingChanged)
        tfUnpaidLeave.addTarget(self, action: #selector(CalculateViewController.textFieldValueChange), for: UIControlEvents.editingChanged)

        
    }
    @objc func donePressed(sender: UIBarButtonItem) {
        self.view.endEditing(true)
        
        updateFinalSalary()

    }
    
    @objc func textFieldValueChange(textField: UITextField) {
        updateFinalSalary()
    }
    
    func updateUI() {
        
        let monthInNumber:Int = (Int)(slMonth.value)
        let totalWorkingDayInMonth = Utilities.getWorkingDays(month: monthInNumber, year: year)
        
        lbMonth.text = "\(monthInNumber)"
        lbWorkingDay.text = "\(totalWorkingDayInMonth)"
    }
    func calculateSalary() -> Double {

        let monthInNumber:Int = (Int)(self.slMonth.value)
        
        let totalWorkingDayInMonth = Utilities.getWorkingDays(month: monthInNumber, year: year)

        if let salaryString:String = self.tfSalary.text , salaryString.count > 0, let unpaidLeaveString = self.tfUnpaidLeave.text, unpaidLeaveString.count > 0 {
            let salary = Double(salaryString)!
            let unpaidSalaryDay = Double(unpaidLeaveString)!
            return (salary - (unpaidSalaryDay*(salary/Double(totalWorkingDayInMonth))))

        }

        return 0
    }
    
    func updateFinalSalary() {
        let salary = calculateSalary()
        self.lbResult.text = "\(salary)"
    }
    //MARK: - OnAction
    
    @IBAction func onMonthChangeValue(_ sender:UISlider) {

        updateUI()
        
        updateFinalSalary()
    }

}

extension CalculateViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var shouldChange = true
        if(textField == tfSalary) {
            let alphaNums = CharacterSet(charactersIn: "0123456789.")
            let inStringSet = CharacterSet(charactersIn: string)
            shouldChange = alphaNums.isSuperset(of: inStringSet as CharacterSet)
        }else if(textField == tfUnpaidLeave) {
            let alphaNums = CharacterSet(charactersIn: "0123456789")
            let inStringSet = CharacterSet(charactersIn: string)
            shouldChange = alphaNums.isSuperset(of: inStringSet as CharacterSet)
        }
        return shouldChange
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}
