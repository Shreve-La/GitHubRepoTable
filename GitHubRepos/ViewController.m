//
//  ViewController.m
//  GitHubRepos
//
//  Created by swcl on 2017-05-22.
//  Copyright © 2017 Shreve LaFramenta. All rights reserved.
//

#import "ViewController.h"
#import "Repos.h"
#import "RepoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *allRepos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allRepos = [NSMutableArray new];
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/shreve-la/repos"]; // 1
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url]; // 2
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 3
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 4
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) { // 1
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]; // 2
        
        if (jsonError) { // 3
            // Handle the error
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        // If we reach this point, we have successfully retrieved the JSON from the API
        for (NSDictionary *repo in repos) { // 4
            
            NSString *repoName = repo[@"name"];
            NSLog(@"repo: %@", repoName);
            Repos *repoInst = [[Repos alloc] initWithTitle: repoName];
            [self.allRepos addObject: repoInst];
        }
        [self.tableView reloadData];
    }];
    
    [dataTask resume]; // 6
}
//--> MARK Methods Required for Table View Protocol
    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
    }
    
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.allRepos.count;
    }
    
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        RepoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.repo = self.allRepos[indexPath.row];
        [cell updateDisplay];
        return cell;
    }

    
    
    
    
    



@end


