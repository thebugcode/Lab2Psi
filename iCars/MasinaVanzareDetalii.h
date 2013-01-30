//
//  MasinaVanzareDetalii.h
//  iCars
//
//  Created by mac on 6/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MasinaVanzareDetalii : UIViewController {
	NSString *producatorString;
	IBOutlet UILabel *Caroserie;
	IBOutlet UILabel *Producator;
	IBOutlet UILabel *Model;
	IBOutlet UILabel *AnProductie;
	IBOutlet UILabel *VolumMotor;
	IBOutlet UILabel *Masa;
	IBOutlet UILabel *Categorie;
	IBOutlet UILabel *Pret;
	IBOutlet UILabel *DataVanzare;
	IBOutlet UIImageView *myImage;

}
@property (nonatomic,retain)NSString *producatorString;
@property (nonatomic,retain)IBOutlet UIImageView* myImage;
@property (nonatomic,retain)IBOutlet UILabel* Caroserie;
@property (nonatomic,retain)IBOutlet UILabel* Producator;
@property (nonatomic,retain)IBOutlet UILabel* Model;
@property (nonatomic,retain)IBOutlet UILabel* AnProductie;
@property (nonatomic,retain)IBOutlet UILabel* VolumMotor;
@property (nonatomic,retain)IBOutlet UILabel* Masa;
@property (nonatomic,retain)IBOutlet UILabel* Categorie;
@property (nonatomic,retain)IBOutlet UILabel* Pret;
@property (nonatomic,retain)IBOutlet UILabel* DataVanzare;
@end
