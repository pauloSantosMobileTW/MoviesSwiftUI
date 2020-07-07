import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            Grid<PosterCell>(items: viewModel.movies)
                .navigationBarTitle("Movie List")
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
