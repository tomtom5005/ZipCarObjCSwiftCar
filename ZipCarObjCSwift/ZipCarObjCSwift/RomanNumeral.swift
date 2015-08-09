//
//  RomanNumeral.swift
//  ZipCarObjCSwift
//
//  Created by Thomas Thompson on 8/8/15.
//  Copyright (c) 2015 Thomas Thompson. All rights reserved.
//

import Foundation

extension String {
    var length: Int { return count(self)}

    subscript(range: Range<Int>) -> String {
        return self[advance(startIndex, range.startIndex)..<advance(startIndex, range.endIndex)]
    }
}

class RomanNumeral:NSObject {
    
    init(string: String) {
        self.string = string.uppercaseString
    }
    
    var string:String
    var length:Int {
        get{
            return self.string.length
        }
    }
    
    private let numeralsToIntegers:[(numeral:String, value:Int)] = [("M",1000), ("CM",900), ("D",500), ("CD", 400), ("C",100), ("XC",90), ("L",50), ("XL",40), ("X",10),("IX", 9), ("V",5), ("IV", 4), ("I", 1)]
    
    func validRomanNumeral() ->Bool{
        var error:NSError?
        let regex = NSRegularExpression(pattern:"^(?=[MDCLXVI])M*(C[MD]|D?C{0,3})(X[CL]|L?X{0,3})(I[XV]|V?I{0,3})$", options:NSRegularExpressionOptions.CaseInsensitive, error:&error)
        let numberOfMatches = regex!.numberOfMatchesInString(self.string, options:nil, range:NSMakeRange(0, self.length))
        return numberOfMatches > 0 ? true : false;
    }
    
    func numericValue() ->Int{
        var loc = 0
        var total = 0
        if(self.validRomanNumeral()){
            for romanTuple in  self.numeralsToIntegers{
                let len = romanTuple.numeral.length
                var end = loc + len
                if( (end) <= self.length){
                    while ( (end <= self.length) && (self.string[loc ..< end] == romanTuple.numeral)){
                        total += romanTuple.value
                        loc += len
                        end = loc + len
                    }
                }
            }
        }
        else {
            total = self.length > 0 ? NSIntegerMax : 0;
        }
        return total
    }
}
