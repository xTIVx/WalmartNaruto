//
//  MainView.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/28/21.
//

import UIKit

class MainView: UIView {


    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tView: UITableView!
    var vm: MainViewModel! {
        didSet {
            vm?.fetchData(endPoint: .search) { [weak self] _ in
                DispatchQueue.main.async {
                    self?.tView.reloadData()
                    self?.tView.isHidden = false
                    self?.spinner.stopAnimating()
                }
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupTableView() {
        tView.delegate = self
        tView.dataSource = self
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        tView.register(nib, forCellReuseIdentifier: "cell")
        tView.isHidden = true
    }

    func commonSetup() {
        Bundle.main.loadNibNamed("MainView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        vm.getAnimesCount() > 0 ? self.spinner.stopAnimating() : self.spinner.startAnimating()
        setupTableView()
    }
}


extension MainView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getAnimesCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MainTableViewCell else {return UITableViewCell()}

        cell.episodeObject = vm?.getAnimeForCell(at: indexPath.row)

        return cell
    }
}
