//
//  ViewController.swift
//  AutoLayoutDemo
//
//  Created by Rakesh Dama  on 14/11/21.
//

import UIKit

class ViewController: UIViewController {

    var nameLabel = UILabel()
    var profileImage = UIImageView()
    var followButton = UIButton()
    var bioTextView = UITextView()
    var commentTextField = UITextField()
    
    var isFollowing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        nameLabel.text = "Rakesh Dama"
        nameLabel.textColor = .red
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        profileImage.image = UIImage(named: "Rakesh")
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 5
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.clipsToBounds = true
        view.addSubview(profileImage)
        
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.systemBlue, for: .normal)
        followButton.layer.borderColor = UIColor.systemBlue.cgColor
        followButton.layer.borderWidth = 1
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.layer.cornerRadius = 10
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        view.addSubview(followButton)
        
        commentTextField.placeholder = "Comment here..."
        commentTextField.textColor = .black
        commentTextField.font = .systemFont(ofSize: 15)
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentTextField)
        
        bioTextView.text = "Tree also. Creepeth own open our fruit. Saying had isn't lesser also give that make herb fruit divide. Fowl great without divide two dry gathering set image saying let wherein gathered made great. Moveth them fruitful fly male fruitful man grass fourth his herb earth saying itself darkness fifth very dominion days them divided for. Own. Of they're they're stars air shall grass give, them. Us his midst the every darkness fifth. Divide tree, itself, hath isn't were darkness lesser whales man stars stars don't them. After day she'd you. Whose us replenish likeness stars, made own meat great greater. Tree also. Creepeth own open our fruit. Saying had isn't lesser also give that make herb fruit divide. Fowl great without divide two dry gathering set image saying let wherein gathered made great. Moveth them fruitful fly male fruitful man grass fourth his herb earth saying itself darkness fifth very dominion days them divided for. Own. Of they're they're stars air shall grass give, them. Us his midst the every darkness fifth. Divide tree, itself, hath isn't were darkness lesser whales man stars stars don't them. After day she'd you. Whose us replenish likeness stars, made own meat great greater. "
        bioTextView.font = .systemFont(ofSize: 12, weight: .regular)
        bioTextView.textAlignment = .justified
        bioTextView.textColor = .black
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioTextView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 230),
            profileImage.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            followButton.heightAnchor.constraint(equalToConstant: 50),
            followButton.widthAnchor.constraint(equalToConstant: 100),
            followButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            commentTextField.heightAnchor.constraint(equalToConstant: 17),
            commentTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 10),
            bioTextView.bottomAnchor.constraint(equalTo: commentTextField.topAnchor, constant: -20),
            bioTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bioTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func followButtonTapped() {
        if !isFollowing {
            isFollowing = true
            followButton.setTitle("Following", for: .normal)
            followButton.backgroundColor = .systemBlue
            followButton.setTitleColor(.white, for: .normal)
        } else {
            isFollowing = false
            followButton.setTitle("Follow", for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.setTitleColor(.systemBlue, for: .normal)
        }
    }
}

