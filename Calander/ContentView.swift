//
//  ContentView.swift
//  Calander
//
//  Created by hiba on 22/2/2023.
//

import SwiftUI
struct ContentView: View {
    @State var showsDatePicker : Bool = false
    @State var selectedDate: Date?

    var body: some View {
        ZStack {
            VStack{
                Button {
                    showsDatePicker = true
                } label: {
                   Text("Show Me")
                }
                if let date = selectedDate {
                    VStack {
                        Text("Selected date: \(ConvertDate(date: date))")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                }
            }

            if showsDatePicker {

                withAnimation(.easeInOut) {
                    AlertCalanderView(showsDatePicker: $showsDatePicker, selectedDate: $selectedDate)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut(duration: 0.4))
                }
            }
            
    
        }
        .onTapGesture {
            showsDatePicker = false
        }
        .padding()
        .onAppear {
            if let date = UserDefaults.standard.object(forKey: "SelectedDate") as? Date {
                selectedDate = date
            }
        }
    }
}
func ConvertDate(date:Date, format: String = "yyyy-MM-dd") -> String{
    let df = DateFormatter()
    df.dateFormat = format
    let dateString = df.string(from: date)
    return dateString
}

