import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: TabEnum
    
    var backgroundColor = [Color("colorSlateBlue"), Color("colorLightBlue"), Color("colorPink")]
    
    var gradientStroke = [Color("colorBlueStroke"), Color("colorLightBlueStroke")]
    
    var body: some View {
        GeometryReader { geometry in
            
            let geometryWidth = geometry.size.width
            
            HStack(spacing: 0.0) {
                ForEach(TabEnum.allCases, id:\.rawValue) { tab in
                    
                    Button(action:{
                        withAnimation(.easeInOut){
                            currentTab = tab
                        }
                    }){
                        Image(tab.rawValue)
                            .renderingMode(.template)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .offset(y: currentTab == tab ? -16 : 0)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading){
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 80, height: 80)
                    .shadow(color: Color.black.opacity(0.25), radius: 20, x: 0, y: 10)
                    .offset(x: indicatorOffset(width: geometryWidth), y: -16)
                    .overlay{
                        Circle()
                            .trim(from: 0, to: CGFloat(0.5))
                            .stroke(
                                LinearGradient(colors: gradientStroke, startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2)
                            )
                            .rotationEffect(.degrees(135))
                            .frame(width: 78, height: 78)
                            .offset(x: indicatorOffset(width: geometryWidth), y: -16)
                        
                    }
            }
        }
        .frame( height: 24)
        .padding(.top, 30)
        .background(.ultraThinMaterial)
        .background(LinearGradient(colors: backgroundColor, startPoint: .leading, endPoint: .trailing))
    }
    
    func indicatorOffset(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 { return 0 }
        let buttonWidth = width / CGFloat(TabEnum.allCases.count)
        
        return index * buttonWidth
    }
    
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .category:
            return 3
        case .location:
            return 1
        case .profile:
            return 4
        case .ticket:
            return 2
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
