//
//  ViewController.swift
//  pageController
//
//  Created by Digival on 14/08/23.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {

    var pageViewController: UIPageViewController!
var myController = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.forPageViewContoller()
        })
        let pages: [String] = ["guru bro", "arjunan","fazil bro","palani bro","balaji bro","saran bro"]
        for text in pages {
            let vc = TextViewController(with: text)
            vc.modalPresentationStyle = .overFullScreen
            myController.append(vc)
        }
        // Do any additional setup after loading the view.
    }
    func forPageViewContoller(){
//        guard let first = myController.first else {
//            return
//        }
//        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
//        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
//        vc.delegate = self
//        vc.dataSource = self
//        present(vc, animated: true)
        
        pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self

        if let first = myController.first {
            pageViewController.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }

        addChild(pageViewController)
        pageViewController.view.frame = view.bounds
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = myController.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        
        let before = index - 1
        
        return myController[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = myController.firstIndex(of: viewController), index < (myController.count - 1) else {
            return nil
        }
        let after = index + 1
        
        return myController[after]
    }
    


}

