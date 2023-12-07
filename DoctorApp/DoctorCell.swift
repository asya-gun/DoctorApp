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
            HStack {
                Image("DoctorImage", bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .font(.largeTitle)
                    .cornerRadius(50)
                VStack(alignment: .leading) {
                    Text(doctor.last_name)
                    Text("\(doctor.first_name) \(doctor.patronymic ?? "")")
                }
                .padding(.leading, 30)
            }
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(doctor.ratings_rating, specifier: "%.1f")")
                }
            }
            Text("Врач / стаж 10 лет")
            HStack(alignment: .center) {
                Button("Записаться", action: goToDoctor)
                    .padding()
                    .padding(.horizontal,70)
                    .background(Color.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.white)
                    .font(.system(size: 20))
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
