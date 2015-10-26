//
//  ViewController.m
//  Test
//
//  Created by Roy Zou on 10/24/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.label.text = @"dddjsalkjflk;sajdfl;kasjdfl;kjasl;dkfjal;skdjf;lkajsdfl;kjasdl;fkjals;kdjfl;ksadjfl;ksajd;flkjsadl;jkfl;sakjdf;lajksldfkjsaldkjfls;akdjfl;skajdfl;kjasdl;fkjsadl;kjfals;kdjfl;sadkjf;ljksadlkjfls;dakjflksdajfl;kdsjafl;kjsadl;fjksal;dkfjadls;kjfl;asjkdflasjdflk;sadjfl;skadjfl;sadjkf;laksdjf;lksadjf;lksajd;fljkaksl;djfl;aksdfjsdakljfalk;jdflkasdjfakl;sdfjals;kdjfdkls;ajfsakldjfas;dlkjf;lsadjkfasdjf;lkasdjfl;kajsdfl;jasdfl;kjas;dlfjka;sdfjkl;sadjfkl;asdjf;lkjasd;lfjkaskl;djf;aldjksfj";
    [self.label sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, self.scrollView.bounds.size.height*100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
