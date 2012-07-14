class AppDelegate
	attr_accessor :window, :navigationController

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @tabbar = UITabBarController.alloc.init
    @listController = ListController.alloc.initWithStyle(UITableViewStyleGrouped)

    @tabbar.viewControllers = [@listController]

    tab1 = UITabBarItem.alloc.initWithTitle('List', image:nil, tag:1)
    @listController.setTabBarItem tab1

    @tabbar.selectedIndex = 0

    navigationController.toolbarHidden = true
    return true if RUBYMOTION_ENV == 'test'

    @window.rootViewController = self.navigationController
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end

  def navigationController
    @navigationController ||= UINavigationController.alloc.initWithRootViewController(@tabbar)
  end
end
