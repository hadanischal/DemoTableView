//
//  ColorsConstant.h
//  DemoAppiOS
//
//  Created by Nischal Hada on 4/10/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

#ifndef ColorsConstant_h
#define ColorsConstant_h


#define rgb(r, g, b) [UIColor colorWithRed:(float)(r/255.0) green:(float)(g/255.0) blue:(float)(b/255.0) alpha:1]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#define whiteTextColor UIColorFromRGB(0Xffffff)
#define blackTextColor UIColorFromRGB(0X000000)



#endif /* ColorsConstant_h */
