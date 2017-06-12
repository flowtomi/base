//
//  UIGestureRecognizer+BlocksKit.h
//  BlocksKit
//

#import <UIKit/UIKit.h>



@interface UIGestureRecognizer (BlocksKit)


+ (id)bk_recognizerWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block delay:(NSTimeInterval)delay;

/** Initializes an allocated gesture recognizer that will call the given block
 after a given delay.
 
 An alternative to the designated initializer.
 
 @return An initialized instance of a concrete UIGestureRecognizer subclass or `nil`.
 @param block The block which handles an executed gesture.
 @param delay A number of seconds after which the block will fire.
 */
- (id)bk_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block delay:(NSTimeInterval)delay NS_REPLACES_RECEIVER;

/** An autoreleased gesture recognizer that will call the given block.
 
 For convenience and compatibility reasons, this method is indentical
 to using recognizerWithHandler:delay: with a delay of 0.0.
  
 @return An initialized and autoreleased instance of a concrete UIGestureRecognizer
 subclass, or `nil`.
 @param block The block which handles an executed gesture.
 */
+ (id)bk_recognizerWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block;

/** Initializes an allocated gesture recognizer that will call the given block.
 
 This method is indentical to calling initWithHandler:delay: with a delay of 0.0.

 @return An initialized instance of a concrete UIGestureRecognizer subclass or `nil`.
 @param block The block which handles an executed gesture.
 */
- (id)bk_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block NS_REPLACES_RECEIVER;

/** Allows the block that will be fired by the gesture recognizer
 to be modified after the fact.
 */
@property (nonatomic, copy, setter = bk_setHandler:) void (^bk_handler)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location);

/** Allows the length of the delay after which the gesture
 recognizer will be fired to modify. */
@property (nonatomic, setter = bk_setHandlerDelay:) NSTimeInterval bk_handlerDelay;

/** If the recognizer happens to be fired, calling this method
 will stop it from firing, but only if a delay is set.

 @warning This method is not for arbitrarily canceling the
 firing of a recognizer, but will only function for a block
 handler *after the recognizer has already been fired*.  Be
 sure to make your delay times accomodate this likelihood.
 */

- (void)bk_cancel;

/**
  handele multipel clicks
 
 */



@end
