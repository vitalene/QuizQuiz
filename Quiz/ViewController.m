//  ViewController.m
//  Quiz


#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) IBOutlet UILabel *questionLabel;
@property (nonatomic) IBOutlet UILabel *answerLabel;
@property (nonatomic) NSArray *questions;
@property (nonatomic) NSArray *answers;
@property (nonatomic) int currentQuestionIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.questions = @[ @"What is your name?",
                        @"What is your quest?",
                        @"What is your favorite color?" ];
    self.answers = @[ @"Sir Galahad of Camelot",
                      @"I seek the Grail",
                      @"Blue. No, yel-" ];
    
    
    self.questionLabel.text = self.questions[self.currentQuestionIndex];
}


- (IBAction)showNextQuestion:(id)sender {
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex == self.questions.count) {
        self.currentQuestionIndex = 0;
    }
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
    [self animatedLabelTransitions];
}
- (IBAction)showAnswer:(id)sender  {
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

-(void)animatedLabelTransitions {
    [UIView animateWithDuration:0.5 animations:^{
        self.questionLabel.alpha = 1.0;
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.questionLabel.alpha = 0.0;
}



@end
