//
//  addViewController.m
//  TcoreData
//
//  Created by bob on 16/9/5.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "addViewController.h"
#import "Person.h"
@interface addViewController ()
{
    
    __weak IBOutlet UITextField *NameTF;
    
    __weak IBOutlet UITextField *ageTF;
 
    __weak IBOutlet UISegmentedControl *segment;
    
    NSString *sex;
}

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [segment addTarget:self action:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];
    
    if (self.type== addType) {
        
         sex=@"男";
        
    }else{
        
        sex=self.sexType;
        
        if ([self.sexType isEqualToString:@"男"]) {
      
            [segment setSelectedSegmentIndex:0];
        }else{

            
            [segment setSelectedSegmentIndex:1];
            
        }
        
        NameTF.text=self.name;
        
        ageTF.text=[NSString stringWithFormat:@"%ld",self.age];
        
    }
    
   
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    
    
}


-(void)segmentAction:(UISegmentedControl *)Seg
{
    NSInteger index=Seg.selectedSegmentIndex;
    
    
    switch (index) {
        case 0:
        {
            
          sex=@"男";
        }
            
            break;
        case 1:
        {
            
        sex=@"女";
        
        }
            break;
            
        default:
            break;
    }
    
}




- (IBAction)SaveAction:(UIButton *)sender {
    
    
    if (NameTF.text.length==0||ageTF.text.length==0) {
        
     
        return;
        
    }

       NSDate *today = [NSDate date];
    
    
    //插入数据库
    [Person insertPersonname:NameTF.text andage:[ageTF.text integerValue] andupdate:today andsex:sex];
   
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
