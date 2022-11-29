//
//  FrameworkViewController.swift
//  AppleFramework
//
//  Created by chulyeon kim on 2022/11/24.
//

import UIKit

class FrameworkViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 여백 설정 : UICollectionViewDelegateFlowLayout에서 너비 다시 설정해줘야한다.
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
        
        // estimate size : 크기 고정 | 확장
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // 네비게이션 설정 코드
        navigationController?.navigationBar.topItem?.title = "🌸 Apple Frameworks"
        
    }
}


// 프로토콜 1 : data | cell
extension FrameworkViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCollectionViewCell", for: indexPath) as? FrameworkCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(list[indexPath.item])
        return cell
    }
}


// 프로토콜 2 : layout
extension FrameworkViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // 위 아래 공간 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

// 프로토콜 3 : cell 클릭
extension FrameworkViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item) : hello")
    }
}
