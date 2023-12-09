//
//  DoctorListViewModel.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 09.12.2023.
//

import Foundation
import SwiftUI

final class DoctorListViewModel: ObservableObject {
    
    @Published var doctors: [Doctor] = []
    
    // MARK: - methods for UI configuration
    
    func replaceColor(hasTime: Bool) -> Color {
        if hasTime {
        return Color(uiColor: .systemPink)
        } else {
        return Color(uiColor: .systemGray4)
        }
    }
    
    func doesDoctorHaveTime(doctor: Doctor) -> Bool {
        if let time = doctor.nearest_reception_time, time > 0 {
            return true
        } else if let freeTime = doctor.free_reception_time, freeTime.count > 0 {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Network method
    
    func receiveDoctors() {
        NetworkManager.shared.getDoctors { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let doctors):
                    self.doctors = doctors
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
    // MARK: - Text configuration methods
    
    func findFreeTime(doctor: Doctor) -> String {
        if let time = doctor.nearest_reception_time, time > 0 {
            return "Записаться"
        } else if let freeTime = doctor.free_reception_time, freeTime.count > 0 {
            return "Записаться"
        } else {
            return "Нет свободного расписания"
        }
    }
    
    func findEducation(doctor: Doctor) -> String {
        if let education = doctor.higher_education, education.count > 0 {
            return education[0].university
        } else if let education = doctor.education_type_label, !education.name.isEmpty {
            return education.name
        } else {
            return "ВУЗ не указано"
        }
        
    }
    func findCategory(category: Int) -> String? {
        var string = ""
        if category == 2 {
            string = "Врач первой категории"
            return string
        } else if category == 1 {
            string = "Врач второй категории"
            return string
        } else if category == 3 {
            string = "Врач высшей категории"
            return string
        }
        return nil
    }
    func findDegree(degree: Int) -> String? {
        var string = ""
        if degree == 2 {
            string = "Доктор медицинских наук"
            return string
        }
        return nil
    }
    func findWorkExperience(doctor: Doctor) -> String {
        guard let experience = doctor.work_expirience, experience.count > 0 else {
            return "Клиника"
        }
        let activeExperience = experience.filter { work in
            if work.until_now {
                return true
            } else {
                return false
            }
        }
        guard activeExperience.count > 0 else {
            return "Клиника"
        }
        var string = ""
        for i in activeExperience.indices {
            if i == 0 {
                string = activeExperience[i].organization ?? ""
            } else {
                string += ", \(activeExperience[i].organization ?? "")"
            }
        }
        return string
    }
    func findMinPrice(doctor: Doctor) -> Int {
        return [doctor.home_price, doctor.hospital_price, doctor.text_chat_price, doctor.video_chat_price].min() ?? 0
    }
    func findAmountOfExperience(doctor: Doctor) -> String {
        guard let experience = doctor.work_expirience, experience.count > 0 else {
            return "Стаж не указан"
        }
        var seconds = 0
        for work in experience {
            if !work.until_now {
                guard let end = work.end_date, let start = work.start_date else {
                    seconds += 0
                    continue
                }
                seconds = seconds + Int(end.timeIntervalSince(start))
            } else {
                guard let start = work.start_date else {
                    seconds += 0
                    continue
                }
                seconds = seconds + Int(Date().timeIntervalSince(start))
            }

        }
        let years = (((seconds/60)/60)/24)/365
        return "Стаж \(years) лет"
    }
    
    func findCategoryOrDegree(doctor: Doctor) -> String {
        return findCategory(category: doctor.category) ?? findDegree(degree: doctor.scientific_degree) ?? "Не указано"
    }
    
    
}
