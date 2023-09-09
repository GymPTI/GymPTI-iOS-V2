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
}

public enum BackMuscleExercise: String, CaseIterable, Identifiable {
    case CHIN_UP
    case LAT_PULLDOWN
    case CABLE_SEATED_ROW
    case DUMBBEL_ROW
    
    public var id: String { self.rawValue }
}

public enum LegsMuscleExercise: String, CaseIterable, Identifiable {
    case LEG_RAISE
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
    case DUMBBEL_CONCENTRATION_CURL
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
    
    public var id: String { self.rawValue }
}
