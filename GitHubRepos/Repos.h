//
//  Repos.h
//  GitHubRepos
//
//  Created by swcl on 2017-05-22.
//  Copyright © 2017 Shreve LaFramenta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repos : NSObject

@property (nonatomic, strong) NSString *repoTitle;

-(instancetype)initWithTitle:(NSString*)title;


@end
