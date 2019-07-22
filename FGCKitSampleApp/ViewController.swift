//
//  ViewController.swift
//  FGCKitSampleApp
//
//  Created by Daniel Bachar on 30/04/2018.
//  Copyright © 2018 FatGingerCat LT. All rights reserved.
//

import UIKit
import FGCKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var stories:[Story]?
    fileprivate var page:Int = 0
    fileprivate var limit:Int = 40
    
    fileprivate let cellName:String = "StoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initCollectionView()
        fetchStories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func initCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        let nib = UINib(nibName: cellName, bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: cellName)
//        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: cellName)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100.0, height: 100.0)
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    fileprivate func fetchStories() {
        FGCKit.stories(offset: page*limit,
                       limit: limit) {[weak self](stories, error) in
                        //TODO - error handling
                        if self?.page == 0 {
                            self?.stories = stories
                            self?.collectionView.reloadData()
                        } else {
                            //Paging - add to table view
                        }
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? StoryCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .red
        guard let story = stories?[indexPath.item] else {
            return cell
        }
        
        //TODO - set image
        if let url = story.coverURL {
            cell.imageView.imageFromUrl(url)
        }
        
        //TODO - set Title
        cell.titleLabel.text = story.identifier
//        FGCKit.user
        cell.authorNameLabel.text = story.owners[0].firstName
        cell.titleLabel.textColor = .white
        return cell
    }
    
    //Deleagte
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let story = stories?[indexPath.item] else {
            return
        }
        
        let vc:ReaderViewController
        do {
            vc = try FGCKit.readerViewController(for: story)
        } catch {
            return
        }
        
        vc.delegate = self
        show(vc, sender: self)
    }
}

extension ViewController: ReaderViewControllerDelegate {
    
    func didRequestDissmisal() {
        self.dismiss(animated: true, completion: nil)
    }
}

