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
        return UICollectionViewCompositionalLayout {
 sectionNumber,
 environment in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 0,
                    trailing: 2
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(200)
                    ),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                
                // 가로 배너
                //            section.orthogonalScrollingBehavior = .continuous
                section.orthogonalScrollingBehavior = .paging
                return section
                
            } else {
                
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(0.25),
                        heightDimension: .absolute(150)
                    )
                )
                
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 16,
                    trailing: 16
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(500)
                    ),
                    subitems: [item]
                )
//                group.contentInsets.leading = 16
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                
                section.boundarySupplementaryItems = [
                    .init(
                        layoutSize: .init(
                            widthDimension: .fractionalWidth(1),
                            heightDimension: .absolute(50)
                        ),
                        elementKind: categoryHeaderId,
                        alignment: .topLeading
                    )
                ]
                
                return section
            }
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: headerId,
            for: indexPath
        )
//        header.backgroundColor = .blue
        return header
    }
    
    let headerId = "headerId"
    static let categoryHeaderId = "categoryHeaderId"
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
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
                
        collectionView.backgroundColor = .white
//        navigationItem.title = "Food Delivery"
        
        collectionView
            .register(
                UICollectionViewCell.self,
                forCellWithReuseIdentifier: cellId
            )
        
        collectionView
            .register(
                Header.self,
                forSupplementaryViewOfKind: ViewController.categoryHeaderId,
                withReuseIdentifier: headerId
            )
    }
}

class Header: UICollectionReusableView {
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Categories"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ViewController()
}

