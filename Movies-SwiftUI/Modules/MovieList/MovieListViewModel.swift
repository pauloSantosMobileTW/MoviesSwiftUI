import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieEntity] = ["Bacurau",
                                       "Parasita",
                                       "La La Land",
                                       "O Poço",
                                       "Monica Laços",
                                       "La La Land",
                                       "O Poço"].map({MovieEntity(posterUrl: "https://br.web.img3.acsta.net/pictures/19/07/25/20/52/1819461.jpg", name: $0)})
}
