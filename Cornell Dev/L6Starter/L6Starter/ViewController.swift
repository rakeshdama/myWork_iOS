//
//  ViewController.swift
//  L6Starter
//
//  Created by Yana Sang on 4/19/20.
//  Copyright © 2020 Yana Sang. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: UI components
    var tableView = UITableView()

    // MARK: Data variables
    var courses = [Course]()

    // MARK: Constants
    let reuseIdentifier = "ClassTableViewCellReuse"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Course Shopping Cart"
        view.backgroundColor = .white

        courses = [
            Course(name: "Intro to iOS Development", code: 1998, instructor: "Haiying and Amy", enrolled: true),
            Course(name: "Intro to Python", code: 1110, instructor: "Walker White", enrolled: false),
        ]

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoursesTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        view.addSubview(tableView)

        setupConstraints()
        getCourses()
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
//            NSLayoutConstraint.activate([
//                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//            ])
        }

    // TODO: How do we make a call to the internet to load our shopping cart?
    func getCourses() {

    }

}

    // MARK: - Table view data source
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return courses.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CoursesTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(for: courses[indexPath.row])
            return cell
        }
    }

    // MARK: - Table view delegate
    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
    }



