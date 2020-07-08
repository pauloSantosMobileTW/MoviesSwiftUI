import SwiftUI

struct EmptyCell: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(height: 150)
        }
    }
}
