//
//  ViewController.swift
//  L5Starter
//
//  Created by Amy Chin Siu Huang on 10/25/21.
//

import UIKit

class ViewController: UIViewController {

    // TODO 1: set up view
    private var collectionView: UICollectionView!

    // Data
    private var sections = ["Circle", "Triangle", "Star", "Umbrella"]
    private var shapes: [[Shape]] = [
        [Shape(imageName: "circle"), Shape(imageName: "circle"), Shape(imageName: "circle"), Shape(imageName: "circle")],
        [Shape(imageName: "triangle"), Shape(imageName: "triangle"), Shape(imageName: "triangle"), Shape(imageName: "triangle")],
        [Shape(imageName: "star"), Shape(imageName: "star"), Shape(imageName: "star"), Shape(imageName: "star")],
        [Shape(imageName: "umbrella"), Shape(imageName: "umbrella"), Shape(imageName: "umbrella"), Shape(imageName: "umbrella")]
    ]

    // TODO 2: set up constants
    private let shapesCellReuseIdentifier = "shapesCellReuseIdentifier"
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Squid Game"
        view.backgroundColor = .white

        // TODO 3: Setup flow layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = cellPadding
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)

        // TODO 4: Instantiate collectionView
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear

        // TODO 5: Create collection view cell and register it here.
        collectionView.register(ShapesCollectionViewCell.self, forCellWithReuseIdentifier: shapesCellReuseIdentifier)

        // TODO 6: Set collection view data source
        collectionView.dataSource = self

        // TODO 7: Set collection view delegate
        collectionView.delegate = self

        // TODO 8: Register header view
        collectionView.register(headerView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        view.addSubview(collectionView)
        setupConstraints()
    }

    func setupConstraints() {
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
}

// TODO 6: Conform to UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shapes[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shapesCellReuseIdentifier, for: indexPath) as! ShapesCollectionViewCell
        cell.configure(for: shapes[indexPath.section][indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! headerView
        header.configure(for: sections[indexPath.section])
        return header
    }
    
}

// TODO 7: Confrom to UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfRows: CGFloat = 2
        let size = (collectionView.frame.width - cellPadding) / numOfRows
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
// TODO 9: Conform to UICollectionViewDelegate, implement interaction
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shape = shapes[indexPath.section][indexPath.item]
        shape.isSelected.toggle()
        collectionView.reloadData()
    }
}
