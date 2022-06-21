//
//  CollectionViewCell.swift
//  MyStore
//
//  Created by iMac on 27/03/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgPublication: UIImageView?
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblPrice: UILabel?
    
    static let identifier = "ProductCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func prepareForReuse() {
        imgPublication?.image = nil
        lblName?.text = nil
        lblPrice?.text = nil
    }
    
    func setUp(product: ProductModel){
        lblName?.text = product.title
        lblPrice?.text = "$\(product.price ?? 0)"
        
        DispatchQueue.main.async { [weak self] in
            
            self?.imgPublication?.downloaded(from: product.thumbnail ?? "", contentMode: .scaleAspectFit)
            self?.imgPublication?.image = self?.imgPublication?.rounded
        }
    }
}

