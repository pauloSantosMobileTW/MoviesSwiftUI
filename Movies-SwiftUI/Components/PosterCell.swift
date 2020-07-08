import SwiftUI

struct PosterCell: GridCell {

    var item: MovieEntity

    init(entity: MovieEntity) {
        item = entity
    }
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: item.posterUrl)!,
                placeholder: PlaceHolder(),
               configuration: { $0.resizable() }
            )
            .frame(height: 150).cornerRadius(10)
            Text(item.name)
        }
    }

    private struct PlaceHolder: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
            .fill(Color.orange)
            .frame(height: 150)
        }
    }
}
