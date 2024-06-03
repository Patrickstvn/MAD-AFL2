//
//  skills.swift
//  MAD-AFL2
//
//  Created by Patrick Steven Kent Sugiarto on 02/04/24.
//
import Foundation

// Base class for skills
class Skills {
    var name: String
    var damage: Int
    var manaCost: Int
    
    init(name: String, damage: Int, manaCost: Int) {
        self.name = name
        self.damage = damage
        self.manaCost = manaCost
    }
    
    func performAttack(enemyHealth: Int, player: inout Player) -> Int {
        print("You deal \(damage) damage to the enemy.")
        
        if manaCost <= player.mana {
            player.mana -= self.manaCost
            var enemyHealth = enemyHealth - damage
        } else {
            print("You tried to use this spell but you do not have enough mana to use this spell. The Enemy attacked you.")
            
        }
        
        
        
        
        
        return enemyHealth
    }
}

// Shield Skill
class Shield: Skills {    
    init() {
        super.init(name: "Shield", damage: 0, manaCost: 0 )
    }
    
    func execute() {
        print("You protect yourself with a shield for one round.")
    }
}
