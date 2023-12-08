//
//  DoctorCardView.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 08.12.2023.
//

import SwiftUI

struct DoctorCardView: View {
    
    let doctor: Doctor
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                
                HStack {
                    
                    DoctorRemoteImage(urlString: doctor.avatar ?? "")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .font(.largeTitle)
                        .cornerRadius(50)
                    VStack(alignment: .leading) {
                        Text(doctor.last_name)
                            .lineLimit(1)
                            .font(.system(size: 18))
                        Text("\(doctor.first_name) \(doctor.patronymic ?? "")")
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                    }
                    .padding(.leading, 8)
                    .navigationTitle("Врач")
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "clock")
                        Text(findAmountOfExperience(doctor: doctor))
                    }
                    HStack {
                        Image(systemName: "briefcase")
                        Text("\(findCategory(category: doctor.category) ?? findDegree(degree: doctor.scientific_degree) ?? "Не указано")")
                    }
                    HStack {
                        Image(systemName: "graduationcap")
                        Text(findEducation(doctor: doctor))
                    }
                    HStack {
                        Image(systemName: "location")
                        Text(findWorkExperience(doctor: doctor))
                    }
                }
                Text("Стоимость услуг: от \(findMinPrice(doctor: doctor)) рублей")
                    .padding()
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(MockData.doctorDescription)
                    .padding()
                    .lineLimit(nil)
                    .padding(.bottom)
                VStack(alignment: .center) {
                    NavigationLink(destination: AppointmentView(doctor: doctor)) {
                        Text("Записаться")
                            .frame(maxWidth: .infinity)
                            .frame(height: 46)
                            .background(Color.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 20))
                    }
                }
                
            }
            .padding(12)
            .padding(.vertical)
            .background(Color(uiColor: .systemGray6))
            
            
            
        }
    }
    func findEducation(doctor: Doctor) -> String {
        if let education = doctor.higher_education, education.count > 0 {
            return education[0].university
        } else if let education = doctor.education_type_label, !education.name.isEmpty {
            return education.name
        } else {
            return "Университет 404"
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
    
}

#Preview {
    DoctorCardView(doctor: MockData.sampleDoctor)
}
