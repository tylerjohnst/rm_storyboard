class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    Player.create("Bill Evans", "Tic-Tac-Toe", 4)
    Player.create("Oscar Petterson", "Chess", 5)
    Player.create("John Smith", "Solitaire", 2)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    storyboard = UIStoryboard.storyboardWithName("Main", bundle:nil)
    root_view_controller = storyboard.instantiateViewControllerWithIdentifier("Main")

    navigation_controller = root_view_controller.viewControllers[0]
    players_view_controller = navigation_controller.viewControllers[0]
    players_view_controller.players = Player.collection

    @window.rootViewController = root_view_controller
    @window.makeKeyAndVisible
    true
  end
end
