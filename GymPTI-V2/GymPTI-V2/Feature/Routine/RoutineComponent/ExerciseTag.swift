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
//    case DUMBBEL_FLY
    case CABLE_FLY
    
    public var id: String { self.rawValue }
}

public enum BackMuscleExercise: String, CaseIterable, Identifiable {
    
    case PULL_UP
    case CHIN_UP
    case LAT_PULLDOWN
    case CABLE_SEATED_ROW
    case DUMBBEL_ROW
    
    public var id: String { self.rawValue }
}

public enum LegsMuscleExercise: String, CaseIterable, Identifiable {
    
    case SQUAT
    case LUNGE
    case DEADLIFT
    case LEG_PRESS
    
    public var id: String { self.rawValue }
}

public enum ShoulderMuscleExercise: String, CaseIterable, Identifiable {
    
    case SHOULDER_PRESS
    case SIDE_LATERAL_RAISE
    case FRONT_RAISE
    case BENT_OVER_LATERAL_RAISE
    case OVERHEAD_PRESS
    
    public var id: String { self.rawValue }
}

public enum ArmMuscleExercise: String, CaseIterable, Identifiable {
    
    case DUMBBEL_CURL
    case HAMMER_CURL
    case CABLE_TRICEPS_PUSHDOWN
    case OVERHEAD_EXTENSION
    case LYING_TRICEPS_EXTENSION
    
    public var id: String { self.rawValue }
}

public enum AbsExercise: String, CaseIterable, Identifiable {
    
    case PLANK
    case RUSSIAN_TWIST
    case SIT_UP
    case CRUNCH
    case LEG_RAISE
    
    public var id: String { self.rawValue }
}


func exerciseNameToKor(_ exercise: String) -> String {
    
    switch exercise {
        
    // ChestMuscleExercise
    case "PUSH_UP":
        return "푸쉬업"
    case "DIPS":
        return "딥스"
    case "BENCH_PRESS":
        return "벤치 프레스"
    case "CHEST_PRESS_MACHINE":
        return "체스트 프레스 머신"
    case "CABLE_FLY":
        return "케이블 플라이"
    
    // BackMuscleExercise
    case "PULL_UP":
        return "풀업"
    case "CHIN_UP":
        return "친업"
    case "LAT_PULLDOWN":
        return "랫 풀 다운"
    case "CABLE_SEATED_ROW":
        return "케이블 시티드 로우"
    case "DUMBBEL_ROW":
        return "덤벨 로우"
    
    // LegsMuscleExercise
    case "LEG_RAISE":
        return "레그 레이즈"
    case "SQUAT":
        return "스쿼트"
    case "LUNGE":
        return "런지"
    case "DEADLIFT":
        return "데드리프트"
    
    // ShoulderMuscleExercise
    case "SHOULDER_PRESS":
        return "숄더 프레스"
    case "SIDE_LATERAL_RAISE":
        return "사이드 레터럴 레이즈"
    case "FRONT_RAISE":
        return "프론트 레이즈"
    case "BENT_OVER_LATERAL_RAISE":
        return "벤트 오버 레터럴 레이즈"
    case "OVERHEAD_PRESS":
        return "오버헤드 프레스"
    
    // ArmMuscleExercise
    case "DUMBBEL_CURL":
        return "덤벨 컬"
    case "HAMMER_CURL":
        return "해머 컬"
    case "CABLE_TRICEPS_PUSHDOWN":
        return "케이블 트라이셉스 푸시다운"
    case "OVERHEAD_EXTENSION":
        return "오버헤드 익스텐션"
    case "LYING_TRICEPS_EXTENSION":
        return "라잉 트라이셉스 익스텐션"
    
    // AbsExercise
    case "PLANK":
        return "플랭크"
    case "RUSSIAN_TWIST":
        return "러시안 트위스트"
    case "SIT_UP":
        return "싯업"
    case "CRUNCH":
        return "크런치"
    case "LEG_PRESS":
        return "레그 프레스"
    
    default:
        return "알 수 없음"
    }
}

func exercises(forMuscle muscle: String) -> [String] {
    
    switch muscle {
        
    case "CHEST":
        return ChestMuscleExercise.allCases.map { $0.rawValue }
        
    case "BACK":
        return BackMuscleExercise.allCases.map { $0.rawValue }
        
    case "LEGS":
        return LegsMuscleExercise.allCases.map { $0.rawValue }
        
    case "SHOULDER":
        return ShoulderMuscleExercise.allCases.map { $0.rawValue }
        
    case "ARM":
        return ArmMuscleExercise.allCases.map { $0.rawValue }
        
    case "ABS":
        return AbsExercise.allCases.map { $0.rawValue }
        
    default:
        return []
    }
}
