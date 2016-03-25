# Enter your code here. Read input from STDIN. Print output to STDOUT

def travel_graph(node_list, distance=0)
    next_nodes = []
    
    node_list.each do |node|
        $graph_distance[node] = distance
    end
    
    node_list.each do |node|
        $graph[node].each do |edge_node|
            next_nodes << edge_node if $graph_distance[edge_node] == -1
        end
    end
    return if next_nodes.empty?
    travel_graph(next_nodes, distance+6)
end

num_tests = gets().to_i()
1.upto(num_tests) do 
    
    $graph = {}
    $graph_distance = {}
    num_nodes, num_edges = gets().split(" ").map {|val| val.to_i} 
    
    (1..num_nodes).each do |index|
        $graph[index] = []
        $graph_distance[index] = -1
    end
    
    1.upto(num_edges) do
        node1, node2 = gets.split(" ").map {|val| val.to_i}
        $graph[node1] << node2 unless $graph[node1].include? node2
        $graph[node2] << node1 unless $graph[node2].include? node1
    end
    
    $graph.keys.each do |key|
        $graph[key] = $graph[key].sort
    end
    
    start_node = gets().to_i()
    travel_graph([start_node])
    $graph_distance.delete(start_node)
    puts $graph_distance.values.join(" ")
end
