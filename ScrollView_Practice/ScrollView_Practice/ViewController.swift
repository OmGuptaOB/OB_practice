//
//  ViewController.swift
//  ScrollView_Practice
//
//  Created by OBMac-13 on 03/03/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var contentView: UIView!
    
    var cellViews: [UIView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        createFakeCells()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.setContentOffset(CGPoint(x: 0, y: 500), animated: true)
        configureScrolview()
    }
    
    func configureScrolview(){
        
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.scrollsToTop = true
//        scrollView.bounces = false
        scrollView.bouncesHorizontally = false
        scrollView.bouncesVertically = true
        
        scrollView.alwaysBounceVertical = true
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        scrollView.refreshControl = refresh
        scrollView.refreshControl?.tintColor = .red
        scrollView.refreshControl?.attributedTitle = NSAttributedString("updating data...")
        
        scrollView.keyboardDismissMode = .onDrag
        scrollView.indexDisplayMode = .automatic
    }
    
    @objc func refreshData(){
        print("Refreshing...")
        let targetView = cellViews[9]
           
           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               self.scrollView.refreshControl?.endRefreshing()
               self.scrollView.scrollRectToVisible(targetView.frame, animated: true)
           }

        
    }
    
    func createFakeCells() {
        
        let cellHeight: CGFloat = 100
        let spacing: CGFloat = 10
        
        for i in 0..<15 {
            
            let cellView = UIView()
            cellView.frame = CGRect(
                x: 16,
                y: CGFloat(i) * (cellHeight + spacing),
                width: view.frame.width - 32,
                height: cellHeight
            )
            
            cellView.backgroundColor = .systemBlue
            cellView.layer.cornerRadius = 12
            
            // Add label to make it look like table cell
//            let label = UILabel()
//            label.text = "Cell \(i + 1)"
//            label.textColor = .white
//            label.font = .boldSystemFont(ofSize: 20)
//            label.frame = CGRect(x: 16, y: 0, width: 200, height: cellHeight)
            let tf = UITextField()
            tf.placeholder = "Enter text"
            tf.frame.size.height = cellHeight
            tf.frame.size.width = contentView.frame.width - 32
            
            
            cellView.addSubview(tf)
            contentView.addSubview(cellView)
            cellViews.append(cellView)
        }
        
        // IMPORTANT → set content height
        let totalHeight = CGFloat(15) * (cellHeight + spacing)
        contentView.frame.size.height = totalHeight
        scrollView.contentSize = CGSize(width: view.frame.width, height: totalHeight)
    }
}
extension ViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let totalScrollable = scrollView.contentSize.height - scrollView.frame.height
        
        let progress = offset / totalScrollable  // 0.0 = top, 1.0 = bottom
        progressView.progress = Float(progress)

            if offset >= totalScrollable {
                print("Reached Bottom")
            }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                    withVelocity velocity: CGPoint,
                                    targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        if velocity.y > 0 {
//               print("Scrolling DOWN")
//              
//           } else if velocity.y < 0 {
//               print("Scrolling UP ")
//           }
        print(velocity.y)                    // how fast
        print(targetContentOffset.pointee.y) // where it's heading
        
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print(#function)
    }
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        print(#function)
        return true
    }
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print(#function)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print(#function)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(#function)
    }
    
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        print(#function)
//        return contentView  // zoom THIS view
//    }
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print(#function)
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print(scrollView.zoomScale) // 1.0 = normal, 2.0 = 2x zoomed in
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView,
                                   with view: UIView?,
                                   atScale scale: CGFloat) {
        print(scale) // final zoom level, e.g. 2.5
    }
}

