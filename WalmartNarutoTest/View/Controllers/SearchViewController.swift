//
//  SearchViewController.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/27/21.
//

import UIKit

class SearchViewController: UIViewController {


    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!

    // VC LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        hideKeyboardWhenTappedAround()
    }

    override func viewWillAppear(_ animated: Bool) {
        // Hide navBar on searchScreen
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }

    func setupUI() {
        // TextField
        searchField.layer.borderWidth = 1
        searchField.layer.borderColor = UIColor.purple.cgColor
        searchField.layer.cornerRadius = 10
        searchField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);

        //Button
        searchBtn.layer.cornerRadius = 10
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        // Action only from >= 3 symbols in textField
        if let text = searchField.text,
           text.count >= 3,
           let vc = self.storyboard?.instantiateViewController(identifier: "MainVC") as? MainViewController {
                vc.navigationItem.title = text
                vc.vm = MainViewModel(searchRequestText: text)
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension SearchViewController: UITextFieldDelegate {
    func hideKeyboardWhenTappedAround() {
        let gesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(gesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
