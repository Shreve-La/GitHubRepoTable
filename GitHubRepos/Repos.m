//
//  Repos.m
//  GitHubRepos
//
//  Created by swcl on 2017-05-22.
//  Copyright © 2017 Shreve LaFramenta. All rights reserved.
//

#import "Repos.h"

@implementation Repos

-(instancetype)initWithTitle:(NSString*)title
{
self = [super init];
if(self) {
    _repoTitle = title;
}
return self;
}

@end
