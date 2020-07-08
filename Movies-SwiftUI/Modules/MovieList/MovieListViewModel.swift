import Combine
import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieEntity] = []
    private var cancellable: AnyCancellable?

    init() {
        loadMovies()
    }

    func loadMovies() {
        let baseUrl = "https://api.themoviedb.org/3/discover/movie"
        let apiKey = "?api_key=305517763634d75923ab75f2c23235b5"
        let path = "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
        let url = URL(string: baseUrl + apiKey + path)!

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: MovieDiscoverResponse.self, decoder: JSONDecoder())
            .map { self.convertMovieResponseToMovieEntity(movieResponse: $0) }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .assign(to: \.movies, on: self)
    }

    func convertMovieResponseToMovieEntity(movieResponse: MovieDiscoverResponse) -> [MovieEntity] {
        movieResponse.movieModel.map { movie in
            MovieEntity(posterUrl: "https://image.tmdb.org/t/p/w154/" + movie.posterPath, name: movie.originalTitle)
        }
    }
}
