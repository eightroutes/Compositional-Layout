//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by 정근호 on 4/9/25.
//

import UIKit
import SnapKit
import Then

class ViewController: UICollectionViewController {
    
    
    init() {
        let layout = ViewController.createLayout()
        super.init(collectionViewLayout: layout)
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment in
            
            let item = NSCollectionLayoutItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            item.contentInsets.trailing = 16
            item.contentInsets.bottom = 16
            item.contentInsets.top = 16
            item.contentInsets.leading = 16
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(200)
                ),
                subitems: [item]
            )
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath
        )
        cell.backgroundColor = .red
        return cell
    }
    
    private let cellId = "cellID"
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collectionView.backgroundColor = .black
        navigationItem.title = "Food Delivery"
        
        collectionView
            .register(
                UICollectionViewCell.self,
                forCellWithReuseIdentifier: cellId
            )
    }
}

#Preview {
    ViewController()
}

