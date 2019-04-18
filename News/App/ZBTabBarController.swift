//
//  ZBTabBarController.swift
//  News
//
//  Created by bigfish on 2019/4/10.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

class ZBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //title颜色
        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"
        //添加子控制器
        addChildViewControllers()
        
        NotificationCenter.default.addObserver(self, selector: #selector(DayOrNightButtonDidClicked), name: NSNotification.Name(rawValue: DayOrNightButtonDidClickedNotification), object: nil)
        
    }
    
    /// 接收到点击日夜切换按钮通知
    ///
    /// - Parameter notification: <#notification description#>
    @objc func DayOrNightButtonDidClicked(notification:Notification)  {
        let selected = notification.object as! Bool
        if selected {//夜间
            for childController in children {
                switch childController.title {
                case "首页":
                    setNightChildController(controller: childController, imageName: "home")
                case "视频":
                    setNightChildController(controller: childController, imageName: "video")
                case "火山":
                    setNightChildController(controller: childController, imageName: "huoshan")
                case "未登录":
                    setNightChildController(controller: childController, imageName: "no_login")

                default:
                    break
                }
            }
        }else{//日间
            for childController in children {
                switch childController.title! {
                case "首页":
                    setDayChildController(controller: childController, imageName: "home")
                case "视频":
                    setDayChildController(controller: childController, imageName: "video")
                case "火山":
                    setDayChildController(controller: childController, imageName: "huoshan")
                case "未登录":
                    setDayChildController(controller: childController, imageName: "no_login")
                default:
                    break
                }
            }
        }
    }
    
    /// 添加子控制器
    private func addChildViewControllers() {
        //添加4个子控制器
        setChildViewController(childController: HomeViewController(), title: "首页", imageName: "home")
        setChildViewController(childController: VideoViewController(), title: "视频", imageName: "video")
        setChildViewController(childController: HuoshanViewController(), title: "火山", imageName: "huoshan")
        setChildViewController(childController: MineViewController(), title: "未登录", imageName: "no_login")
        
        //通过KVC 设置 tabBar 来添加修改Button
        setValue(ZBTabBar(), forKey: "tabBar")
    }
    
    /// 设置夜间控制器
    private func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    /// 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    
    /// 初始化子控制器
    private func setChildViewController(childController: UIViewController,
                            title:String,
                            imageName:String) {
        // 设置 tabbar 文字和图片
        if UserDefaults.standard.bool(forKey: IS_NIGHT) {
            setNightChildController(controller: childController, imageName: imageName)
        } else {
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        // 添加导航控制器为 TabBarController 的子控制器
        addChild(ZBNavigationController(rootViewController: childController))
    }
    
    
    
    
    
    


}
