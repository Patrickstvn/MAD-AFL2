//
//  potion.swift
//  MAD-AFL2
//
//  Created by Patrick Steven Kent Sugiarto on 02/04/24.
//
import Foundation

class Backpack {
    var potionCount: Int
    var elixirCount: Int

    init(potionCount: Int, elixirCount: Int) {
        self.potionCount = potionCount
        self.elixirCount = elixirCount
    }
}

class Potion: Backpack {
    var potionName: String

    init(potionName: String, potionCount: Int) {
        self.potionName = potionName
        super.init(potionCount: potionCount, elixirCount: 0)
    }
}

class Elixir: Backpack {
    var elixirName: String

    init(elixirName: String, elixirCount: Int) {
        self.elixirName = elixirName
        super.init(potionCount: 0, elixirCount: elixirCount)
    }
}
