//
//  BaseTabBarViewController.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/1.
//

import Foundation
import XMUtil
import SPHomeUIExtension
import SPUserCenterUIExtension
import SPMediator
public class BaseTabBarViewController: UITabBarController {


    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
        setupAppearance()

        
    }
}

extension BaseTabBarViewController{
    
    private func setupViewControllers(){

        
        guard let homeVc  =  SPMediator.shared().SPHomeUI_homeViewController(),
              let userCenterVc  =  SPMediator.shared().SPUserCenterUI_userCenterViewController() else{
              
            return
        }        
        
//       let homeVc =   XEMediator.shared()?.XEAccountUI_launchViewController()
//               let tingVc =   XEMediator.shared()?.XEAccountUI_launchViewController()
//               let playVc =   XEMediator.shared()?.XEAccountUI_launchViewController()
//               let discoverVc =   XEMediator.shared()?.XEAccountUI_launchViewController()
//               let accountVc =   XEMediator.shared()?.XEAccountUI_launchViewController()
        
        let controllers:[UIViewController]  =
            [homeVc,UIViewController(),UIViewController(),UIViewController(),userCenterVc]
//        [SPHomeViewController(),SPDeveloperViewController(),LearningCenterViewController(),SPAlgorithmViewController(),MineViewController()]
        let normalImageNames = ["icon_play_stop","icon_play_stop","","icon_play_stop","icon_play_stop"]
        let selectImageNames = ["icon_play_stop","icon_play_stop","","icon_play_stop","icon_play_stop"]
        
        let mineTitle = "我的"
//            !(LoginHelper.sharedInstance.userInfo?.isLogin ?? false)  ? "未登录" : "账户"
        let titles = ["首页","我听","","算法",mineTitle]
        
        for (index, vc) in controllers.enumerated() {
            
            vc.tabBarItem.title = titles[index]
            vc.tabBarItem.image = UIImage(named: normalImageNames[index])
            vc.tabBarItem.selectedImage = UIImage(named: selectImageNames[index])
            //设置选中图标的颜色
            self.tabBar.tintColor = UIColor.red
      
            addChild( BaseNavViewController(rootViewController: vc))
            
        }
        self.selectedIndex = 0
        
    }
    private func setupAppearance(){
        
        let tabBar = UITabBarItem.appearance()
        let attrs_Normal = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]
        let attrs_Select = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.red]

        tabBar.setTitleTextAttributes(attrs_Normal, for: .normal)
        tabBar.setTitleTextAttributes(attrs_Select, for: .selected)
    }

}
