//
//  SwiftUIView.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 07.12.2023.
//

import SwiftUI

struct DoctorCell: View {
    
    let doctor: Doctor
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 16) {
                DoctorRemoteImage(urlString: doctor.avatar ?? "")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .font(.largeTitle)
                    .cornerRadius(50)
                VStack(alignment: .leading, spacing:16) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(doctor.last_name)
                                .lineLimit(1)
                                .font(.system(size: 16))
                                .bold()
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "heart")
                                    .font(.system(size: 24))
                                    .foregroundStyle(Color(uiColor: .systemGray3))
                            })
                            
                        }

                        Text("\(doctor.first_name) \(doctor.patronymic ?? "")")
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                            .bold()
                    }
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(uiColor: .systemPink))
                        Text("\(doctor.ratings_rating, specifier: "%.1f")")
                            .foregroundStyle(.secondary)
                    }
                }
                Text("Врач / стаж 10 лет")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text("от 0 Р")
                        .font(.title3)
                        .bold()
                }
            }


            
            
            HStack(alignment: .center) {
                NavigationLink(destination: DoctorCardView(doctor: doctor)) {
                    Text(findFreeTime(doctor: doctor))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 16))
                }
            }

                
                
        }
        .padding(.vertical, 8)
        .background(Color.white)
    }
    func findFreeTime(doctor: Doctor) -> String {
        if let time = doctor.nearest_reception_time, time > 0 {
            return "Записаться"
        } else if let freeTime = doctor.free_reception_time, freeTime.count > 0 {
            return "Записаться"
        } else {
            return "Нет свободного расписания"
        }
    }
}

#Preview {
    DoctorCell(doctor: MockData.sampleDoctor)
}
