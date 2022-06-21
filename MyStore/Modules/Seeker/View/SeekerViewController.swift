//
//  SeekerViewController.swift
//  MyStore
//
//  Created by iMac on 27/03/21.
//

import UIKit

class SeekerViewController: UIViewController {
    
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    var presenter: ViewToPresenterSeekerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    /** this function configure the componets in the seerker view */
    func setUpView(){
        presenter?.validateQuery(text: "")
//        btnSearch.addTarget(self, action: #selector(tapSearch), for: .touchDown)
        txtSearch.addTarget(self, action: #selector(changueTxt(textfield :)), for: .editingChanged)
        btnCancel.addTarget(self, action: #selector(tapCancel(textfield :)), for: .touchDown)
        txtSearch.delegate = self
        txtSearch.returnKeyType = UIReturnKeyType.done
    }
    
    /** excecute method for go to home module and pass query words*/
    @objc func tapSearch(){
        presenter?.goToHome(query: txtSearch.text!, view: self)
    }
    
    /**
        this function bind the textfield for later excecute validate query method
        :params: textfield seeker
     */
    @objc func changueTxt( textfield: UITextField){
       
    }
    
    /**
        this function cancel searchin action
     */
    @objc func tapCancel( textfield: UITextField){
        presenter?.goToHome(query: txtSearch.text!, view: self)
    }
      
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SeekerViewController: PresenterToViewSeekerProtocol{
    
    func dissmiss() {
        
    }
    
    func validateQuery(isValid: Bool) {
        if isValid {
            presenter!.goToHome(query: txtSearch.text ?? "", view: self)
        }
       
    }
    
    
}
extension SeekerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter?.validateQuery(text: textField.text ?? "")
       
        return true
    }
}
