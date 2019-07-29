//
//  GalleryViewController.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    //View variables
    @IBOutlet weak var CollectionView   : UICollectionView!
    
    //Object variables
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
        super.viewWillLayoutSubviews()
        setupCellSize()
    }
}

extension GalleryViewController {
    /// Sets up the collection view and registers the Nibs
    func setupCollectionView() {
        CollectionView.delegate     = self
        CollectionView.dataSource   = self
        CollectionView.register(TPConstants.Nibs.GALLERY_CVC, forCellWithReuseIdentifier: cellId)
    }
    
    /// Sets up the Collection view flow layout.
    func setupCellSize() {
        let CollectionViewFlowLayout = UICollectionViewFlowLayout()
        let NumberOfRows             = CGFloat(2)
        let LineSpacing              = CGFloat(2)
        let InterItemSpacing         = CGFloat(2)
        let width                    = ((CollectionView.frame.width - ((NumberOfRows-1)*LineSpacing))/NumberOfRows)
        let height                   = width * 1.5
        CollectionViewFlowLayout.itemSize                   = CGSize(width: width, height: height)
        CollectionViewFlowLayout.sectionInset               = .zero
        CollectionViewFlowLayout.scrollDirection            = .vertical
        CollectionViewFlowLayout.minimumLineSpacing         = LineSpacing
        CollectionViewFlowLayout.minimumInteritemSpacing    = InterItemSpacing
        CollectionView.setCollectionViewLayout(CollectionViewFlowLayout, animated: true)
    }
}

extension GalleryViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm?.numberOfItemsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        cell.item       = vm?.galleryItem(at: indexPath)
        cell.delegate   = self
        return cell
    }
}

extension GalleryViewController : UICollectionViewDelegateFlowLayout {
    
    //Used to resize collection view cells on orientation change
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var NumberOfRows             = CGFloat(2); if UIDevice.current.orientation.isLandscape { NumberOfRows = CGFloat(3) }
        let LineSpacing              = CGFloat(2)
        let width                    = ((CollectionView.frame.width - ((NumberOfRows-1)*LineSpacing))/NumberOfRows)
        let height                   = width * 1.5
        
        return CGSize(width: width, height: height)
    }
}

extension GalleryViewController : DoubleTapDelegate {
    func itemDoubleTapped(vc : UIActivityViewController) {
        present(vc, animated : true, completion: nil)
    }
}
