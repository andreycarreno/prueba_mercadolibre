//
//  HomeViewController.swift
//  MyStore
//
//  Created by iMac on 27/03/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    // in container is find all information about products/
    var container: Array<ProductModel> = Array()
    var presenter: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initFunctions()
        // Do any additional setup after loading the view.
    }
    
    /**this functions initialize all methods*/
    func initFunctions(){
        registerCells()
        setUpHeader()
        presenter?.startFetchingProducts(query: "tel")
    }
    
    func setUpHeader() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor =  UIColor(red: 255, green: 209, blue: 0, alpha: 1)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(openSeeker))
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.backgroundColor = UIColor(red: 255, green: 209, blue: 0, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isOpaque = false
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance =  navigationController?.navigationBar.standardAppearance
    }
    
    /** here register (Nibs) for before use the table*/
    func registerCells(){
        let cellProduct = UINib(nibName: "ProductCell", bundle: nil)
        collectionView.register(cellProduct, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    /** this function excecute open seeker method*/
    @objc func openSeeker() {
        
        presenter?.openSeeker(navigationController: self.navigationController!)
        
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
extension HomeViewController: PresenterToViewHomeProtocol{
    /** this function receive data about of products in the query*/
    func onProductResponseSuccess(producList: Array<ProductModel>) {
        
        container = producList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        //hideProgressIndicator(view: self.view)
        
    }
    /** this function receive the error in service*/
    func onMovieResponseFailed(error: String) {
        
        //hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching products   ", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        container.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let item = container[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        
        cell.setUp(product: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presenter?.showProducDetail(product: container[indexPath.row], navigation: self.navigationController!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat(collectionView.frame.width / 2 - 10), height: CGFloat(265))
    }
}
