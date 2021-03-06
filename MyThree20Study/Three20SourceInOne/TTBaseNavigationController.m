//
// Copyright 2009-2010 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "TTBaseNavigationController.h"

// UINavigator
#import "TTBaseNavigator.h"
#import "TTURLMap.h"

// UINavigator (Additions)
#import "UIViewController+TTNavigator.h"

// UICommon
#import "TTGlobalUICommon.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTBaseNavigationController


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIViewAnimationTransition)invertTransition:(UIViewAnimationTransition)transition {
  switch (transition) {
    case UIViewAnimationTransitionCurlUp:
      return UIViewAnimationTransitionCurlDown;
    case UIViewAnimationTransitionCurlDown:
      return UIViewAnimationTransitionCurlUp;
    case UIViewAnimationTransitionFlipFromLeft:
      return UIViewAnimationTransitionFlipFromRight;
    case UIViewAnimationTransitionFlipFromRight:
      return UIViewAnimationTransitionFlipFromLeft;
    default:
      return UIViewAnimationTransitionNone;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)pushAnimationDidStop {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UINavigationController


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIViewController*)popViewControllerAnimated:(BOOL)animated {
  if (animated) {
    NSString* URL = self.topViewController.originalNavigatorURL;
    UIViewAnimationTransition transition = URL
      ? [[TTBaseNavigator globalNavigator].URLMap transitionForURL:URL]
      : UIViewAnimationTransitionNone;
    if (transition) {
      UIViewAnimationTransition inverseTransition = [self invertTransition:transition];
      return [self popViewControllerAnimatedWithTransition:inverseTransition];
    }
  }

  return [super popViewControllerAnimated:animated];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)pushViewController: (UIViewController*)controller
    animatedWithTransition: (UIViewAnimationTransition)transition {
  [self pushViewController:controller animated:NO];

  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:TT_FLIP_TRANSITION_DURATION];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationDidStopSelector:@selector(pushAnimationDidStop)];
  [UIView setAnimationTransition:transition forView:self.view cache:YES];
  [UIView commitAnimations];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIViewController*)popViewControllerAnimatedWithTransition:(UIViewAnimationTransition)transition {
  UIViewController* poppedController = [self popViewControllerAnimated:NO];

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDuration:TT_FLIP_TRANSITION_DURATION];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationDidStopSelector:@selector(pushAnimationDidStop)];
  [UIView setAnimationTransition:transition forView:self.view cache:NO];
  [UIView commitAnimations];

  return poppedController;
}


@end

