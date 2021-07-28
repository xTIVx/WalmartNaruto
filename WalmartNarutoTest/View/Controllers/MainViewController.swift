//
//  ViewController.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/27/21.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tView: UITableView!

    var vm: MainViewModel! {
        didSet {
            vm.fetchData(endPoint: .search) {_ in 
                DispatchQueue.main.async {
                    self.tView.reloadData()
                    self.tView.isHidden = false
                    self.spinner.stopAnimating()
                }
            }
        }
    }
    // VC LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // TableView setup
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        tView.register(nib, forCellReuseIdentifier: "cell")
        tView.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.getAnimesCount() > 0 ? self.spinner.stopAnimating() : self.spinner.startAnimating()
    }

}

// TableView Delegates
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getAnimesCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MainTableViewCell else {return UITableViewCell()}

        cell.episodeObject = vm?.getAnimeForCell(at: indexPath.row)

        return cell
    }
}
