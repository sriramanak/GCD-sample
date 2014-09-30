//
//  MainTableViewController.m
//  SampleGCD
//
//  Created by paradigm creatives on 9/30/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()
{
NSMutableData *Resdata;
    NSMutableArray *imgArray;
    
}

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Resdata=[[NSMutableData alloc]init];
    imgArray=[[NSMutableArray alloc]init];
    [imgArray addObject:@"https://dz1uozffojv6d.cloudfront.net/2014-7-17/server/afec8f10-561a-43f3-b57a-2faeaf461ed8_image01_sky_00001.png"];
    [imgArray addObject:@"https://dz1uozffojv6d.cloudfront.net/2014-7-17/server/35db43c7-7295-48e4-adfd-838a39aea34b_image01_vol_1_00001.png"];
    [imgArray addObject:@" https://dz1uozffojv6d.cloudfront.net/2014-7-14/server/e6dee19d-96c0-4a25-8a3b-81f473803068_image01_man.png"];
    [imgArray addObject:@"https://dz1uozffojv6d.cloudfront.net/2014-7-14/server/5c6dc87f-fd40-4c56-984f-48a064947ecf_image01_man_1.png"];
    
   // NSURL *url=[NSURL URLWithString:@"https://dz1uozffojv6d.cloudfront.net/2014-7-17/server/afec8f10-561a-43f3-b57a-2faeaf461ed8_image01_sky_00001.png"];
   // NSURLRequest *req=[NSURLRequest requestWithURL:url];
    //NSURLConnection *conn=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    //[conn start];
    
    //NSData *data=[NSData dataWithContentsOfURL:url];
    
}
/*
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed");
    
}
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"response received");
}
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [Resdata appendData:data];
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error=nil;
    id json=[NSJSONSerialization JSONObjectWithData:Resdata options:0 error:&error];
    NSLog(@" response data Is %@",json);
    
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [imgArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    NSString *imageString = [imgArray objectAtIndex:indexPath.row];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:imageString];
        NSData *imagedata=[NSData dataWithContentsOfURL:imageUrl];
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.imageView setImage:[UIImage imageWithData:imagedata]];
        });
    });

    //cell.textLabel.text=@"ram";
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
