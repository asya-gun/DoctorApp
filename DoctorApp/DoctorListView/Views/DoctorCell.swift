//
//  SwiftUIView.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 07.12.2023.
//

import SwiftUI

struct DoctorCell: View {
    
    @EnvironmentObject private var viewModel: DoctorListViewModel
    let doctor: Doctor
    private var hasTime: Bool {
        return viewModel.doesDoctorHaveTime(doctor: doctor)
    }
    @State private var tappedHeart: Bool = false
    
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
                            Button(action: {
                                self.tappedHeart.toggle()
                            }, label: {
                                Image(systemName: tappedHeart ? "heart.fill" : "heart")
                                    .font(.system(size: 24))
                                    .foregroundStyle(tappedHeart ? Color(uiColor: .systemPink) : Color(uiColor: .systemGray3))
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
                    HStack {
                        Text("Врач")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Image(systemName: "circle.fill")
                            .font(.system(size: 4))
                            .foregroundStyle(.secondary)
                        Text("\(viewModel.findAmountOfExperience(doctor: doctor))")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Text("от 0 Р")
                        .font(.title3)
                        .bold()
                }
            }
            
            
            
            
            HStack(alignment: .center) {
                NavigationLink(destination: DoctorCardView(doctor: doctor)) {
                    Text(viewModel.findFreeTime(doctor: doctor))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(viewModel.replaceColor(hasTime: hasTime))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 16))
                }
            }
            
        }
        .padding(.vertical, 8)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    DoctorCell(doctor: MockData.sampleDoctor)
        .environmentObject(DoctorListViewModel())
}
