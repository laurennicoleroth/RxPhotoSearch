//
//  SearchViewController.swift
//  IVYRxPhotos
//
//  Created by Lauren Nicole Roth on 9/6/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage

class SearchViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  let disposeBag = DisposeBag()
  var searchViewModel: SearchViewModel!
  
  var latestKeyword: Observable<String> {
    return searchBar.rx.text
      .orEmpty
      .debounce(0.5, scheduler: MainScheduler.instance)
      .distinctUntilChanged()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupRx() {

    searchViewModel = SearchViewModel( keywordObservable: latestKeyword)
    
    searchBar.rx.searchButtonClicked.subscribe(onNext: { text in
      if self.searchBar.isFirstResponder == true {
        self.view.endEditing(true)
      }
    }).addDisposableTo(disposeBag)

    searchViewModel.searchPhotos()
      .bindTo(tableView.rx.items) { (tableView, row, item) in
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: IndexPath(row: row, section: 0)) as! PhotoTableViewCell
        
        cell.titleLabel.text = item.title
        cell.photoImageView.sd_setShowActivityIndicatorView(true)
        cell.photoImageView.sd_setIndicatorStyle(.gray)
        cell.photoImageView.sd_setImage(with: URL(string: item.getPhotoThumbnailURL()))
        return cell
      }
      .addDisposableTo(disposeBag)
    
    
    
  }
  
}
