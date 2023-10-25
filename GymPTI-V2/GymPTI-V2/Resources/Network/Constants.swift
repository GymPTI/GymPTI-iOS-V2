//
//  Constants.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/10/08.
//

import Foundation

class API {
    
    static let url: String = "http:/10.80.162.133:9000"
    
    /// auth
    static let auth_register = "\(url)/auth/register"
    static let auth_login = "\(url)/auth/login"
    
    /// email verification
    static let email_validateMailVerification = "\(url)/email/validateMailVerification"
    static let email_sendMailVerification = "\(url)/email/sendMailVerification"
    
    /// user
    static let user_statusMessage = "\(url)/user/statusMessage"
    static let user_profileImage = "\(url)/user/profileImage"
    static let user_password = "\(url)/user/password"
    static let user_nickname = "\(url)/user/nickname"
    static let user_bodyInfo = "\(url)/user/bodyInfo"
    static let user_my = "\(url)/user/my"
    static let user_forgotId = "\(url)/user/forgotId"
    
    /// routine
    static let routine_isComplete = "\(url)/routine/isComplete"
    static let routine_create = "\(url)/routine/create"
    static let routine_list = "\(url)/routine/list"
    static let routine_delete = "\(url)/routine/delete"
}
