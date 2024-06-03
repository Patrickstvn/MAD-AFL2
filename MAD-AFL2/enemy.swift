//
//  enemy.swift
//  MAD-AFL2
//
//  Created by Patrick Steven Kent Sugiarto on 02/04/24.
//
import Foundation
//class for all enemies
protocol Enemy {
    var name: String { get }
    var health: Int { get set }
    var attackDamage: Int { get }
    
    func attack(by player: inout Player)
}

extension Enemy {
    func attack(by player: inout Player) {
        player.health -= attackDamage
    }
}

class Troll: Enemy {
    var name = "Jumbo Troll"
    var health = 300
    var attackDamage = 5
    
    func attack(by player: inout Player) {
        player.health -= attackDamage
    }
}

class Golem: Enemy {
    var name = "Mountain Golem"
    var health = 800
    var attackDamage = 10
    
    func attack(by player: inout Player) {
        player.health -= attackDamage
    }
}

class Wyvern: Enemy {
    var name = "Wyvern"
    var health = 500
    var attackDamage = 10
    
    func attack(by player: inout Player) {
        player.health -= attackDamage
    }
}

class Siren: Enemy {
    var name = "Siren"
    var health = 500
    var attackDamage = 10
    
    func attack(by player: inout Player) {
        player.health -= attackDamage
    }
}

class Basilisk: Enemy {
    var name = "Basilisk"
    var health = 1000
    var attackDamage = 5
    
    func attack(by player: inout Player) {
        player.health -= attackDamage
    }
}
