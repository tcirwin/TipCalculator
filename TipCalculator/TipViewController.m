//
//  TipViewController.m
//  TipCalculator
//
//  Created by Therin Irwin on 9/17/13.
//  Copyright (c) 2013 Therin Irwin. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;

- (IBAction)onTap:(id)sender;
- (void)updateTip;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateTip];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateTip];
}

- (void)updateTip {
    float bill = _billAmountField.text.floatValue;
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    
    float tip = [tipValues[self.tipPercent.selectedSegmentIndex] floatValue] * bill;
    float totalVal = tip + bill;
    
    _tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tip];
    _total.text = [NSString stringWithFormat:@"$%0.2f", totalVal];

}

@end
