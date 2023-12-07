//
//  DoctorModel.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 07.12.2023.
//

import Foundation

struct Doctor: Identifiable {
    var id: String
    var first_name: String
    var patronymic: String?
    var last_name: String
    var avatar: String?
    var gender_label: String
    var text_chat_price: Int
    var video_chat_price: Int
    var home_price: Int
    var hospital_price: Int
    var nearest_reception_time: Int?
    var free_reception_time: [FreeTime]?
    var education_type_label: EducationType?
    var higher_education: [HigherEducation]?
    var work_expirience: [WorkExperience]?
    var advanced_training: [AdvancedTraining]?
    var rank: Int
    var rank_label: String
    var scientific_degree_label: String
    var category: Int
    var scientific_degree: Int
    var category_label: String
    var specialization: [Specialization]?
    var ratings_rating: Int
    
}

struct HigherEducation: Identifiable {
    var id: Int
    var university: String
    var specialization: String
    var qualification: String
    var start_date: Int
    var end_date: Int
}

struct Specialization: Identifiable {
    var id: Int
    var name: String
}

struct WorkExperience: Identifiable {
    var id: Int
    var organization: String?
    var position: String?
    var start_date: Int?
    var end_date: Int?
}

struct EducationType: Identifiable {
    var id: Int
    var name: String
}

struct AdvancedTraining: Identifiable {
    var id: Int
    var organization: String
    var position: String
    var end_date: Int
    var file: String
}
struct FreeTime {
    var time: Date
}
