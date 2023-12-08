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
                    .frame(width: 70, height: 70)
                    .font(.largeTitle)
                    .cornerRadius(50)
                VStack(alignment: .leading, spacing:16) {
                    VStack(alignment: .leading) {
                        Text(doctor.last_name)
                            .lineLimit(1)
                            .font(.system(size: 18))
                            .bold()
                        Text("\(doctor.first_name) \(doctor.patronymic ?? "")")
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                            .bold()
                    }
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(doctor.ratings_rating, specifier: "%.1f")")
                            .foregroundStyle(.secondary)
                    }
                }
                Text("Врач / стаж 10 лет")
                    .font(.subheadline)
                }
            }


            
            
            HStack(alignment: .center) {
                NavigationLink(destination: DoctorCardView(doctor: doctor)) {
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
        .padding()
        .background(Color.white)
    }
    func goToDoctor() {
        
    }
}

#Preview {
    DoctorCell(doctor: MockData.sampleDoctor)
}
