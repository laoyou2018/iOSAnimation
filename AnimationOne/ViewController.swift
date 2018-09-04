//
//  ViewController.swift
//  AnimationOne
//
//  Created by zhonghangxun on 2018/9/4.
//  Copyright © 2018年 zhonghangxun. All rights reserved.
//

/*
    控制屏幕上的原型小球，使其水平向右滑动200个point
    交互式动画
    UIViewPropertyAnimator
 */

import UIKit

class ViewController: UIViewController {
    
    var circle :UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circle = UIView(frame: CGRect(x: 20, y: 40, width: 60, height: 60))
        circle?.backgroundColor = UIColor.green
        circle?.layer.cornerRadius = 30.0
        self.view.addSubview(circle!)
        
//        self.moveOne()
//        self.moveTwo()
        self.moveThree()
        
    }
    
    ///UIViewPropertyAnimator 实现
    func moveOne() {
        let animator = UIViewPropertyAnimator(duration: 2.0, curve: .linear) {
            self.circle?.frame = (self.circle?.frame.offsetBy(dx: 200, dy: 0))!
        }
        animator.startAnimation()
    }
    
    /// UIView Animation 实现
    func moveTwo() {
        UIView.animate(withDuration: 2.0) {
            self.circle?.frame = (self.circle?.frame.offsetBy(dx: 200, dy: 0))!
        }
    }
    
    /// CALayer 实现
    func moveThree() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = self.circle?.center.x
        animation.toValue = (self.circle?.center.x)! + 200
        animation.duration = 2.0
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        circle?.layer.add(animation, forKey: "position.x")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        print("动画开始执行...")
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("动画结束执行...")
    }
}










