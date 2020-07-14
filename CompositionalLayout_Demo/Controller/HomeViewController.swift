//
//  HomeViewController.swift
//  CompositionalLayout_Demo
//
//  Created by Nirav Gondaliya on 2020-07-14.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Food Items"
        setupCollectionView()
    }
    
    func setupCollectionView() {

        self.collection.register(Header.self, forSupplementaryViewOfKind: HomeViewController.categoryHeaderId, withReuseIdentifier: headerId)
        self.collection.register(UINib(nibName: "SectionOneCell", bundle: nil), forCellWithReuseIdentifier: "SectionOneCell")
        self.collection.register(UINib(nibName: "SectionTwoCell", bundle: nil), forCellWithReuseIdentifier: "SectionTwoCell")
        self.collection.register(UINib(nibName: "SectionThreeCell", bundle: nil), forCellWithReuseIdentifier: "SectionThreeCell")
        self.collection.register(UINib(nibName: "SectionFourCell", bundle: nil), forCellWithReuseIdentifier: "SectionFourCell")
        
        self.collection.collectionViewLayout = HomeViewController.createLayout()
        self.collection.dataSource = self
        self.collection.delegate = self
        
    }
    
    let headerId = "headerId"
    static let categoryHeaderId = "categoryHeaderId"
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, ent) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .paging
                
                return section
            }else if sectionNumber == 1 {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
                          elementKind: categoryHeaderId,
                          alignment: .topLeading)
                ]
                
                return section
            }else if sectionNumber == 2  {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 32
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(125)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                
                section.orthogonalScrollingBehavior = .continuous
                
                return section
            }else {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(250)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
                          elementKind: categoryHeaderId,
                          alignment: .topLeading)
                ]
                
                return section
            }
        }
    }
}


extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionOneCell", for: indexPath) as! SectionOneCell
            cell.image.image = UIImage(named: "salad_\(indexPath.row + 1)")
            return cell
            
        }else if indexPath.section == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionTwoCell", for: indexPath) as! SectionTwoCell
            cell.img.image = UIImage(named: "food_icon_3")
            return cell
            
        }else if indexPath.section == 2 {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionThreeCell", for: indexPath) as! SectionThreeCell
            if (indexPath.row) % 2 == 0 {
                cell.setGradientView(startColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
            }else {
                cell.setGradientView(startColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
            }
            return cell
            
        }else if indexPath.section == 3 {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionFourCell", for: indexPath) as! SectionFourCell
            
            if (indexPath.row == 1 || indexPath.row == 4) {
                cell.img.image = UIImage(named: "pizza_2")
            }else if (indexPath.row == 2 || indexPath.row == 5) {
                cell.img.image = UIImage(named: "pizza_4")
            }else {
                cell.img.image = UIImage(named: "pizza_1")
            }
            return cell
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            cell.backgroundColor = .white
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        
        return header
        
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Section: \(indexPath.section)")
        print("Selected Item: \(indexPath.row)")
    }
}


class Header : UICollectionReusableView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Categories"
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

