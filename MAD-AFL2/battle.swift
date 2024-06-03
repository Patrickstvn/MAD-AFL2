//
//  battle.swift
//  MAD-AFL2
//
//  Created by Patrick Steven Kent Sugiarto on 02/04/24.
//
//

import Foundation

class Battle {
    var player: Player
    var enemy: Enemy

    init(player: Player, enemy: Enemy) {
        self.player = player
        self.enemy = enemy
    }

    func startBattle() {
        print("Battle starts!")
        battleScreen()
    }

    func battleScreen() {
        print("\n😈Name: \(enemy.name)")
        print("😈Health: \(enemy.health)")
        print("|||||||||||||||||||||||||||||")
        print("🧙Name: \(player.name)")
        print("🧙Mana: \(player.mana)")
        print("🧙Health: \(player.health)")
        print("""
            Choose your action:
            [1] Physical Attack 👊🏻. No mana required. Deal damage based on the enemy's type.
            [2] Meteor ☄️. Use 20pt of MP. Deal damage based on the enemy's type.
            [3] Hell Fire 💥. Use 30pt of MP. Deal damage based on the enemy's type.
            [4] Ice Spikes ❄️. Use 30pt of MP. Deal damage based on the enemy's type.
            [5] Lightning Charge ⚡️. Use 30pt of MP. Deal damage based on the enemy's type.
            [6] Shield 🛡️. Block enemy's attack for 1 turn.
            [7] Use Potion 🧪 to heal wound. Player HP: \(player.health), Available Potions: \(player.backpack.potionCount)
            [8] Use Elixir 🍾 to add MP. Player MP: \(player.mana), Available Elixirs: \(player.backpack.elixirCount)
            [9] Scan enemy's vital.
            [10] Flee from battle.
            
            Your choice?
            """)

        guard let battleInput = readLine() else {
            print("Invalid input.")
            return
        }

        switch battleInput {
        case "1":
            performPhysicalAttack()
        case "2":
            performMeteorAttack()
        case "3" :
            performHellfire()
        case "4" :
            performIceSpikes()
        case "5" :
            performLightningCharge()
        case "6":
            let shield = Shield()
            shield.execute()
            battleScreen()
        case "7":
            usePotion()
            battleScreen()
        case "8":
            useElixir()
            battleScreen()
        case "9":
            print("You scanned \(enemy.name)'s weakness.")
            scanEnemyVital()
            battleScreen()
        case "10":
            journeyScreen()
        default:
            print("Invalid choice, pick again.")
            battleScreen()
        }
    }

    func performPhysicalAttack() {
        let skill: Skills
        if let troll = enemy as? Troll {
            skill = Skills(name: "Physical Attack", damage: 20, manaCost: 0)
            troll.health = skill.performAttack(enemyHealth: troll.health, player: &player)
        } else if let golem = enemy as? Golem {
            skill = Skills(name: "Physical Attack", damage: 10, manaCost: 0)
            golem.health = skill.performAttack(enemyHealth: golem.health, player: &player)
        } else if let siren = enemy as? Siren {
            skill = Skills(name: "Physical Attack", damage: 20, manaCost: 0)
            siren.health = skill.performAttack(enemyHealth: siren.health, player: &player)
        } else if let wyvern = enemy as? Wyvern {
            skill = Skills(name: "Physical Attack", damage: 25, manaCost: 0)
            wyvern.health = skill.performAttack(enemyHealth: wyvern.health, player: &player)
        } else if let basilisk = enemy as? Basilisk {
            skill = Skills(name: "Physical Attack", damage: 10, manaCost: 0)
            basilisk.health = skill.performAttack(enemyHealth: basilisk.health, player: &player)
        } else {
            print("Enemy type not recognized.")
        }
        enemyAttack()
    }

    func performMeteorAttack() {
        let skill: Skills
        if let troll = enemy as? Troll {
            skill = Skills(name: "Meteor Attack", damage: 50, manaCost: 20)
            troll.health = skill.performAttack(enemyHealth: troll.health, player: &player)
        } else if let golem = enemy as? Golem {
            skill = Skills(name: "Meteor Attack", damage: 50, manaCost: 20)
            golem.health = skill.performAttack(enemyHealth: golem.health, player: &player)
        } else if let siren = enemy as? Siren {
            skill = Skills(name: "Meteor Attack", damage: 40, manaCost: 20)
            siren.health = skill.performAttack(enemyHealth: siren.health, player: &player)
        } else if let wyvern = enemy as? Wyvern {
            skill = Skills(name: "Meteor Attack", damage: 30, manaCost: 20)
            wyvern.health = skill.performAttack(enemyHealth: wyvern.health, player: &player)
        } else if let basilisk = enemy as? Basilisk {
            skill = Skills(name: "Meteor Attack", damage: 40, manaCost: 20)
            basilisk.health = skill.performAttack(enemyHealth: basilisk.health, player: &player)
        } else {
            print("Enemy type not recognized.")
        }
        enemyAttack()
    }
    func performHellfire() {
        let skill: Skills
        if let troll = enemy as? Troll {
            skill = Skills(name: "Hell Fire Attack", damage: 30, manaCost: 30)
            troll.health = skill.performAttack(enemyHealth: troll.health, player: &player)
        } else if let golem = enemy as? Golem {
            skill = Skills(name: "Hell Fire Attack", damage: 10, manaCost: 30)
            golem.health = skill.performAttack(enemyHealth: golem.health, player: &player)
        } else if let siren = enemy as? Siren {
            skill = Skills(name: "Hell Fire Attack", damage: 70, manaCost: 30)
            siren.health = skill.performAttack(enemyHealth: siren.health, player: &player)
        } else if let wyvern = enemy as? Wyvern {
            skill = Skills(name: "Hell Fire Attack", damage: 10, manaCost: 30)
            wyvern.health = skill.performAttack(enemyHealth: wyvern.health, player: &player)
        } else if let basilisk = enemy as? Basilisk {
            skill = Skills(name: "Hell Fire Attack", damage: 10, manaCost: 30)
            basilisk.health = skill.performAttack(enemyHealth: basilisk.health, player: &player)
        } else {
            print("Enemy type not recognized.")
        }
        enemyAttack()
    }

    func performIceSpikes() {
        let skill: Skills
        if let troll = enemy as? Troll {
            skill = Skills(name: "Ice Spikes Attack", damage: 30, manaCost: 30)
            troll.health = skill.performAttack(enemyHealth: troll.health, player: &player)
        } else if let golem = enemy as? Golem {
            skill = Skills(name: "Ice Spikes Attack", damage: 10, manaCost: 30)
            golem.health = skill.performAttack(enemyHealth: golem.health, player: &player)
        } else if let siren = enemy as? Siren {
            skill = Skills(name: "Ice Spikes Attack", damage: 30, manaCost: 30)
            siren.health = skill.performAttack(enemyHealth: siren.health, player: &player)
        } else if let wyvern = enemy as? Wyvern {
            skill = Skills(name: "Ice Spikes Attack", damage: 70, manaCost: 30)
            wyvern.health = skill.performAttack(enemyHealth: wyvern.health, player: &player)
        } else if let basilisk = enemy as? Basilisk {
            skill = Skills(name: "Ice Spikes Attack", damage: 30, manaCost: 30)
            basilisk.health = skill.performAttack(enemyHealth: basilisk.health, player: &player)
        } else {
            print("Enemy type not recognized.")
        }
        enemyAttack()
    }


    func performLightningCharge() {
        let skill: Skills
        if let troll = enemy as? Troll {
            skill = Skills(name: "Lightning Charge Attack", damage: 30, manaCost: 30)
            troll.health = skill.performAttack(enemyHealth: troll.health, player: &player)
        } else if let golem = enemy as? Golem {
            skill = Skills(name: "Lightning Charge Attack", damage: 70, manaCost: 30)
            golem.health = skill.performAttack(enemyHealth: golem.health, player: &player)
        } else if let siren = enemy as? Siren {
            skill = Skills(name: "Lightning Charge Attack", damage: 10, manaCost: 30)
            siren.health = skill.performAttack(enemyHealth: siren.health, player: &player)
        } else if let wyvern = enemy as? Wyvern {
            skill = Skills(name: "Lightning Charge Attack", damage: 30, manaCost: 30)
            wyvern.health = skill.performAttack(enemyHealth: wyvern.health, player: &player)
        } else if let basilisk = enemy as? Basilisk {
            skill = Skills(name: "Lightning Charge Attack", damage: 70, manaCost: 30)
            basilisk.health = skill.performAttack(enemyHealth: basilisk.health, player: &player)
        } else {
            print("Enemy type not recognized.")
        }
        enemyAttack()
    }

    func enemyAttack() {
        enemy.attack(by: &player)
        if player.health <= 0 {
            print("\(enemy.name) wins the battle!")
            print("You are DEAD and got eaten by \(enemy.name). Try Again.")
            openingScreen()
        } else if enemy.health <= 0 {
            print("You have killed the monster and gained 500 gold!")
            player.golds += 500
            journeyScreen()
        } else {
            battleScreen()
        }
    }

    func usePotion() {
        if player.health >= 100 {
            print("Your health is already at maximum!")
            return
        }
        // let restoredHealth = min(20, 100 - player.health) = caalculate restored mana without exceeding the maximum mana
        if player.backpack.potionCount > 0 {
            let restoredHealth = min(20, 100 - player.health)
            player.health += restoredHealth
            player.backpack.potionCount -= 1
            print("You used a potion and restored \(restoredHealth) health.")
        } else {
            print("You don't have any potions left.")
        }
    }

    func useElixir() {
        if player.mana >= 75 {
            print("Your mana is already at maximum!")
            return
        }

        if player.backpack.elixirCount > 0 {
            let restoredMana = min(30, 75 - player.mana)
            player.mana += restoredMana
            player.backpack.elixirCount -= 1
            print("You used an elixir and restored \(restoredMana) mana.")
        } else {
            print("You don't have any elixirs left.")
        }
    }
    func scanEnemyVital() {
      // hellfire does 70 damage to siren but does 10 damage to golem,basilisk,wyvern and does 30  to troll. IceSpikes does 70 damage to Wyvern but does 10 damage to Golem and does 30 damage to troll,siren, and basilisk. LightningCharge does 70 damage to basilisk and golem but does 10 damage to siren and does 30 damage to troll,wyvern
          print("You scanned \(enemy.name)'s vital.")
        if enemy is Troll {
              print("A formidable opponent with no vulnerability but can be hit with ANYTHING.")
        } else if enemy is Golem {
              print("A mighty adversary susceptible to LIGHTNING ⚡️ strikes yet resistant to FIRE 🔥 and ICE ❄️ assaults.")
        } else if enemy is Siren {
              print(": A deceptive foe weakened by FIRE 🔥 attacks but resistant to LIGHTNING ⚡️ based assaults.")
        } else if enemy is Wyvern {
              print("A fearsome creature susceptible to ICE ❄️ attacks but resistant to FIRE 🔥 based assaults.")
        } else if enemy is Basilisk {
              print("A menacing serpent vulnerable to LIGHTNING ⚡️ attacks but resilient against FIRE 🔥 assaults.")
          } else {
              print("Enemy type not recognized.")
          }
      }

   
}
