//
//  DoctorCardView.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 08.12.2023.
//

import SwiftUI

struct DoctorCardView: View {
    
    @EnvironmentObject private var viewModel: DoctorListViewModel
    let doctor: Doctor
    private var hasTime: Bool {
        return viewModel.doesDoctorHaveTime(doctor: doctor)
    }
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 12) {
                
                HStack {
                    
                    DoctorRemoteImage(urlString: doctor.avatar ?? "")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .font(.largeTitle)
                        .cornerRadius(50)
                    VStack(alignment: .leading, spacing: 6) {
                        Text(doctor.last_name)
                            .lineLimit(1)
                            .font(.system(size: 18))
                            .bold()
                        Text("\(doctor.first_name) \(doctor.patronymic ?? "")")
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                            .bold()
                    }
                    .padding(.leading, 8)
                    .navigationTitle("Врач")
                }
                .padding(.leading, 8)
                HStack(alignment: .center, spacing: 16) {
                    VStack(spacing: 10) {
                        Image(systemName: "clock")
                        Image(systemName: "briefcase")
                        Image(systemName: "graduationcap")
                        Image(systemName: "location")
                    }
                    .padding(.leading, 8)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(viewModel.findAmountOfExperience(doctor: doctor))
                        Text("\(viewModel.findCategoryOrDegree(doctor: doctor))")
                        Text(viewModel.findEducation(doctor: doctor))
                        Text(viewModel.findWorkExperience(doctor: doctor))
                    }
                }
                Text("Стоимость услуг: от \(viewModel.findMinPrice(doctor: doctor)) рублей")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .white))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 8)
                
                Text(MockData.doctorDescription)
                    .padding(8)
                    .lineLimit(nil)
                    .padding(.bottom, 30)
                VStack(alignment: .center) {
                    if hasTime {
                        NavigationLink(destination: AppointmentView(doctor: doctor)) {
                            Text(viewModel.findFreeTime(doctor: doctor))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(viewModel.replaceColor(hasTime: hasTime))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 20))
                        }
                    } else {
                        Text(viewModel.findFreeTime(doctor: doctor))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(viewModel.replaceColor(hasTime: hasTime))
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
}

#Preview {
    DoctorCardView(doctor: MockData.sampleDoctor)
        .environmentObject(DoctorListViewModel())
}
