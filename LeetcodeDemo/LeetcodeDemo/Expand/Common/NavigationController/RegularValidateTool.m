//
//  RegularValidateTool.m
//  M
//
//  Created by M on 2017/6/13.
//  Copyright © 2017年 M. All rights reserved.
//

#import "RegularValidateTool.h"

#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" //数字英文
@implementation RegularValidateTool

#pragma mark 手机号验验证+座机验证
+ (BOOL)validatePhone:(NSString *)phone
{
    return [self validateMobilePhone:phone] || [self validateHomeNumber:phone];
}


#pragma mark 手机号验证
+ (BOOL)validateMobilePhone:(NSString *)phone
{
    //    NSString *numberRegex = @"0?(13[0-9]|15[012356789]|18[0123456789]|14[0123456789]|17[0123456789])[0-9]{8}";
    
//    NSString *numberRegex = @"^((\\+86)|(86)(0))?(13[0-9]|15[012356789]|18[0123456789]|14[0123456789]|17[0123456789])[0-9]{8}";
    NSString *numberRegex = @"^((1[0-9][0-9]))\\d{8}$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:phone];
}

#pragma mark 座机号验证
+ (BOOL)validateHomeNumber:(NSString *)homeNo
{
//    NSString *numberRegex = @"^[0-9-()()]{7,18}$";
    
    NSString *numberRegex = @"(?:(\\(\\+?86\\))(0[0-9]{2,3}\\-?)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?)|(?:(86-?)?(0[0-9]{2,3}\\-?)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?)";
    
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:homeNo];
}

#pragma mark 用户名验证
+ (BOOL)validateName:(NSString *)name
{
    NSString *numberRegex = @"^[a-z0-9A-Z_\u4E00-\u9FA5]{1,15}$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:name];
}
#pragma mark - 用户身份证验证
+(BOOL)validateIdCard:(NSString *)userID
{
    //长度不为18的都排除掉
    if (userID.length!=18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [userID substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return YES;
            }else
            {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
}

#pragma mark 公司名验证
+ (BOOL)validateCompanyName:(NSString *)name
{
    NSString *numberRegex = @"^[a-z0-9A-Z_\u4E00-\u9FA5]{5,20}$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:name];
}


/**
 *  纯数字验证
 */
+ (BOOL)isNumber:(NSString*)number {
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:number];
}

#pragma mark 验证时间格式
+ (BOOL)isTime:(NSString *)time {
    NSString *numberRegex = @"^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\\d):[0-5]?\\d$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:time];
}

#pragma mark 只含有汉字、数字、字母、下划线不能以下划线开头和结尾
+ (BOOL)isUserName:(NSString *)username
{
    NSString *UserNameRegex = @"[a-zA-Z0-9_-\u4E00-\u9FA5\\s]{6,14}";
    NSPredicate *UserNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",UserNameRegex];
    return [UserNameTest evaluateWithObject:username];
}

#pragma mark 密码正则
+ (BOOL)isPassWord:(NSString *)password
{
    NSString *PassWordRegex = @"[a-z0-9A-Z~·`!！@#￥$%^……&*（()）\\-——\\-_=+【\\[\\]】｛{}｝\\|、\\\\；;：:‘'“”\"，,《<。.》>、/？?]{5,16}";
    NSPredicate *PassWordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PassWordRegex];
    return [PassWordTest evaluateWithObject:password];
}

#pragma mark 是否为邮箱
+ (BOOL)isEmail:(NSString *)email
{
    NSString *emailRegex = @"([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:email];
}



#pragma mark 比较两个时间的先后  firstDate早返回NO
+ (BOOL)compareDateWithFirstDate:(NSString *)firstDate secondDate:(NSString *)secondDate
{
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *first = [formater dateFromString:firstDate];
    NSDate *second = [formater dateFromString:secondDate];

    NSTimeInterval f = [first timeIntervalSince1970] * 1;
    NSTimeInterval s = [second timeIntervalSince1970] * 1;

    if (f - s > 0) {
        return YES;
    } else {
        return NO;
    };
}

#pragma mark 判断NSString中是否有表情
+ (BOOL)isContainsEmoji:(NSString *)string {
    __block BOOL isEomji = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    isEomji = YES;
                }
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                if (!(9312 <= hs && hs <= 9327)) { // 9312代表①   表示①至⑯
                    isEomji = YES;
                }
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                isEomji = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                isEomji = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                isEomji = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                isEomji = YES;
            }
            if (!isEomji && substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3) {
                    isEomji = YES;
                }
            }
        }
    }];
    return isEomji;
}

#pragma mark 当前时间加减几个月份
+ (NSString *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [comps setMonth:month];
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];

    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *nowDate = [formater stringFromDate:mDate];

    return nowDate;
}

+ (NSString *)calculateEndTimeWithStartTime:(NSString *)startTime days:(float)days
{
    // 截取当前的小时数
    int hour = [[[startTime substringFromIndex:11] substringToIndex:2] intValue];
    int num = days / 0.5;
    int plusDay; // 需要加的天数
    BOOL isFloat;// 是不是小数 是小数在早上请假就是12:00结尾 在下午则是18:00 是整数反之

    NSDateFormatter *dateform = [[NSDateFormatter alloc]init];
    [dateform setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *sTime = [dateform dateFromString:startTime];

    if (hour == 8) { // 早上请假
        if (num % 2 == 0) { // 是整数
            plusDay = days - 1;
            isFloat = NO;
        } else { // 是小数
            plusDay = days;
            isFloat = YES;
        }

        // 加减的天数
        NSTimeInterval days = 24 * 60 * 60 * plusDay;
        NSDate *endDate = [sTime dateByAddingTimeInterval:days];
        NSString *endTime = [[dateform stringFromDate:endDate] substringToIndex:10];
        if (isFloat) {  // 12:00
            endTime = [NSString stringWithFormat:@"%@ 12:00:00",endTime];
        } else {
            endTime = [NSString stringWithFormat:@"%@ 18:00:00",endTime];
        }
        return endTime;
    } else { // 晚上请假
        plusDay = days;
        if (num % 2 == 0) { // 是整数
            isFloat = NO;
        } else { // 是小数
            isFloat = YES;
        }

        // 加减的天数
        NSTimeInterval days = 24 * 60 * 60 * plusDay;
        NSDate *endDate = [sTime dateByAddingTimeInterval:days];
        NSString *endTime = [[dateform stringFromDate:endDate] substringToIndex:10];
        if (!isFloat) {  // 12:00
            endTime = [NSString stringWithFormat:@"%@ 12:00:00",endTime];
        } else {
            endTime = [NSString stringWithFormat:@"%@ 18:00:00",endTime];
        }
        return endTime;
    }
}

+ (BOOL)isNumberOrDecimal:(NSString *)number
{
    NSString *numberRegex = @"^[0-9]+([.]{0}|[.]{1}[0-9]+)$";
    NSPredicate *PassWordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    return [PassWordTest evaluateWithObject:number];
}

//快速返回字符串 长度
+(float)longFloatWithstring:(NSString *)aString
                  andHeight:(float)aHeigt
                    andSize:(float)aSize
{
    
    NSDictionary *attribute =@{NSFontAttributeName:[UIFont systemFontOfSize:aSize]};
    
    
    CGSize textSiz =[aString boundingRectWithSize:CGSizeMake(MAXFLOAT, aHeigt) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    float textHeight = textSiz.width;
    return textHeight;
}
//快速返回字符串 高度
+(float)hightFloatWithstring:(NSString *)aString
                    andWidth:(float)aWidth
                     andSize:(float)aSize
{
    NSDictionary *attribute =@{NSFontAttributeName:[UIFont systemFontOfSize:aSize]};
    
    CGSize textSiz =[aString boundingRectWithSize:CGSizeMake(aWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    float textWidth = textSiz.height;
    return textWidth;
}

/**
 删除emoji表情
 */
+ (NSString *)disable_emoji:(NSString *)text{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]"options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}

/**
 只能输入汉字，数字，英文，括号，下划线，横杠，空格
 */
+(NSString *)filterCharactors:(NSString *)string{
    
    NSString *regular = @"[^a-zA-Z0-9（）_\u4E00-\u9FA5\\s-]"; //
    NSString *str = [[self class] filterCharactor:string withRegex:[NSString stringWithFormat:@"%@",regular]];
    
    return str;
}
/**
 只能输入数字，英文
 */
+(NSString *)filterCharactorsNumbersAndLetters:(NSString *)string{
    
    NSString *regular = @"[^a-zA-Z0-9\u4E00-\u9FA5\\s]"; //
    NSString *str = [[self class] filterCharactor:string withRegex:[NSString stringWithFormat:@"%@",regular]];
    return str;
}

/**
 判断是否存在特殊字符 只能输入汉字，数字，英文，括号，下划线，横杠，空格
 */
+ (BOOL)isContainsSpecialCharacters:(NSString *)searchText
{
    return  [[self class]isContainsSpecialCharacters:searchText regular:@"[^a-zA-Z0-9（）_\u4E00-\u9FA5\\s-]"];
}

/**
 判断是否是英文和数字
 */
+ (BOOL)isContainsNumbersAndLetters:(NSString *)searchText
{
    return  [[self class]isContainsSpecialCharacters:searchText regular:@"[^a-zA-Z0-9]"];
}

/**
 根据正则屏蔽特殊字符
 regular:正则
 */
+ (BOOL)isContainsSpecialCharacters:(NSString *)searchText regular:(NSString *)regular
{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regular options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    if (result) {
        return YES;
    }else {
        return NO;
    }
}

/**
 根据正则过滤特殊字符
 */
+ (NSString *)filterCharactor:(NSString *)string withRegex:(NSString *)regexStr{
    NSString *searchText = string;
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *result = [regex stringByReplacingMatchesInString:searchText options:NSMatchingReportCompletion range:NSMakeRange(0, searchText.length) withTemplate:@""];
    return result;
}





/**
 除去特殊字符并限制字数的textFiled
 */
+ (void)restrictionInputTextFieldMaskSpecialCharacter:(UITextField *)textField maxNumber:(NSInteger)maxNumber{
    
    if ([[self class]isContainsEmoji:textField.text]){
        textField.text = [[self class]disable_emoji:textField.text];
        return;
    }
    if ([[self class]isContainsSpecialCharacters:textField.text]){
        textField.text = [[self class]filterCharactors:textField.text];
        return;
    }
    [[self class]restrictionInputTextField:textField maxNumber:maxNumber];
}



/**
 除去特殊字符并限制字数的TextView
 */
+ (void)restrictionInputTextViewMaskSpecialCharacter:(UITextView *)textView maxNumber:(NSInteger)maxNumber{
    
    if ([[self class]isContainsEmoji:textView.text]){
        textView.text = [[self class]disable_emoji:textView.text];
        return;
    }
    if ([[self class]isContainsSpecialCharacters:textView.text]){
        textView.text = [[self class]filterCharactors:textView.text];
        return;
    }
    [[self class]restrictionInputTextView:textView maxNumber:maxNumber];
}

/**
 textFiled限制字数
 */
+ (void)restrictionInputTextField:(UITextField *)textField maxNumber:(NSInteger)maxNumber{
    
    NSString *toBeString = textField.text;  
    NSString *lang = textField.textInputMode.primaryLanguage; // 键盘输入模式
    if([lang isEqualToString:@"zh-Hans"]) { //简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if(!position) {
            
        if(toBeString.length > maxNumber) {
            
                textField.text = [[self class] subStringWith:toBeString ToIndex:maxNumber];

            }
        } else{ //有高亮选择的字符串，则暂不对文字进行统计和限制
            
        }
    }
    else{ //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        
        if(toBeString.length > maxNumber) {

            //防止表情被截断
            textField.text = [[self class] subStringWith:toBeString ToIndex:maxNumber];
        }
    }
    
}

/**
 防止截emoji表情被截断
 */
+ (NSString *)subStringWith:(NSString *)string ToIndex:(NSInteger)index{
    
    NSString *result = string;
    if (result.length > index) {
        NSRange rangeIndex = [result rangeOfComposedCharacterSequenceAtIndex:index];
        result = [result substringToIndex:(rangeIndex.location)];
    }
    return result;
}


/**
 textView限制字数
 */
+ (void)restrictionInputTextView:(UITextView *)textView maxNumber:(NSInteger)maxNumber{
    
    NSString *toBeString = textView.text;
    NSString *lang = textView.textInputMode.primaryLanguage; // 键盘输入模式
    if([lang isEqualToString:@"zh-Hans"]) { //简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if(!position) {
            if(toBeString.length > maxNumber) {
                textView.text = [[self class] subStringWith:toBeString ToIndex:maxNumber];
            }
        } else{ //有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    } else{ //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if(toBeString.length > maxNumber) {
            //防止表情被截断
            textView.text= [[self class] subStringWith:toBeString ToIndex:maxNumber];
            
        }
    }
}
@end
