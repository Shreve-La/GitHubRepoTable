//
//  RepoCell.h
//  GitHubRepos
//
//  Created by swcl on 2017-05-23.
//  Copyright © 2017 Shreve LaFramenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repos.h"

@interface RepoCell : UITableViewCell

@property (weak, nonatomic) Repos *repo;
@property (weak, nonatomic) IBOutlet UILabel *repoCellLabel;

-(void)updateDisplay;


@end
