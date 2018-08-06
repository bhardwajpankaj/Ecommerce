//
//  ViewController.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

protocol ProductDetailRouter {
    func routeToProductDetailController(selectedProduct:Product)
}

class ProductCollectionViewController: BaseViewController {
    var viewModel: ProductCollectionViewModel?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var refreshControl:UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel = ProductCollectionViewModel()
        initializeCollectionView()
        fetchData()
        initRefreshControl()
    }
    private func initializeCollectionView() {
        let collectionViewLayout = CustomImageFlowLayout()
        self.collectionView.collectionViewLayout = collectionViewLayout
        self.collectionView.register(cell: ProductCollectionViewCell.self)
    }
    @objc func fetchData(){
        viewModel?.getProductInfoFromStarting(completionHandler: { (message) in
            if message != nil{
                //show Alert
                self.refreshControl.endRefreshing()
            }else {
                self.collectionView.reloadData()
                self.collectionView.backgroundColor = Constants.appBackgroundColor
                self.activityIndicator.stopAnimating()
                self.refreshControl.endRefreshing()
            }
        })
    }
    private func initRefreshControl(){
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(fetchData), for: UIControlEvents.valueChanged)
        collectionView!.addSubview(refreshControl)
    }
    
    
}
extension ProductCollectionViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let count = viewModel?.arrCollectionData?.count {
            if indexPath.row == count - 1 && viewModel?.boolLoading == false && viewModel?.boolMoreDataAvailable == true {
                self.viewModel?.getNextProductInfo(completionHandler: { (message) in
                    if message != nil {
                        // Show Alert
                    }else {
                        self.collectionView.reloadData()
                    }
                })
            }
        }
    }
}

extension ProductCollectionViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewModel?.arrCollectionData?.count) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ProductCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        
        let product = viewModel?.arrCollectionData?[indexPath.item]

        cell.updateInterface(title: product?.title, price: product?.pricing?.price, discount: product?.pricing?.savings_text)
        let imageURL = Constants.urlPrefix + (product?.img?.name ?? "")
        cell.sessionTask?.cancel()
        cell.sessionTask = cell.myImageView.downloadImage(from: imageURL, placeholderImageName: "placeholder")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedProduct = viewModel?.arrCollectionData?[indexPath.item]
        {
            self.routeToProductDetailController(selectedProduct: selectedProduct)

        }
    }
    
    
}

extension  ProductCollectionViewController : ProductDetailRouter {
    func routeToProductDetailController(selectedProduct: Product) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productDetailViewModel = ProductDetailViewModel()
        productDetailViewModel.productSelected = selectedProduct
        let controller:ProductDetailViewController? = storyboard.instantiateVC()
        controller?.viewModel = productDetailViewModel
        self.present(controller ?? UIViewController(), animated: true, completion: nil)

    }
}
