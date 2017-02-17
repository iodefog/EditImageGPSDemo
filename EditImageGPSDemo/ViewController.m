//
//  ViewController.m
//  EditImageGPSDemo
//
//  Created by LHL on 17/2/17.
//  Copyright © 2017年 lihongli. All rights reserved.
//

#import "ViewController.h"

#import "HLImageInfoUtils.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *pickerButton;
@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
@property (weak, nonatomic) IBOutlet UITextField *longtitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *latituedTextField;

@property (strong, nonatomic) HLImageInfoUtils *imageInfoUtils;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)saveButton:(id)sender {
    if (self.longtitudeTextField.text.length == 0 || self.latituedTextField.text.length == 0 || !self.albumImageView.image) {
        return;
    }
    [self.imageInfoUtils setLocation2D:CLLocationCoordinate2DMake([self.latituedTextField.text doubleValue], [self.longtitudeTextField.text doubleValue])];
    [self.imageInfoUtils save];
}

- (IBAction)pickerClicked:(id)sender {
//    [self editImageInfoWithImageURL:nil];
    
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    pickerVC.showsCameraControls = NO;
    pickerVC.delegate = self;
    [self presentViewController:pickerVC animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self dismissViewControllerAnimated:YES completion:^{
        self.albumImageView.image = info[UIImagePickerControllerOriginalImage];
//        [self editImageInfo:self.albumImageView.image];
        [self editImageInfoWithImageURL:info[UIImagePickerControllerReferenceURL]];
    }];
}

- (void)editImageInfoWithImageURL:(NSURL *)imageUrl{
    if (!imageUrl) {
        imageUrl = [[NSBundle mainBundle] URLForResource:@"1024" withExtension:@"JPG"];
    }
    self.imageInfoUtils = [[HLImageInfoUtils alloc] initWithImageURL:imageUrl];

}


- (void)editImageInfoWithImage:(UIImage *)image{
    self.imageInfoUtils = [[HLImageInfoUtils alloc] initWithImage:image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
