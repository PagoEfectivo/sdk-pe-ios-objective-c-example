//
//  GenerateCipViewController.h
//  exampleSDK
//
//  Created by gerardo on 20/10/17.
//  Copyright © 2017 orbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenerateCipViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property UIPickerView *currencyPicker;
@property UIPickerView *documentTypePicker;
@property UIDatePicker *dateExpiry;
-(void) setupPiker: (UIPickerView*) picker;
@end
