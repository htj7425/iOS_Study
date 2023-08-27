//
//  AnimUtils.swift
//  HaulTabBar
//
//  Created by Taejun Ha on 2023/08/27.
//

import UIKit

class AnimUtils: NSObject, UITabBarControllerDelegate {
 
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScrollingAnim(tabBarController : tabBarController )
    }


}

class ScrollingAnim: NSObject, UIViewControllerAnimatedTransitioning{
    
    weak var transitionContext: UIViewControllerContextTransitioning?
    var tabBarController: UITabBarController!
    var fromIndex = 0
    
    
    init(tabBarController : UITabBarController){
        self.tabBarController = tabBarController
        self.fromIndex = tabBarController.selectedIndex
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 뷰 만들어주기
        self.transitionContext = transitionContext
        let containerView = transitionContext.containerView
        
        // 원래 뷰
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        // 추가될 뷰
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        containerView.addSubview(toView!.view)
        
        var width = toView?.view.bounds.width
        
        //fromIndex = 기존값
        //tabBarController.selectedIndex = 새로 들어온 값
        //넘어갈 화면이 왼쪽인지 오른쪽인지에 따라 슬라이드 방향 정해주는 if문
        if tabBarController.selectedIndex < fromIndex{
            width = -width!
        }
        
        toView?.view.transform = CGAffineTransform(translationX: width!, y: 0)
        
        UIView.animate(withDuration: self.transitionDuration(using: (self.transitionContext)),
                       animations: //입력되는 뷰
                       {
            toView?.view.transform = CGAffineTransform.identity
            fromView?.view.transform = CGAffineTransform(translationX: -width!, y: 0)
        }) { _ in
            fromView?.view.transform = CGAffineTransform.identity
            self.transitionContext?.completeTransition(!(self.transitionContext?.transitionWasCancelled)!)
        }
    }
    
    
}
