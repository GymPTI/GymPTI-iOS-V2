//
//  AppRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

struct AppRouterGroup {
    
    var routers: [RouteBuilder] {
        [
            /// Launch View : 런치 스크린
            LaunchRouteBuilder(),
            
            /// Start View : 시작 화면
            StartRouteBuilder(),
            
            //MARK: - SignIn / SignUp
            
            /// SignIn View : 로그인 화면
            SignInRouteBuilder(),
            
            /// SignUp -> Id View : 회원가입 -> 아이디 입력 화면
            IdRouteBuilder(),
            
            /// SignUp -> Pw View : 회원가입 -> 비밀번호 입력 화면
            PwRouteBuilder(),
            
            /// SignUp -> Name View : 회원가입 -> 이름 입력 화면
            NameRouteBuilder(),
            
            /// SignUp -> Email View : 회원가입 -> 이메일 입력 화면
            EmailRouteBuilder(),
            
            /// SignUp -> Verification View : 회원가입 -> 인증번호 입력 화면
            VerificationRouteBuilder(),
            
            //MARK: - Main
            
            /// TabBar View : 탭바 화면
            TabBarRouteBuilder(),
            
            /// Home View : 홈 화면
            HomeRouteBuilder(),
            
            /// Routine View : 루틴 화면
            RoutineRouteBuilder(),
            
            /// Routine -> AddRoutine View: 루틴 -> 루틴 추가 화면
            AddRoutineRouteBuilder(),
            
            /// Routine -> SelectTargetMuscle View: 루틴 추가 화면 -> 근육 부위 선택 화면
            SelectTargetMuscleRouteBuilder(),
            
            /// Routine -> SelectTargetMuscle View: 근육 부위 선택 화면 -> 루틴 디테일 설정 화면
            SetRoutineDetailRouteBuilder(),
            
            /// Friend View : 친구 화면
            FriendRouteBuilder(),
            
            /// Profile View : 프로필 화면
            ProfileRouteBuilder(),
            
            /// Profile -> EditInfo View : 프로필 -> 유저 정보 수정 화면
            EditInfoRouteBuilder(),
            
            /// Profile -> EditAccount View : 프로필 -> 계정 정보 수정 화면
            EditAccountRouteBuilder(),
            
            /// Setting View : 설정 화면
            SettingRouteBuilder(),
            
            /// Setting -> FindId View : 설정 -> 아이디 찾기 화면
            FindIdRouteBuilder(),
            
            // Notification : 알림 화면
            NotificationRouteBuilder()
        ]
    }
}
