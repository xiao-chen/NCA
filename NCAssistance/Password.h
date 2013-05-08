//
//  Password.h
//  NCAssistance
//
//  Created by Yuyi Zhang on 5/4/13.
//  Copyright (c) 2013 Camel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Password : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * website;
@property (nonatomic, retain) NSString * notes;

@end
