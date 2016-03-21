import java.io.File;
import java.util.*;

public class Solution {

    public static void main(String[] args) throws Exception {
        Scanner input = new Scanner(new File("input.txt"));

        int testCases = input.nextInt();
        for (int i = 0; (i < testCases); i++) {
            int numNodes = input.nextInt();
            int numEdges = input.nextInt();

            // init nodes
            Node[] nodes = new Node[numNodes];
            for (int j = 0; (j < nodes.length); j++) {
                Node node = new Node();
                nodes[j] = node;
            }

            // add edges
            for (int k = 0; (k < numEdges); k++) {
                int src = input.nextInt();
                int dest = input.nextInt();

                nodes[src - 1].neighbors.add(nodes[dest - 1]); // more 1-based indexing
                nodes[dest - 1].neighbors.add(nodes[src - 1]);
            }

            int start = input.nextInt();
            nodes[start - 1].distance = 0; // again with the 1-based indexing!
            bfsShortReach(nodes, start);
        }
    }

    private static void bfsShortReach(Node[] nodes, int start) {
        Queue<Node> q = new LinkedList<>();

        q.add(nodes[start - 1]); // 1-based indexes are so stupid

        while (!q.isEmpty()) {
            Node cur = q.remove();

            for (Node neighbor : cur.neighbors) {
                if (neighbor.distance == -1) {
                    neighbor.distance = cur.distance + 6;
                    q.add(neighbor);
                }
            }
        }

        for (int i = 0; (i < nodes.length); i++) {
            if (i + 1 != start) {
                System.out.print(nodes[i].distance + " ");
            }
        }

        System.out.println();
    }

    static class Node {
        int distance = -1;
        List<Node> neighbors = new ArrayList<>();
    }
}
