//
//  DYRateView.m
//  QuickFindNew
//
//  Created by Prosenjit Kolay on 12/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import "DYRateView.h"

static NSString *DefaultFullStarImageFilename = @"star1";
static NSString *DefaultEmptyStarImageFilename = @"star2";
@implementation DYRateView
- (DYRateView *)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame fullStar:[UIImage imageNamed:DefaultFullStarImageFilename] emptyStar:[UIImage imageNamed:DefaultEmptyStarImageFilename]];
}

- (DYRateView *)initWithFrame:(CGRect)frame fullStar:(UIImage *)fullStarImage emptyStar:(UIImage *)emptyStarImage {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        
        _fullStarImage = fullStarImage;
        _emptyStarImage = emptyStarImage;
        
        [self commonSetup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        _fullStarImage = [UIImage imageNamed:DefaultFullStarImageFilename];
        _emptyStarImage = [UIImage imageNamed:DefaultEmptyStarImageFilename];
        
        [self commonSetup];
    }
    return self;
}



- (void)commonSetup
{
    // Include the initialization code that is common to initWithFrame:
    // and initWithCoder: here.
    _padding = 4;
    _numOfStars = 5;
    self.alignment = RateViewAlignmentLeft;
    self.editable = NO;
}

- (void)drawRect:(CGRect)rect
{
    switch (_alignment) {
        case RateViewAlignmentLeft:
        {
            _origin = CGPointMake(0, 0);
            break;
        }
        case RateViewAlignmentCenter:
        {
            _origin = CGPointMake((self.bounds.size.width - _numOfStars * _fullStarImage.size.width - (_numOfStars - 1) * _padding)/2, 0);
            break;
        }
        case RateViewAlignmentRight:
        {
            _origin = CGPointMake(self.bounds.size.width - _numOfStars * _fullStarImage.size.width - (_numOfStars - 1) * _padding, 0);
            break;
        }
    }
    
    float x = _origin.x;
    for(int i = 0; i < _numOfStars; i++) {
        [_emptyStarImage drawAtPoint:CGPointMake(x, _origin.y)];
        x += _fullStarImage.size.width + _padding;
    }
    
    
    float floor = floorf(_rate);
    x = _origin.x;
    for (int i = 0; i < floor; i++) {
        [_fullStarImage drawAtPoint:CGPointMake(x, _origin.y)];
        x += _fullStarImage.size.width + _padding;
    }
    
    if (_numOfStars - floor > 0.01) {
        UIRectClip(CGRectMake(x, _origin.y, _fullStarImage.size.width * (_rate - floor), _fullStarImage.size.height));
        [_fullStarImage drawAtPoint:CGPointMake(x, _origin.y)];
    }
}

- (void)setRate:(CGFloat)rate {
    _rate = rate;
    [self setNeedsDisplay];
    [self notifyDelegate];
}

- (void)setAlignment:(RateViewAlignment)alignment
{
    _alignment = alignment;
    [self setNeedsLayout];
}

- (void)setEditable:(BOOL)editable {
    _editable = editable;
    self.userInteractionEnabled = _editable;
}

- (void)setFullStarImage:(UIImage *)fullStarImage
{
    if (fullStarImage != _fullStarImage) {
      
        _fullStarImage = fullStarImage;
        [self setNeedsDisplay];
    }
}

- (void)setEmptyStarImage:(UIImage *)emptyStarImage
{
    if (emptyStarImage != _emptyStarImage) {
       
        _emptyStarImage = emptyStarImage;
        [self setNeedsDisplay];
    }
}

- (void)handleTouchAtLocation:(CGPoint)location {
    for(int i = _numOfStars - 1; i > -1; i--) {
        if (location.x > _origin.x + i * (_fullStarImage.size.width + _padding) - _padding / 2.) {
            self.rate = i + 1;
            return;
        }
    }
    self.rate = 0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)notifyDelegate {
    if (self.delegate && [self.delegate respondsToSelector:@selector(rateView:changedToNewRate:)]) {
        [self.delegate performSelector:@selector(rateView:changedToNewRate:)
                            withObject:self withObject:[NSNumber numberWithFloat:self.rate]];
    }
}

@end
