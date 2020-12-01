import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn more")            }
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            if let url = URL(string: framework.urlString) {
                SafariView(url: url)
            }
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(
            framework: MockData.sampleFramework,
            isShowingDetailView: .constant(false)
        )
    }
}
