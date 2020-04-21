import UIKit

///Graph has Vertex and Edges
enum EdgeType {
    case directed
    case undirected
}

struct Vertex<T> {
    var data:T
    var index:Int
}

extension Vertex:Hashable where T:Hashable {}
extension Vertex:Equatable where T:Equatable {}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(index) : \(data)"
    }
}

//Dallas -- Huston
struct Edge<T> {
    var source: Vertex<T>
    var destination: Vertex<T>
    var weight: Double?
}

protocol Graph {
    associatedtype Element
    func createVertex(_ data:Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight:Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight:Double?)
    func addEdge(_ edgeType:EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight:Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {
    // add undirected edge
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight:Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    //add
    func addEdge(_ edgeType:EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight:Double?) {
        switch edgeType {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
    
}

class AdjacencyList<Element:Hashable>:Graph {

    private var adjacencies:[Vertex<Element>:[Edge<Element>]] = [:]
    init() {}
    
    func createVertex(_ data: Element) -> Vertex<Element> {
        let vertex = Vertex.init(data: data, index: adjacencies.count)
        adjacencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge.init(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    func edges(from source: Vertex<Element>) -> [Edge<Element>] {
        return adjacencies[source] ?? []
    }
    
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        return edges(from: source).first { $0.destination == destination }?.weight
    }
    
}
extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies { // 1
            var edgeString = ""
            for (index, edge) in edges.enumerated() { // 2
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ]\n") // 3
        }
        return result
    }
}

let graph = AdjacencyList<String>()

let singapore = graph.createVertex("Singapore")
let tokyo = graph.createVertex("Tokyo")
let hongKong = graph.createVertex("Hong Kong")
let detroit = graph.createVertex("Detroit")
let sanFrancisco = graph.createVertex("San Francisco")
let washingtonDC = graph.createVertex("Washington DC")
let austinTexas = graph.createVertex("Austin Texas")
let seattle = graph.createVertex("Seattle")

graph.addEdge(.undirected, from: singapore, to: hongKong, weight: 300)
graph.addEdge(.undirected, from: singapore, to: tokyo, weight: 500)
graph.addEdge(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.addEdge(.undirected, from: tokyo, to: detroit, weight: 450)
graph.addEdge(.undirected, from: tokyo, to: washingtonDC, weight: 300)
graph.addEdge(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
graph.addEdge(.undirected, from: detroit, to: austinTexas, weight: 50)
graph.addEdge(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
graph.addEdge(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
graph.addEdge(.undirected, from: washingtonDC, to: seattle, weight: 277)
graph.addEdge(.undirected, from: sanFrancisco, to: seattle, weight: 218)
graph.addEdge(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

print(graph)
