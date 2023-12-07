//
//  DoctorModel.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 07.12.2023.
//

import Foundation

struct Doctor: Identifiable, Decodable {
    var id: String
    var first_name: String
    var patronymic: String? = ""
    var last_name: String
    var avatar: String? = ""
    var gender_label: String
    var text_chat_price: Int
    var video_chat_price: Int
    var home_price: Int
    var hospital_price: Int
    var nearest_reception_time: Int? = 0
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
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case first_name
//        case patronymic
//        case last_name
//        case avatar
//        case gender_label
//        case text_chat_price
//        case video_chat_price
//        case home_price
//        case hospital_price
//        case nearest_reception_time
//        case free_reception_time
//        case education_type_label
//        case higher_education
//        case work_expirience
//        case advanced_training
//        case rank
//        case rank_label
//        case scientific_degree_label
//        case category
//        case scientific_degree
//        case category_label
//        case specialization
//        case ratings_rating
//    }
//    
//    init(id: String, first_name: String, patronymic: String? = nil, last_name: String, avatar: String? = nil, gender_label: String, text_chat_price: Int, video_chat_price: Int, home_price: Int, hospital_price: Int, nearest_reception_time: Int? = nil, free_reception_time: [FreeTime]? = nil, education_type_label: EducationType? = nil, higher_education: [HigherEducation]? = nil, work_expirience: [WorkExperience]? = nil, advanced_training: [AdvancedTraining]? = nil, rank: Int, rank_label: String, scientific_degree_label: String, category: Int, scientific_degree: Int, category_label: String, specialization: [Specialization]? = nil, ratings_rating: Int) {
//        self.id = id
//        self.first_name = first_name
//        self.patronymic = patronymic
//        self.last_name = last_name
//        self.avatar = avatar
//        self.gender_label = gender_label
//        self.text_chat_price = text_chat_price
//        self.video_chat_price = video_chat_price
//        self.home_price = home_price
//        self.hospital_price = hospital_price
//        self.nearest_reception_time = nearest_reception_time
//        self.free_reception_time = free_reception_time
//        self.education_type_label = education_type_label
//        self.higher_education = higher_education
//        self.work_expirience = work_expirience
//        self.advanced_training = advanced_training
//        self.rank = rank
//        self.rank_label = rank_label
//        self.scientific_degree_label = scientific_degree_label
//        self.category = category
//        self.scientific_degree = scientific_degree
//        self.category_label = category_label
//        self.specialization = specialization
//        self.ratings_rating = ratings_rating
//    }
    
}

//struct UrlRecord: Decodable {
//    var record: UrlRequest
//}

struct UrlRequest: Decodable {
    var count: Int
    var data: UrlRequestData
}

struct UrlRequestData: Decodable {
    var users: [Doctor]
}

struct HigherEducation: Identifiable, Decodable {
    var id: Int
    var university: String
    var specialization: String
    var qualification: String
    var start_date: Int
    var end_date: Int
}

struct Specialization: Identifiable, Decodable {
    var id: Int
    var name: String
}

struct WorkExperience: Identifiable, Decodable {
    var id: Int
    var organization: String?
    var position: String?
    var start_date: Int?
    var end_date: Int?
}

struct EducationType: Identifiable, Decodable {
    var id: Int
    var name: String
}

struct AdvancedTraining: Identifiable, Decodable {
    var id: Int
    var organization: String
    var position: String
    var end_date: Int
    var file: String
}
struct FreeTime: Decodable {
    var time: Date
}

enum TaskError: Error {
    case someError
}

struct MockData {
    static let sampleDoctors = [sampleDoctor, sampleDoctor, sampleDoctor]
    static let sampleDoctor = Doctor(id: "0000001",
                                     first_name: "Иван",
                                     patronymic: "Иванович", 
                                     last_name: "Иванов",
                                        gender_label: "Мужчина",
                                     text_chat_price: 300,
                                     video_chat_price: 400,
                                     home_price: 500,
                                     hospital_price: 600,
                                     rank: 0, rank_label: "0",
                                     scientific_degree_label: "доцент",
                                     category: 0,
                                     scientific_degree: 3,
                                     category_label: "нет",
                                     ratings_rating: 0)
}
