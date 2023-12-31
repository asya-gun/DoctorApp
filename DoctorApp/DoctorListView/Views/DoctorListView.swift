//
//  ContentView.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 07.12.2023.
//
//Создать приложение со списком врачей, SwiftUI (вёрстка), MVVM (предпочтительно). Экран со списком ячеек, на каждой из которых выводится фото и краткая информация о докторе, при нажатии на ячейку - переход на экран большой карточки доктора.
//API: https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4
//Figma: https://www.figma.com/file/Kwic8nnnhxLYztOswqQWix/Test?type=design&node-id=4-19732&mode=design&t=DWjwU9bLkUKGnM6F-0
//Задание принимается в виде ссылки на GitHub

import SwiftUI

struct DoctorListView: View {
    
    @EnvironmentObject private var viewModel: DoctorListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.doctors, id: \.id) { doctor in
                    DoctorCell(doctor: doctor)
                } 
            }
            .navigationTitle("Врачи")
            .navigationBarTitleDisplayMode(.inline)
            .listRowSpacing(12)
        }
        .onAppear { viewModel.receiveDoctors() }
        
    }
}

#Preview {
    DoctorListView()
        .environmentObject(DoctorListViewModel())
}
