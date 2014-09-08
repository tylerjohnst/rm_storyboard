// Generated by IB v0.6.0 gem. Do not edit it manually
// Run `rake ib:open` to refresh

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface AppDelegate: UIResponder <UIApplicationDelegate>
@end

@interface HelloController: UIViewController

@property IBOutlet UIScrollView * scroller;
@property IBOutlet id btn_hello;

-(IBAction) say_hello:(id) sender;

@end

@interface PlayerDetailsViewController: UITableViewController

@property IBOutlet UITextField * nameTextField;

-(IBAction) done:(id) sender;
-(IBAction) cancel:(id) sender;

@end

@interface PlayersViewController: UITableViewController
-(IBAction) player_details_view_cancelled:(id) controller;
-(IBAction) player_details_view_saved:(id) controller;
-(IBAction) child_of_view:(id) view;
-(IBAction) rating_image_for:(id) score;

@end

@interface Player: NSObject
@end

@interface PlayerCell: UITableViewCell

@property IBOutlet UILabel * gameLabel;
@property IBOutlet UILabel * nameLabel;
@property IBOutlet UIImageView * ratingImage;

@end
