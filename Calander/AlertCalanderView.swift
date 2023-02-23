//
//  AlertCalanderView.swift
//  DatePicker
//
//  Created by hiba on 4/1/2023.
//

import SwiftUI


struct AlertCalanderView: View {
    @State var dob = Date()
    @Binding var showsDatePicker : Bool
    @Binding var selectedDate: Date?

    var body: some View{
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack {
                VStack{
                    DatePicker("", selection: $dob, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                    HStack{
                        Button {
                            showsDatePicker = false
                            selectedDate = dob
                        } label: {
                            Text("Save")
                        }
                        Spacer()
                        Button {
                            showsDatePicker = false
                        } label: {
                            Text("Cancel")
                        }
                    }
                    .padding(.bottom)
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.3)
               .padding(.vertical, 25)
               .padding(.horizontal, 30)
               .background(Color.white)
               .cornerRadius(25)
               .scaleEffect(showsDatePicker ? 1.0 : 0.3)
               .animation(.spring(response: 0.5, dampingFraction: 0.75, blendDuration: 0))
               .opacity(showsDatePicker ? 1.0 : 0.0)
               .offset(y: showsDatePicker ? 0 : UIScreen.main.bounds.height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(12)
        .shadow(
            color: Color.gray.opacity(0.7),
            radius: 8,
            x: 0,
            y: 0
        )
        .onDisappear {
            if let date = selectedDate {
                UserDefaults.standard.set(date, forKey: "SelectedDate")
            }
        }
    }
}
