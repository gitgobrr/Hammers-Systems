//
//  ViewController.swift
//  Hammers
//
//  Created by sergey on 14.10.2022.
//

import UIKit


extension ViewController: MainViewPresenterDelegate {
    func reloadTable() {
        tableview.reloadData()
    }
}

class ViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var topView: UIView!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        setupUI()
        
        headerView.addButtons()
        addCategoryButtonGestureRecognizers()
        presenter.loadData()
    }
    
    // MARK: scrollViewDelegate
    lazy var initialOffset: CGFloat = headerView.frame.origin.y
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if headerView.frame.origin.y > initialOffset {
            headerView.layer.shadowOpacity = 0.5
        } else {
            headerView.layer.shadowOpacity = 0
        }
    }
    
    // MARK: Properties
    lazy var presenter = MainViewPresenter(delegate: self)
    lazy var headerView = CategoryView()
    
    // MARK: Methods
    func setupUI() {
        tableview.sectionHeaderTopPadding = 0
        tableview.tableHeaderView = UIView()
        tableview.backgroundColor = AppColor.background
    }
    func addCategoryButtonGestureRecognizers() {
        for button in headerView.categoryStackView.arrangedSubviews {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(categoryButtonSelected(sender:)))
            button.addGestureRecognizer(gesture)
        }
    }
    
    @objc
    func categoryButtonSelected(sender: UITapGestureRecognizer) {
        guard let button = sender.view as? CategoryButton else { return }
        headerView.selectButton(button: button)
        
        if let category = Category(rawValue: button.label.text ?? "") {
            if let index = presenter.data.firstIndex(where: {$0.category == category}) {
                tableview.scrollToRow(at: IndexPath(row: index, section: 1), at: .top, animated: true)
                let rectOrigin = CGPoint(x: button.center.x-headerView.frame.midX, y: button.frame.origin.y)
                let rect = CGRect(origin: rectOrigin, size: headerView.frame.size)
                headerView.scrollView.scrollRectToVisible(rect, animated: true)
            }
        }
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource -

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else {
            return presenter.data.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "banner")!
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
            let item = presenter.data[indexPath.row]
            cell.label.text = item.name
            cell.itemDescription.text = item.description
            cell.priceButton.setTitle("от \(item.price)", for: .normal)
            cell.presenter.loadImage(url: item.image)
            if indexPath.row == 0 {
                cell.addTopCornerRadius()
            }
            return cell
        }
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return headerView.intrinsicContentSize.height
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UIImage(named: "Banner")!.size.height
        } else {
            return 156
        }
    }
}
