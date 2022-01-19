//
//  main.swift
//  BFS
//
//  Created by 김병엽 on 2022/01/19.
//

import Foundation

// 그래프 표현
let graph: [String : [String]] = [
    "A" : ["B", "C"],
    "B" : ["A", "D", "E"],
    "C" : ["A", "F"],
    "D" : ["B"],
    "E" : ["B"],
    "F" : ["C"]
]

func BFS(graph: [String : [String]], start: String) -> [String] {
    // 방문했던 노드 Queue
    var visitedQueue: [String] = []
    // 방문하려는 노드 Queue
    var needVisitedQueue: [String] = [start]
    
    // 방문할 노드가 없을때까지 반복
    while !(needVisitedQueue.isEmpty) {
        // 방문할 노드 Queue의 첫번째 값 제거
        let node: String = needVisitedQueue.removeFirst()
        // 방문할 노드가 방문했던 노드 Queue에 존재하면 continue
        if visitedQueue.contains(node) { continue }
        
        // 방문했던 노드 Queue에 추가
        visitedQueue.append(node)
        // 방문할 노드 Queue에 방문했던 노드의 자식노드를 추가, 없을시 빈 배열 추가
        needVisitedQueue += graph[node] ?? []
    }
    return visitedQueue
}

print(BFS(graph: graph, start: "A"))
