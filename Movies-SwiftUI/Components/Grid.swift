import SwiftUI

protocol CellEntity {}

protocol GridCell: View {
    associatedtype Entity where Entity: CellEntity
    var item: Self.Entity { get set }
    init(entity: Entity)
}

struct Grid<GenericCell: GridCell>: View {
    var items: [GenericCell.Entity]
    var numberOfColums = 3
    var lines: Int {
        Int(Double(items.count/numberOfColums).rounded(.up))
    }

    func shouldShowCell(line: Int, colum: Int) -> Bool {
        (colum + line * numberOfColums) < items.count
    }

    func itemFor(line: Int, colum: Int) -> GenericCell.Entity {
        items[(colum + line * numberOfColums)]
    }

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<lines + 1, id: \.self) { line in
                    HStack {
                        ForEach(0..<self.numberOfColums) { colum in
                            if self.shouldShowCell(line: line,
                                                   colum: colum) {
                                GenericCell(entity: self.itemFor(line: line, colum: colum))
                            } else {
                                EmptyCell()
                            }
                        }
                    }
                }
            }.padding()
        }
    }
}
