//
//  ViewController.m
//  Currency
//
//  Created by Tongtong Xu on 11/18/15.
//  Copyright © 2015 Tongtong Xu. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *Button;
@property (weak, nonatomic) IBOutlet UILabel *CurrA;
@property (weak, nonatomic) IBOutlet UILabel *CurrB;
@property (weak, nonatomic) IBOutlet UILabel *CurrC;

@end

@implementation ViewController
- (IBAction)ButtonType:(id)sender {
    self.Button.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}
- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies;{
     self.Button.enabled = YES;
    
    double inputValue = [self.inputField.text floatValue];
    double eurovalue = inputValue * currencies.EUR;
    
    NSString *euro = [NSString stringWithFormat:@"%.2f", eurovalue];
    self.CurrA.text = euro;
    
    double jpyvalue = inputValue * currencies.JPY;
    
    NSString *jpy = [NSString stringWithFormat:@"%.2f", jpyvalue];
    self.CurrB.text = jpy;
    
    double gbpvalue = inputValue * currencies.GBP;
    
    NSString *gbp = [NSString stringWithFormat:@"%.2f", gbpvalue];
    self.CurrC.text = gbp;


}
@end
