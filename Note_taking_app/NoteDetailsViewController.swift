//
//  NoteDetailsViewController.swift
//  Note_taking_app
//
//  Created by Khushi Verma on 2019-07-23.
//  Copyright © 2019 Team Stang. All rights reserved.
//

import UIKit

class NoteDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let toolBar = UIToolbar()
    var cat = ["Work", "Home", "College"]
    var myPickerView : UIPickerView!
    
    

    @IBOutlet weak var txtNoteTitle: UITextField!
    @IBOutlet weak var txtNoteCategory: UITextField!
    @IBOutlet weak var txtNoteDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNoteCategory.delegate = self
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//        txtNoteCategory.addGestureRecognizer(tap)
//        txtNoteCategory.isEnabled = false
        
        // Do any additional setup after loading the view.
        navigationItem.title = "Note Details"
        txtNoteDescription.layer.cornerRadius = 5
        txtNoteDescription.layer.borderColor = UIColor.red.cgColor
        txtNoteDescription.layer.borderWidth = 1
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isEqual(txtNoteCategory){
            //            selected = 1
            self.catPicker(textField)
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    func catPicker(_ textField : UITextField){
        
        
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        textField.inputView = self.myPickerView
        
        
        toolBar.barStyle = .black
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBtnClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBtnClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    @objc func doneBtnClick(){
//        txtNoteCategory.isUserInteractionEnabled = false
        toolBar.removeFromSuperview()
        txtNoteCategory.resignFirstResponder()
        myPickerView.removeFromSuperview()
    }
    
    @objc func cancelBtnClick(){
        toolBar.removeFromSuperview()
        myPickerView.removeFromSuperview()
        txtNoteCategory.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cat.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cat[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtNoteCategory.text = cat[row]
    }
    

}
