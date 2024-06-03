//
//  shop.swift
//  MAD-AFL2
//
//  Created by Patrick Steven Kent Sugiarto on 04/04/24.
//
import Foundation

protocol Item {
    var name: String { get }
    var price: Int { get }
}

struct HealthPotion: Item {
    let name = "Health Potion"
    let price = 25
}

struct ManaElixir: Item {
    let name = "Mana Elixir"
    let price = 25
}

// Define Shop structure
struct Shop {
    let maxItemCount = 10
    var potionsAvailable: Int = 10
    var elixirsAvailable: Int = 10

    //bfunc to if no money
    mutating func buyPotion(player: inout Player) -> HealthPotion? {
        guard potionsAvailable > 0 else {
            print("Sorry, no more potions available.")
            return nil
        }
        guard player.golds >= HealthPotion().price else {
            print("Sorry, you don't have enough golds to buy a potion.")
            return nil
        }
        potionsAvailable -= 1
        player.golds -= HealthPotion().price
        return HealthPotion()
    }

    //bfunc to if no money
    mutating func buyElixir(player: inout Player) -> ManaElixir? {
        guard elixirsAvailable > 0 else {
            print("Sorry, no more elixirs available.")
            return nil
        }
        guard player.golds >= ManaElixir().price else {
            print("Sorry, you don't have enough golds to buy an elixir.")
            return nil
        }
        elixirsAvailable -= 1
        player.golds -= ManaElixir().price
        return ManaElixir()
    }
}
