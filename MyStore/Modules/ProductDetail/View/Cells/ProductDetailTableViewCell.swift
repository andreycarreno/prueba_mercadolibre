//
//  TableViewCell.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/06/22.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblValue: UILabel?
    @IBOutlet weak var lblPrice: UILabel?
    @IBOutlet weak var lblOriginalPrice: UILabel?
    @IBOutlet weak var imgProduct: UIImageView?
    @IBOutlet weak var contentAttr: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        
        lblTitle?.text = nil
        lblName?.text = nil
        lblValue?.text = nil
        lblPrice?.text = nil
        lblOriginalPrice?.text = nil
        imgProduct?.image = nil
        
        
    }
    
    func setTup( item: ProductDetailCellModel){
        
        switch item.obj {
        case .attribute(key: let key, value: let value):
            
            lblName?.text = key
            lblValue?.text = value
            contentAttr?.addBoder()
            
        case .price(price: let price, oldPrice: let oldPrice, name: let name):
            
            lblName?.text = name
            lblPrice?.text = "$\(price)"
            lblOriginalPrice?.text = "$\(oldPrice)"
            
        case .image(url: let url):
            
            imgProduct?.downloaded(from: url , contentMode: .scaleAspectFit)
            
        case .title(text: let text):
            
            lblTitle?.text = text
            
        }
           
    }
    
}
