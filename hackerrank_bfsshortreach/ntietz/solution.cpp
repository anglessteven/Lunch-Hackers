#include <iostream>
#include <vector>
#include <set>
using namespace std;

const int edgeWeight = 6;

struct Vertex {
  int id;
  int distance;
  vector<int> neighbors;
  Vertex(int id) : id(id), distance(-1), neighbors() { }
};

void handleTestCase() {
  int numberOfNodes = 0;
  int numberOfEdges = 0;
  int startNodeIdx = 0;

  cin >> numberOfNodes >> numberOfEdges;

  vector<Vertex> vertices;
  for (int idx = 0; idx < numberOfNodes; ++idx) {
    vertices.push_back(Vertex(idx));
  }

  for (int idx = 0; idx < numberOfEdges; ++idx) {
    int from, to;
    cin >> from >> to;
    from -= 1; to -= 1;
    vertices[from].neighbors.push_back(to);
    vertices[to].neighbors.push_back(from);
  }

  cin >> startNodeIdx;
  startNodeIdx -= 1; // damn 1-indexed input...

  vector<int> fringe;
  vector<int> nextFringe;
  fringe.push_back(startNodeIdx);
  int currentDistance = 0;

  while (fringe.size() > 0) {
    for (int idx : fringe) {
      Vertex& vertex = vertices[idx];
      if (vertex.distance < 0) {
        vertex.distance = currentDistance;
        for (int neighbor : vertex.neighbors) {
          nextFringe.push_back(neighbor);
        }
      }
    }
    fringe.clear();
    fringe.assign(nextFringe.begin(), nextFringe.end());
    nextFringe.clear();

    currentDistance += edgeWeight;
  }

  for (int idx = 0; idx < numberOfNodes; ++idx) {
    if (idx != startNodeIdx) {
      cout << vertices[idx].distance << " ";
    }
  }
  cout << endl;
}

int main() {
  int numTestCases = 0;
  cin >> numTestCases;

  for (int testCaseIdx = 0; testCaseIdx < numTestCases; ++testCaseIdx) {
    handleTestCase();
  }

  return 0;
}

