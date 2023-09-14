//
//  ExerciseTag.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/09.
//

public enum ChestMuscleExercise: String, CaseIterable, Identifiable {
    
    case PUSH_UP
    case DIPS
    case BENCH_PRESS
    case CHEST_PRESS_MACHINE
    case DUMBBEL_FLY
    case CABLE_FLY
    
    public var id: String { self.rawValue }
    
    public var nameToKor: String {
        
        switch self {
        case .PUSH_UP:
            return "푸쉬업"
        case .DIPS:
            return "딥스"
        case .BENCH_PRESS:
            return "벤치 프레스"
        case .CHEST_PRESS_MACHINE:
            return "체스트 프레스 머신"
        case .DUMBBEL_FLY:
            return "덤벨 플라이"
        case .CABLE_FLY:
            return "케이블 플라이"
        }
    }
}

public enum BackMuscleExercise: String, CaseIterable, Identifiable {
    
    case PULL_UP = "풀업"
    case CHIN_UP = "친업"
    case LAT_PULLDOWN = "랫 풀 다운"
    case CABLE_SEATED_ROW = "케이블 시티드 로우"
    case DUMBBEL_ROW = "덤벨 로우"
    
    public var id: String { self.rawValue }
    
    public var nameToKor: String {
        
        switch self {
            
        case .PULL_UP:
            return "풀업"
        case .CHIN_UP:
            return "친업"
        case .LAT_PULLDOWN:
            return "랫 풀 다운"
        case .CABLE_SEATED_ROW:
            return "케이블 시티드 로우"
        case .DUMBBEL_ROW:
            return "덤벨 로우"
        }
    }
}

public enum LegsMuscleExercise: String, CaseIterable, Identifiable {
    
    case LEG_RAISE = "레그 레이즈"
    case SQUAT = "스쿼트"
    case LUNGE = "런지"
    case DEADLIFT = "데드리프트"
    case LEG_PRESS = "레그 프레스"
    
    public var id: String { self.rawValue }
    
    public var nameToKor: String {
        
        switch self {
            
        case .LEG_RAISE:
            return "레그 레이즈"
        case .SQUAT:
            return "스쿼트"
        case .LUNGE:
            return "런지"
        case .DEADLIFT:
            return "데드리프트"
        case .LEG_PRESS:
            return "레그 프레스"
        }
    }
}

public enum ShoulderMuscleExercise: String, CaseIterable, Identifiable {
    
    case SHOULDER_PRESS = "숄더 프레스"
    case SIDE_LATERAL_RAISE = "사이드 레터럴 레이즈"
    case FRONT_RAISE = "프론트 레이즈"
    case BENT_OVER_LATERAL_RAISE = "벤트 오버 레터럴 레이즈"
    case OVERHEAD_PRESS = "오버헤드 프레스"
    
    public var id: String { self.rawValue }
    
    public var nameToKor: String {
        
        switch self {
            
        case .SHOULDER_PRESS:
            return "숄더 프레스"
        case .SIDE_LATERAL_RAISE:
            return "사이드 레터럴 레이즈"
        case .FRONT_RAISE:
            return "프론트 레이즈"
        case .BENT_OVER_LATERAL_RAISE:
            return "벤트 오버 레터럴 레이즈"
        case .OVERHEAD_PRESS:
            return "오버헤드 프레스"
        }
    }
}

public enum ArmMuscleExercise: String, CaseIterable, Identifiable {
    
    case DUMBBEL_CURL = "덤벨 컬"
    case DUMBBEL_CONCENTRATION_CURL = "덤벨 컨센트레이션 컬"
    case HAMMER_CURL = "해머 컬"
    case CABLE_TRICEPS_PUSHDOWN = "케이블 트라이셉스 푸시다운"
    case OVERHEAD_EXTENSION = "오버헤드 익스텐션"
    case LYING_TRICEPS_EXTENSION = "라잉 트라이셉스 익스텐션"
    
    public var id: String { self.rawValue }
    
    public var nameToKor: String {
        
        switch self {
            
        case .DUMBBEL_CURL:
            return "덤벨 컬"
        case .DUMBBEL_CONCENTRATION_CURL:
            return "덤벨 컨센트레이션 컬"
        case .HAMMER_CURL:
            return "해머 컬"
        case .CABLE_TRICEPS_PUSHDOWN:
            return "케이블 트라이셉스 푸시다운"
        case .OVERHEAD_EXTENSION:
            return "오버헤드 익스텐션"
        case .LYING_TRICEPS_EXTENSION:
            return "라잉 트라이셉스 익스텐션"
        }
    }
}

public enum AbsExercise: String, CaseIterable, Identifiable {
    
    case PLANK = "플랭크"
    case RUSSIAN_TWIST = "러시안 트위스트"
    case SIT_UP = "시트업"
    case CRUNCH = "크런치"
    
    public var id: String { self.rawValue }
    
    public var nameToKor: String {
        
        switch self {
            
        case .PLANK:
            return "플랭크"
        case .RUSSIAN_TWIST:
            return "러시안 트위스트"
        case .SIT_UP:
            return "시트업"
        case .CRUNCH:
            return "크런치"
        }
    }
}
