//
//  AppointmentView.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 09.12.2023.
//

import SwiftUI

struct AppointmentView: View {
    let doctor: Doctor
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Видеоконсультация")
                    .bold()
                    .padding(.top, 26)
                HStack {
                    Text("30 мин")
                    Spacer()
                    Text("\(doctor.video_chat_price) Р")
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .navigationTitle("Стоимость услуг")
                
                Text("Чат с врачом")
                    .bold()
                HStack {
                    Text("30 мин")
                    Spacer()
                    Text("\(doctor.text_chat_price) Р")
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text("Приём в клинике")
                    .bold()
                HStack {
                    Text("В клинике")
                    Spacer()
                    Text("\(doctor.hospital_price) Р")
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                Spacer()
            }
            .padding()
        }
    }
    }
}

#Preview {
    AppointmentView(doctor: MockData.sampleDoctor)
}
