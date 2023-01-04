import SwiftUI

struct BookingView: View {
    
    @Environment(\.presentationMode) var dismiss
    
    @State var gradient = [Color("colorBackgroundDarker").opacity(0), Color("colorBackgroundDarker"), Color("colorBackgroundDarker"), Color("colorBackgroundDarker")]
    
    @State var selectedDate = false
    @State var selectedHour = false
    @State var bindingSelection = false
    
    var body: some View {
        
            ZStack {
                Image("booking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack {
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: UIScreen.main.bounds.height/2)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                VStack(spacing: 0.0) {
                    HStack {
                        CircleButton(action: {
                            dismiss.wrappedValue.dismiss()
                        }, image: "arrow.left")
                        
                        Spacer()
                        
                        CircleButton(action: {}, image: "ellipsis")
                        
                    }.padding(24)
                        .padding(.top, 36)
                    
                    Text("Doctor Strange")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 200)
                    
                    Text("in the Multiverse of Madness")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Text("Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of... ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(30)
                    
                    Text("Select date and time")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    HStack(alignment: .top, spacing: 16) {
                        DateButton(weekDay: "Thu", numDay: "21", isSelected: $bindingSelection)
                            .padding(.top, 90)
                        
                        DateButton(weekDay: "Fri", numDay: "22", isSelected: $bindingSelection)
                            .padding(.top, 56)
                        
                        DateButton(weekDay: "Sat", numDay: "23", width: 70, height: 100, isSelected: $selectedDate, action: {
                            withAnimation(.spring()) {
                                selectedDate.toggle()
                            }
                        }).padding(.top, 16)
                        
                        DateButton(weekDay: "Sun", numDay: "24", isSelected: $bindingSelection)
                            .padding(.top, 56)
                        
                        DateButton(weekDay: "Mon", numDay: "25", isSelected: $bindingSelection)
                            .padding(.top, 90)
                    }
                    
                    HStack(alignment: .top, spacing: 16.0) {
                        TimeButton(hour: "16:00", isSelected: $bindingSelection)
                            .padding(.top, 20)
                        
                        TimeButton(hour: "17:00", isSelected: $bindingSelection)
                        
                        TimeButton(hour: "18:00", width: 70, height: 40, isSelected: $selectedHour, action: {
                            withAnimation(.spring()) {
                                selectedHour.toggle()
                            }
                        }).padding(.top, -20)
                        
                        TimeButton(hour: "19:00", isSelected: $bindingSelection)
                        
                        TimeButton(hour: "20:00", isSelected: $bindingSelection)
                            .padding(.top, 20)
                    }
                    
                    NavigationLink {
                        SeatsView()
                    } label: {
                        LargeButton()
                            .padding(16)
                            .offset(y: selectedDate && selectedHour ? 0 : 200)
                    }
                    
                }.frame(maxHeight: .infinity, alignment: .top)
                
            }.background(Color("colorBackgroundDarker"))
                .ignoresSafeArea()
                .navigationBarHidden(true)
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
