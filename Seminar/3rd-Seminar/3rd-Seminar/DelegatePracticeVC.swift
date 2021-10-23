//
//  DelegatePracticeVC.swift
//  3rd-Seminar
//
//  Created by soyeon on 2021/10/23.
//

import UIKit

class DelegatePracticeVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var dataTextField: UITextField!
    
    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var partPickerView: UIPickerView!
    
    // MARK: - Properties
    
    private var partList: [PartDataModel] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataTextField.delegate = self
        
        partPickerView.delegate = self
        partPickerView.dataSource = self
        
        initData()
        initPartLayout()
    }
    
    // MARK: - Custom Methods
    
    private func initData() {
        partList.append(contentsOf: [
            PartDataModel(imageName: "wesoptiOSPart", partName: "iOS"),
            PartDataModel(imageName: "wesoptAndroidPart", partName: "Android"),
            PartDataModel(imageName: "wesoptWebPart", partName: "Web"),
            PartDataModel(imageName: "wesoptServerPart", partName: "Server"),
            PartDataModel(imageName: "wesoptDesignPart", partName: "Design"),
            PartDataModel(imageName: "wesoptPlanPart", partName: "Plan")
        ])
    }
    
    private func initPartLayout() {
        partImageView.image = partList[0].setImage()
        dataTextField.text = partList[0].partName
    }
}

// MARK: - TextField Delegate

extension DelegatePracticeVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.endEditing(true)
        return true
    }
}

// MARK: - PickerView DataSource

extension DelegatePracticeVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partList.count
    }
}

// MARK: - PickerView Delegate 

extension DelegatePracticeVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partList[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        partImageView.image = partList[row].setImage()
        dataTextField.text = partList[row].partName
    }
}
