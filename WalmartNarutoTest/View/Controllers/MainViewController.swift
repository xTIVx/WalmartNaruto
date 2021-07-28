//
//  ViewController.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/27/21.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var mainView: MainView!

    var vm: MainViewModel? 

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.vm = self.vm
        mainView.commonSetup()
    }
}
