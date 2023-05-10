//
//  StringExt.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI

extension String {
    
    func regex(_ regex: String) -> Bool {
        
        let temp = NSPredicate(format: "SELF MATCHES %@", regex)
        return temp.evaluate(with: self)
    }
}
