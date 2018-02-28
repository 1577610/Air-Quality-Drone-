//
//  DULCaptureWidget.h
//  DJIUILibrary
//
//  Copyright © 2016 DJI. All rights reserved.
//

#import <DJIUILibrary/DJIUILibrary.h>


/**
 *  Display:
 *  In shooting photo, the widget can show the mode of photo will be taken and the
 *  related setting of that mode as following:
 *    - Single mode.
 *    - HDR mode.
 *    - Burst mode and the number of burst shot will be taken.
 *    - AEB mode and the number of shot will be taken.
 *    - Interval mode.
 *  
 *  Usage:
 *  Preferred Aspect Ratio: 49:65. Check `DULTrailingBarViewController` for an
 *  example of its usage.
 *  
 *  Interaction:
 *  Tapping when in shoot photo mode will take a photo. Tapping when in record video
 *  mode will start/stop recording.
 */
@interface DULCaptureWidget : DULWidget


/**
 *  The current camera mode. Defaults to shoot photo.
 */
@property DJICameraMode mode;

@end
