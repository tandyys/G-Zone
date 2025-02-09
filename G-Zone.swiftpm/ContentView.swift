import SwiftUI

struct ContentView: View {
    private let models: [String] = ["Mercury.scn", "Venus.scn", "Earth.scn", "Mars.scn", "Jupiter.scn", "Saturn.scn", "Uranus.scn", "Neptune.scn", "Moon.scn"]
    private let planets: [String] = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Moon"]
    private let planetsDetail: [String] = [
        "Mercury is the smallest planet and the closest to the Sun, but surprisingly, it’s not the hottest! A single day on Mercury lasts 176 Earth days, and because it has no atmosphere, daytime is scorching hot (800°F / 427°C) while nighttime is freezing cold (-290°F / -180°C). Mercury is also a lonely planet, it has no moons at all!",
        "Venus is hotter than an oven, reaching 900°F (475°C)—hot enough to melt lead! Its thick, cloudy atmosphere traps heat like a giant greenhouse, making it the hottest planet in the Solar System. Venus is also a little strange—it spins backward, meaning the Sun rises in the west and sets in the east. And guess what? A single day on Venus is actually longer than a whole year there!",
        "Earth is the only planet we know of with life and liquid water. About 70% of Earth is covered in water, making it the perfect home for animals, plants, and people. Earth has just one Moon, which helps control ocean tides. Unlike other planets where it rains acid or methane, Earth is the only place where it rains water!",
        "Mars is covered in rusty red dust, giving it its famous red color. It has the tallest volcano in the Solar System, Olympus Mons, which is three times taller than Mount Everest! Scientists believe that Mars once had rivers and lakes, meaning it might have been a wetter planet long ago. It even has seasons like Earth, but they last twice as long!",
        "Jupiter is the biggest planet in the Solar System—over 1,300 Earths could fit inside! It has a giant, never-ending storm called the Great Red Spot, which has been raging for over 300 years! Jupiter also has the strongest gravity of all planets and at least 79 moons, including Ganymede, the biggest moon in the Solar System!",
        "Saturn is famous for its beautiful rings, which are made of ice and rock. If you could find a bathtub big enough, Saturn would float on water! This planet has at least 146 moons, including Titan, which has lakes and rivers made of liquid methane instead of water. The winds on Saturn can be super strong, reaching speeds of 1,100 mph (1,800 km/h)!",
        "Uranus is really weird because it spins on its side, almost like it got knocked over by a giant space rock! It looks blue-green because of methane gas in its atmosphere. Uranus is also the coldest planet in the Solar System, with temperatures dropping to -371°F (-224°C). A year on Uranus is super long—it takes 84 Earth years to go around the Sun just once!",
        "Neptune is the farthest planet from the Sun and has the fastest winds in the Solar System, blowing at speeds of over 1,200 mph (1,931 km/h)—that’s faster than a jet plane! It has a giant storm called the Great Dark Spot, kind of like Jupiter’s Great Red Spot. Because it's so far away, one year on Neptune lasts 165 Earth years—that’s longer than a human lifetime! Neptune’s largest moon, Triton, is also special because it orbits backward, unlike any other large moon!",
        "The Moon is Earth's only natural satellite, and it's the fifth-largest moon in the Solar System. It’s about 1/4 the size of Earth, making it the largest moon relative to its planet. The Moon’s surface is covered in craters from space rocks hitting it, and it has no atmosphere, so it’s either super hot or freezing cold.!"
    ]
    private let planetsGravity: [Float] = [
        3.7,
        8.87,
        9.81,
        3.721,
        24.79,
        10.44,
        8.69,
        11.15,
        1.62
    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 250)
                    
                    ForEach(0..<models.count, id: \.self) { index in
                        CreateNavigationLink(destination: models[index], planet: planets[index], planetDetail: planetsDetail[index], planetGravity: planetsGravity[index])
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .ignoresSafeArea()
    }
        
    
    @ViewBuilder
    func CreateNavigationLink(destination: String, planet: String, planetDetail: String, planetGravity: Float) -> some View {
        NavigationLink(destination: DetailView(scene: .init(named: destination), detailTitle : planet, detailContent : planetDetail, planetGravity: planetGravity)) {
            Text("Explore " + planet)
                .font(.system(size: 24, weight: .heavy))
                .foregroundStyle(.black)
                .overlay(
                    Text("Explore " + planet)
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundColor(.white)
                        .offset(x: 2, y: 2)
                )
                .frame(width: 350, height: 70)
                .background(
                    Image(planet)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                )
                .padding(.top)
        }
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
