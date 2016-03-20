File file = new File("hackerrank_pacman-astar/input.txt")
InputStream stream = new FileInputStream(file)
System.setIn(stream)

reader = System.in.newReader()
pacman = null
food = null
mazeSize = null
maze = []
q = new PriorityQueue()


initialize()
def finalCell = aStar(pacman)
printSolution(finalCell)


private void initialize() {
    pacman = new Cell(splitNextLine(' ')*.toInteger())
    food = new Cell(splitNextLine(' ')*.toInteger())
    mazeSize = new Cell(splitNextLine(' ')*.toInteger())

    populateMaze()

    pacman.distance = 0
    pacman.guess = heuristic(pacman)
}

private List splitNextLine(regex) {
    reader.readLine().split(regex)
}

private void populateMaze() {
    mazeSize.x.times { i ->
        maze[i] = []
        splitNextLine('(?!^)').eachWithIndex { it, j ->
            maze[i][j] = (it == '%') ? null : new Cell(i, j)
        }
    }
}

private Cell aStar(current) {
    if(current.equals(food)) {
        return current
    }

    updateQueue(current, maze[current.x-1][current.y])  // UP
    updateQueue(current, maze[current.x][current.y-1])  // LEFT
    updateQueue(current, maze[current.x][current.y+1])  // RIGHT
    updateQueue(current, maze[current.x+1][current.y])  // DOWN

    next = q.poll()
    aStar(next)
}

private void updateQueue(current, next) {
    if(next != null && next.guess < 0) {
        updateNextCell(current, next)
        q.add(next)
    }
}

private void updateNextCell(current, next) {
    next.distance = current.distance + 1
    next.guess = next.distance + heuristic(next)
    next.prev = current
}

private int heuristic(cell) {
    return Math.abs(food.x - cell.x) + Math.abs(food.y - cell.y)
}

private void printSolution(finalCell) {
    cell = finalCell
    output = cell
    while(cell.prev) {
        output = "${cell.prev}\n${output}"
        cell = cell.prev
    }

    println finalCell.distance
    println output
}

class Cell implements Comparable {
    private int x
    private int y
    private int distance = Integer.MAX_VALUE
    private int guess = -1
    private Cell prev

    private Cell(List coords) {
        this(coords[0], coords[1])
    }

    private Cell(int x, int y) {
        this.x = x
        this.y = y
    }

    public int compareTo(that) {
        return this.guess.compareTo(that.guess)
    }

    public boolean equals(that) {
        return this.x == that.x && this.y == that.y
    }

    public String toString() {
        return x + " " + y
    }
}