import Foundation

struct Amp {
  let id: Int
  let brand: String
  let model: String
  let description: String
  let rating: Int
}

extension Amp {
  static var all: [Amp] {
    return [Amp(id: 1, brand: "Vox",
                model: "AC30",
                description: "Loved by The Beatles, Tom Petty and U2's The Edge",
                rating: 9),
            Amp(id: 2,
                brand: "Marshall",
                model: "JCM800",
                description: "The amp of choice for players of hard rock, like Slash from Guns N' Roses",
                rating: 7),
            Amp(id: 3, brand: "Roland",
                model: "JC-120",
                description: "Produces the most popular clean sound in rock",
                rating: 8)]
  }
}
