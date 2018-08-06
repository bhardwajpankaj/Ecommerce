//
//  ProductDetailViewController.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class ProductDetailViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var viewModel: ProductDetailViewModel?
    @IBOutlet weak var imageCollectionView: UICollectionView!

    lazy var flowLayout: UICollectionViewFlowLayout =  {
        let _flowLayout = UICollectionViewFlowLayout()
        _flowLayout.itemSize = CGSize(width: self.imageCollectionView.bounds.size.width, height: self.imageCollectionView.bounds.size.height)
        _flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        _flowLayout.minimumLineSpacing = 0
        return _flowLayout
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
        inializeScreenWithData()
    }
    
    private func inializeScreenWithData(){
        titleLabel.text = viewModel?.productSelected?.title
        if let price = viewModel?.productSelected?.pricing?.price
        {
            priceLabel.text = price.toPrice
        }else
        {
            priceLabel.text = nil
        }
    }
    
    private func initializeCollectionView(){
        imageCollectionView.collectionViewLayout = flowLayout
        imageCollectionView.isPagingEnabled = true
        imageCollectionView.register(cell: ProductImageCollectionViewCell.self)

    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true) {}
    }
    
    @IBAction func addtoCartButtonTapped(_ sender: Any) {
        print("Add To Cart Button Tapped")
    }

}
extension ProductDetailViewController : UICollectionViewDataSource{
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel?.productSelected?.images?.count ?? 0
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell:ProductImageCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
    
    let imageURL = Constants.urlPrefix + (viewModel?.productSelected?.images?[indexPath.item].name ?? "")
    cell.sessionTask?.cancel()
    cell.sessionTask = cell.productImageView.downloadImage(from: imageURL, placeholderImageName: "")
    return cell
}

}
