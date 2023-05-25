import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        VStack {
            
        
            
            HStack{
                
                Image(systemName: "mappin")
                    .foregroundColor(.white)
                Text("Lagos, ")
                    .bold()
                    .foregroundColor(.white)
                + Text("LOS")
                    .bold()
                    .foregroundColor(.pink)
              
            }
            
            
            HStack{
                Image(systemName: "mappin")
                    .foregroundColor(.white)
                Text("Santorini, ")
                    .bold()
                    .foregroundColor(.white)
                + Text("Chevok Port 2")
                    .bold()
                    .foregroundColor(.pink)
                
            }
            .padding()
            Divider()
                .background(Color.white)
            HStack{
                Text("Trip Calendar")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
            }
            
            HStack {
                Button(action: {
                    previousMonth()
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Text(monthYearTitle)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                Button(action: {
                    nextMonth()
                }) {
                    Image(systemName: "chevron.right")
                }
                Spacer()
            }
            
            .padding()
            
            
            calendarGrid
            
            // Additional content or actions at the bottom
        }
    }
    
    private var monthYearTitle: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: selectedDate)
    }
    
    private var calendarGrid: some View {
        let calendar = Calendar.current
        let dateRange = calendar.range(of: .day, in: .month, for: selectedDate)!
        let numberOfDays = dateRange.count
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        
        return VStack(spacing: 10) {
            // Weekday headers
            HStack(spacing: 10) {
                ForEach(0..<7, id: \.self) { offset in
                    let weekday = calendar.component(.weekday, from: firstDayOfMonth)
                    let day = calendar.date(byAdding: .day, value: offset - weekday, to: firstDayOfMonth)!
                    Text(dateFormatter.string(from: day))
                        .frame(width: 40, height: 30)
                        .bold()
                        .foregroundColor(.white)
                }
            }
            
            // Days and dates
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 7), spacing: 10) {
                ForEach(0..<numberOfDays) { day in
                    let date = calendar.date(byAdding: .day, value: day, to: firstDayOfMonth)!
                    Button(action: {
                        handleDateSelection(date: date)
                    }) {
                        Text("\(calendar.component(.day, from: date))")
                            .frame(width: 30, height: 30)
                            .bold()
                            .foregroundColor(.white)
                            .foregroundColor(dateSelectionState(for: date) ? .white : .primary)
                            .background(dateSelectionState(for: date) ? Color.pink : Color.clear)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding()
    }

    @State private var startDate: Date?
    @State private var endDate: Date?

    private func handleDateSelection(date: Date) {
        if let selectedStartDate = startDate, endDate == nil {
            if date > selectedStartDate {
                endDate = date
            } else {
                startDate = date
                endDate = selectedStartDate
            }
        } else {
            startDate = date
            endDate = nil
        }
    }

    private func dateSelectionState(for date: Date) -> Bool {
        if let selectedStartDate = startDate, let selectedEndDate = endDate {
            return date >= selectedStartDate && date <= selectedEndDate
        }
        return false
    }


    
    private func previousMonth() {
        selectedDate = Calendar.current.date(byAdding: .month, value: -1, to: selectedDate)!
    }
    
    private func nextMonth() {
        selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate)!
    }
}
