//
//  player.swift
//  MAD-AFL2
//
//  Created by Patrick Steven Kent Sugiarto on 02/04/24.
//
// Player class
struct Player {
    var name: String
    var health: Int
    var mana: Int
    var damage: Int
    var golds: Int
    var backpack : Backpack

    mutating func playerAttack(enemy: inout Enemy) {
        enemy.health -= damage
    }
}
