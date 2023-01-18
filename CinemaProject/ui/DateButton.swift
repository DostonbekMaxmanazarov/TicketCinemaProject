import SwiftUI

struct DateButton: View {
    @State var weekDay: String = "Sat"
    @State var numDay: String = "23"
    
    @State var width: CGFloat = 50
    @State var height: CGFloat = 80
    
    @Binding var isSelected: Bool
    @State var action: () -> Void = {}
    
    var currentBorderColors: [Color] = [Color("colorLightBlue"), Color("colorLightBlue").opacity(0), Color("colorLightBlue").opacity(0)]
    var currentGradient: [Color] = [Color("colorBackgroundLighter"), Color("colorGreenCircle")]
    
    var selectedBorderColors: [Color] = [Color("colorWisteriaCircle"), Color("colorWisteriaCircle").opacity(0), Color("colorWisteriaCircle").opacity(0)]
    var selectedGradient: [Color] = [Color("colorSlateBlue"), Color("colorElectiricIndigo")]
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(weekDay)
                
                Text(numDay)
                    .fontWeight(.bold)
            }
            .font(.subheadline)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(LinearGradient(colors: isSelected ? selectedGradient : currentGradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(colors: isSelected ? selectedBorderColors : currentBorderColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                    .frame(width: width - 1, height: height - 1)
            }
        }
    }
}
