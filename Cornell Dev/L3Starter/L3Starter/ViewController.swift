//
//  ViewController.swift
//  L3Starter
//
//  Created by Amy Chin Siu Huang on 10/4/21.
//

import UIKit

// TODO 6: create protocol to update title
protocol UpdateTitleDelegate {
    func updateTitle(newString: String)
}

class ViewController: UIViewController {

    private var pushButton = UIButton()
    private var presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // TODO 2: set title
        title = "View Controllers"

        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.setTitle("Push", for: .normal)
        pushButton.setTitleColor(.black, for: .normal)
        pushButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        pushButton.layer.cornerRadius = 4
        pushButton.addTarget(self, action: #selector(pushViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(pushButton)

        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.black, for: .normal)
        presentButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        presentButton.layer.cornerRadius = 4
        presentButton.addTarget(self, action: #selector(presentViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(presentButton)

        setUpViews()
    }

    func setUpViews() {
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -6),
            pushButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            pushButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 12),
            presentButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            presentButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    @objc func pushViewControllerButtonPressed() {
        // TODO 3: create VC to push
        let vc = PushViewController()
        navigationController?.pushViewController(vc, animated: true)

    }

    @objc func presentViewControllerButtonPressed() {
        // TODO 4: create VC to present
        let vc = PresentViewController()
        present(vc, animated: true, completion: nil)

        // TODO 9: update delegate
        vc.delegate = self
    }

}

// TODO 7: override protocol methods
extension ViewController: UpdateTitleDelegate {
    func updateTitle(newString: String) {
        title = newString
    }
}
