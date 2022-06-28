typealias xmasTree = [[Int]]

var tree = xmasTree()
tree.append([1])
tree.append([2, 3])
tree.append([4, 5, 6])
tree.append([9, 8, 0, 3])

func maxPathSum(for tree: xmasTree) -> Int {
    guard !tree.isEmpty else { return 0 }

    let height = tree.count

    guard height > 1 else { return tree[0][0] }

    var (tree, levelIndex) = (tree, height - 2)

    while levelIndex >= 0 {
        let level = tree[levelIndex]
        for (i, x) in level.enumerated() {
            tree[levelIndex][i] = max(x + tree[levelIndex + 1][i], x + tree[levelIndex + 1][i + 1])
        }
        levelIndex -= 1
    }

    return tree[0][0]
}

print(maxPathSum(for: tree))
