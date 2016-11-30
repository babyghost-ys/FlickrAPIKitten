//
//  ViewController.swift
//  FlickrAPIKitten
//
//  Created by Peter Leung on 30/11/2016.
//  Copyright © 2016 winandmac Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var kittenCollectionView: UICollectionView!
    var posts = [Posts]()
    var getJSONposts: jsonEngine = jsonEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        kittenCollectionView.delegate = self
        kittenCollectionView.dataSource = self
        
        self.getJSONposts.getPosts(getposts: "https://api.flickr.com/services/feeds/photos_public.gne?tags=kitten&format=json&nojsoncallback=?&page=1")
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData(_:)), name: .reloadTableView, object: nil)
    }
    
    func reloadTableData(_ notification: Notification) {
        self.posts = self.getJSONposts.posts
        self.kittenCollectionView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell {
            cell.configureCell(inputPosts: posts[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

}

