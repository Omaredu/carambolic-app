//
//  Act.swift
//  carambolic
//
//  Created by Omar Sánchez on 25/11/23.
//

import Foundation

struct Act: Identifiable, Hashable {
    let id: String
    let image: URL
    let title: String
    let body: String
    
    init(id: String = UUID().uuidString, image: String, title: String, body: String) {
        self.id = id
        self.image = URL(string: image)!
        self.title = title
        self.body = body
    }
    
    public static let mocks = [
        // atompunk
        Act(image: "https://i.imgur.com/blr2IeL.png", 
            title: "Ecos del Futuro",
            body: "En la atompunk ciudad de Radiopolis, la vida giraba en torno a la promesa de un futuro atómico. Leo, un joven entusiasta del espacio, encontró un viejo proyector de películas en un desván olvidado."),
        
        // cyberpunk
        Act(image: "https://i.imgur.com/xJ5eTI4.png",
            title: "Sombras de Neón",
            body: "La ciudad cyberpunk nunca dormía; sus calles eran un laberinto de neón y secretos. Kai, un hacker con un don para desentrañar misterios digitales, se encontró atrapado en una red de intrigas más peligrosa que cualquier virus informático. Perseguido por corporaciones sin rostro, Kai navegaba por la ciudad, aliándose con figuras enigmáticas del submundo."),
        
        // dieselpunk
        Act(image: "https://i.imgur.com/iw296qw.png", 
            title: "El Legado del Motor",
            body: "En la ciudad dieselpunk, marcada por la industria y la resiliencia, Vivian, una mecánica con talento para lo imposible, descubrió un motor antiguo con un diseño único. Convencida de que podía revolucionar la tecnología existente, trabajó día y noche para restaurarlo."),
        
        // scifi
        Act(image: "https://i.imgur.com/xLKJzaw.png", 
            title: "El Último Vuelo en Neo-Terra",
            body: "En la ciudad de Neo-Terra, donde los rascacielos rozaban las estrellas y los coches voladores surcaban el cielo nocturno, la joven ingeniera Elara descubrió un secreto oculto. Entre circuitos y hologramas, halló un antiguo plano para un vehículo capaz de viajar más allá de su mundo conocido."),
        
        // solarpunk
        Act(image: "https://i.imgur.com/uC1ljO6.png", 
            title: "Raíces de Esperanza",
            body: "En un mundo donde la armonía entre la naturaleza y la tecnología era la norma, Ava, una botánica visionaria, soñaba con llevar la solarpunk utopía más allá de los límites de su ciudad jardín."),
        
        // steampunk
        Act(image: "https://i.imgur.com/7wmi7OB.png", 
            title: "Aire y Vapor",
            body: "En la era de los engranajes y el vapor, Isabella, una inventora prodigio, desafió las convenciones de su tiempo. Obsesionada con el cielo, diseñó un dirigible revolucionario, fusionando elegancia victoriana con ingeniería avanzada."),
    ]
}
