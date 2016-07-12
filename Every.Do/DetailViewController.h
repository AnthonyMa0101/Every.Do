//
//  DetailViewController.h
//  Every.Do
//
//  Created by Anthony Ma on 2016-07-12.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

