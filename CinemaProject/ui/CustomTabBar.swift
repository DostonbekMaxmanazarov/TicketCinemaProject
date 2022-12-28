import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: TabEnum
    
    var backgroundColor = [Color("colorSlateBlue"), Color("colorLightBlue"), Color("colorPink")]
    
    var body: some View {
        VStack {
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
            }.frame(maxWidth: .infinity)
        }.frame( height: 24)
            .padding(.top, 30)
            .background(.ultraThinMaterial)
            .background(LinearGradient(colors: backgroundColor, startPoint: .leading, endPoint: .trailing))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
