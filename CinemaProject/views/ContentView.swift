import SwiftUI

struct ContentView: View {
    
    @State var currentTab: TabEnum = .home
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
            TabView(selection: $currentTab) {
                Text("Home")
                    .tag(TabEnum.home)
                
                Text("Location")
                    .tag(TabEnum.location)
                
                TicketView()
                    .tag(TabEnum.ticket)
                
                Text("Category")
                    .tag(TabEnum.category)
                
                Text("Profile")
                    .tag(TabEnum.profile)
            }
            
            CustomTabBar(currentTab: $currentTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
