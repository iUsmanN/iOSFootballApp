//
//  GalleryViewController.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var CollectionView   : UICollectionView!
    var vm                              : GalleryVM?
    let cellId = "GalleryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm = GalleryVM(refreshColViewClosure: {
            self.CollectionView.reloadData()
        })
        
        vm?.getData()
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        setupCellSize()
    }
}

extension GalleryViewController {
    func setupCollectionView() {
        CollectionView.delegate     = self
        CollectionView.dataSource   = self
        //let nib = UINib(nibName: "GalleryCollectionViewCell", bundle: nil)
        CollectionView.register(TPConstants.Nibs.GALLERY_CVC, forCellWithReuseIdentifier: cellId)
    }
    
    func setupCellSize() {
        let CollectionViewFlowLayout = UICollectionViewFlowLayout()
        let NumberOfRows             = CGFloat(2)
        let LineSpacing              = CGFloat(5)
        let InterItemSpacing         = CGFloat(5)
        let width                    = (view.frame.width - ((NumberOfRows-1)*LineSpacing))/NumberOfRows
        let height                   = width * 1.5
        CollectionViewFlowLayout.itemSize           = CGSize(width: width, height: height)
        CollectionViewFlowLayout.sectionInset       = .zero
        CollectionViewFlowLayout.scrollDirection    = .vertical
        CollectionViewFlowLayout.minimumLineSpacing = LineSpacing
        CollectionViewFlowLayout.minimumInteritemSpacing = InterItemSpacing
        CollectionView.setCollectionViewLayout(CollectionViewFlowLayout, animated: true)
    }
}

extension GalleryViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm?.numberOfItemsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        cell.item = vm?.galleryItem(at: indexPath)
        cell.delegate = self
        return cell
    }
}


extension GalleryViewController : DoubleTapDelegate {
    func itemDoubleTapped(vc : UIActivityViewController) {
        present(vc, animated : true, completion: nil)
    }
}
