import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieEntity] = ["Bacurau",
                                       "Parasita",
                                       "La La Land",
                                       "O Poço",
                                       "Monica Laços",
                                       "La La Land",
                                       "O Poço"].map({MovieEntity(posterUrl: "", name: $0)})
}
