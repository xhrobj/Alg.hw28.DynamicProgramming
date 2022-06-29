typealias xmasTree = [[Int]]

var tree = xmasTree()
tree.append([1])
tree.append([2, 3])
tree.append([4, 5, 6])
tree.append([9, 8, 0, 3])

func maxPathSum(for tree: xmasTree) -> Int {
    guard !tree.isEmpty else { return 0 }

    let treeHeight = tree.count

    guard treeHeight > 1 else { return tree[0][0] }

    var (tree, levelIndex) = (tree, treeHeight - 2)

    while levelIndex >= 0 {
        let level = tree[levelIndex]
        for (i, x) in level.enumerated() {
            let left = x + tree[levelIndex + 1][i]
            let right = x + tree[levelIndex + 1][i + 1]
            tree[levelIndex][i] = max(left, right)
        }
        levelIndex -= 1
    }

    return tree[0][0]
}

print(maxPathSum(for: tree))
