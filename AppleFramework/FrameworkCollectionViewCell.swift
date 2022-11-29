//
//  FrameworkCollectionViewCell.swift
//  AppleFramework
//
//  Created by chulyeon kim on 2022/11/24.
//

import UIKit

class FrameworkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frameworkImage: UIImageView!
    @IBOutlet weak var frameworkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        frameworkLabel.numberOfLines = 1 // 라벨 줄을 한줄로 고정
        frameworkLabel.adjustsFontSizeToFitWidth = true // 폰트크기를 자동 조정해서 라벨을 너비에 맞춘다
    }
    
    func configure(_ framework: AppleFramework) {
        frameworkLabel.text = framework.name
        frameworkImage.image = UIImage(named: framework.imageName)
    }
}
