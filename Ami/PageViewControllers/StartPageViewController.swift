//
//  StartPageViewController.swift
//  AppIOT
//
//  Created by Samuel on 01/05/19.
//  Copyright © 2019 Felipe Corte. All rights reserved.
//

import UIKit

var sessaoGlobal = Dados()

class StartPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func newVC (viewController: String)->UIViewController{
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    lazy var orderedViewController: [UIViewController] =
    [ self.newVC(viewController: "startVC1"),
    self.newVC(viewController: "startVC2"),
    self.newVC(viewController: "startVC3"),
    self.newVC(viewController: "startVC4"),
    self.newVC(viewController: "startVC5")]
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.dataSource = self
        if let firstViewController = orderedViewController.first{
        setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        self.delegate = self
        configurePageControl()
        
        
        dadosDAO.getEmotions (callback: { (analise) in
            sessaoGlobal.humor = analise.humor
        })
        dadosDAO.getWords (callback: { (analise) in
            sessaoGlobal.keys = analise.keys
        })
    }
    
    
    func configurePageControl(){
    
    pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
    pageControl.numberOfPages = orderedViewController.count
    pageControl.currentPage = 0
    pageControl.tintColor = UIColor.darkGray
    pageControl.pageIndicatorTintColor = UIColor.lightGray
    pageControl.currentPageIndicatorTintColor = UIColor.darkGray
    
    self.view.addSubview(pageControl)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore
    viewController: UIViewController)-> UIViewController?{
    guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else{
    return nil
    }
    let previousIndex = viewControllerIndex - 1
    guard previousIndex>=0 else{
    //return orderedViewController.last
    return nil
    }
    guard orderedViewController.count > previousIndex else{
    return nil
    }
    return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else{
    return nil
    }
    let nextIndex = viewControllerIndex + 1
    guard orderedViewController.count != nextIndex else{
    //return orderedViewController.first
    return nil
    }
    guard orderedViewController.count > nextIndex else{
    return nil
    }
    return orderedViewController[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    let pageContentViewController = pageViewController.viewControllers![0]
    self.pageControl.currentPage = orderedViewController.firstIndex(of: pageContentViewController)!
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
