//
//  RepoCell.m
//  GitHubRepos
//
//  Created by swcl on 2017-05-23.
//  Copyright © 2017 Shreve LaFramenta. All rights reserved.
//

#import "RepoCell.h"

@implementation RepoCell

- (void) updateDisplay {
    self.repoCellLabel.text = self.repo.repoTitle;


}


@end
