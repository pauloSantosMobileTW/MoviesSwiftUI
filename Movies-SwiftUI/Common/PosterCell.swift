import SwiftUI

struct PosterCell: GridCell {
    var item: MovieEntity

    init(entity: MovieEntity) {
        item = entity
    }
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange)
                .frame(height: 150)
            Text(item.name)
        }
    }
}
