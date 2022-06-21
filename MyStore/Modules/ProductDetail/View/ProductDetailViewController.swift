//
//  ProductDetailViewController.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/06/22.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var contentTable: UIView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var table: UITableView!
    
    //in this enumerator find all .xibs names
    enum NibIds: String {
        case productPrice = "ProductPrice"
        case attributeProductCell = "AttributeProductCell"
        case productImage = "ProductImage"
        case productSectionTitle = "ProductSectionTitle"
    }
    
    var presenter: ViewToPresenterProductDetailProtocol?
    var product: ProductModel?
    var container: [ProductDetailCellModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFunctions()
        // Do any additional setup after loading the view.
    }
    /**
     this function execute all initial methods
     */
    func initFunctions(){
        inflateTable()
        registerCells()
        getProduct()
        setUpUI()
        
    }
    
    func inflateTable(){
        presenter?.getRowsTable()
    }
    
    func getProduct(){
        presenter?.getProductDetail()
    }
    
    func setUpUI(){
        
        
        
    }
    /**
     here registers all Nibs before use in the table
     */
    func registerCells(){
        
        let nibProductPrice = UINib(nibName: NibIds.productPrice.rawValue, bundle: nil)
        let nibProductAttr = UINib(nibName: NibIds.attributeProductCell.rawValue, bundle: nil)
        let nibProductImg = UINib(nibName: NibIds.productImage.rawValue, bundle: nil)
        let nibProductSectionTitle = UINib(nibName: NibIds.productSectionTitle.rawValue, bundle: nil)
        
        table.register(nibProductPrice, forCellReuseIdentifier:  NibIds.productPrice.rawValue)
        table.register(nibProductAttr, forCellReuseIdentifier: NibIds.attributeProductCell.rawValue)
        table.register(nibProductImg, forCellReuseIdentifier: NibIds.productImage.rawValue)
        table.register(nibProductSectionTitle, forCellReuseIdentifier: NibIds.productSectionTitle.rawValue)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ProductDetailViewController: PresenterToViewProductDetailProtocol{
    
    func getDataTable(container: [ProductDetailCellModel]) {
        self.container = container
    }
    
    
    func getProduct(product: ProductModel?) {
        self.product = product
        
    }
    
}

extension ProductDetailViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = container[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellId.rawValue, for: indexPath) as! ProductDetailTableViewCell
        cell.setTup(item: item)
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return container.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let item = container[indexPath.row]
        return CGFloat(item.height)
        
    }
    
}

