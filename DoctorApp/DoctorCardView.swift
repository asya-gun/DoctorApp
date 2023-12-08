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
                    Text("стаж")
                }
                HStack {
                    Image(systemName: "briefcase")
                    Text("\(findCategory(category: doctor.category) ?? findDegree(degree: doctor.scientific_degree) ?? "")")
                }
                HStack {
                    Image(systemName: "graduationcap")
                    Text(doctor.higher_education?[0].university ?? "Университет 404")
                }
                HStack {
                    Image(systemName: "location")
                    Text("\(doctor.work_expirience?[0].position ?? "Врач") в \(doctor.work_expirience?[0].organization ?? "клинике")")
                }
            }
            Text("Стоимость услуг: от \([doctor.home_price, doctor.hospital_price, doctor.text_chat_price, doctor.video_chat_price].min() ?? 0) рублей")
                .padding()
                .padding(.horizontal)
                .background(Color(uiColor: .white))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(MockData.doctorDescription)
                .padding()
            HStack(alignment: .center) {
                NavigationLink(destination: DoctorCardView(doctor: doctor)) {
                    Text("Записаться")
                        .frame(width: 280, height: 46)
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 20))
                }
            }
            
        }
        .background(Color(uiColor: .systemGray6))
        
        
        
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
    func findWorkExperience(doctor: Doctor) {
        
    }
}

#Preview {
    DoctorCardView(doctor: MockData.sampleDoctor)
}
