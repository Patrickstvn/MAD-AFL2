//
//  main.swift
//  MAD-AFL2
//
//  Created by Patrick Steven Kent Sugiarto on 02/04/24.
//
// main.swift
import Foundation

var player = Player(name: "Player", health: 100, mana: 75, damage: 20, golds: 100, backpack: Backpack(potionCount: 20, elixirCount: 20))

// all enemies
let troll = Troll()
let golem = Golem()
let wyvern = Wyvern()
let siren = Siren()
let basilisk = Basilisk()

enum ItemType {
    case potion
    case elixir
}

// Function for the opening screen
func openingScreen() {
    print("Welcome to the world of magic! 🧙‍♂️🧌")
    print("""
        \nYou have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts.
        Your adventures will take you through forests 🌲, mountains ⛰️, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.
    """)
    print("\nPress Enter to continue.")
       guard readLine() != nil else {
           print("Invalid input.")
           openingScreen()
           return
       }
       welcomeScreen()
}

// Fnction for the welcoming screen
func welcomeScreen() {
    print("\nMay I know your name, young wizard? (Letters A-Z only)")
    guard let playerName = readLine(), playerName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil else {
        print("Invalid input. Please enter alphabetic characters only.")
        welcomeScreen()
        return
    }
    player.name = playerName
    print("\nNice to meet you, \(player.name)!")
    journeyScreen()
}

// Function for the journey screen
func journeyScreen() {
    var choiceInput = ""
    while choiceInput != "q" {
        print("\nFrom here, you can...")
        print("""
            \n[C]heck your health and stats
            [F]ight enemies
            [B]rowse backpack
            [S]hop for potions and elixirs
            [Q]uit Game
            Your choice?
            """)
        choiceInput = readLine()?.lowercased() ?? ""
        
        switch choiceInput {
        case "c":
            playerStatScreen()
        case "f":
            chooseEnemyScreen()
        case "b":
            seeBackpack(player: player)
        case "s":
            visitShop()
        case "q":
            quitGame()
        default:
            print("Invalid choice. Please select again.")
        }
    }
}

//player stats
func playerStatScreen() {
    print("Player Name: \(player.name)")
    print("\nHealth: \(player.health)/100")
    print("Mana: \(player.mana)/75")
    
    print("Skills: ")
    print("Physical Attack 👊🏻")
    print("Meteor ☄️ ")
    print("Hell Fire 💥")
    print("Ice Spikes ❄️")
    print("Lightning Charge ⚡️")
    print("Shield 🛡️")
    
    print("\nItems : ")
    print("Potions: \(player.backpack.potionCount)")
    print("Elixirs: \(player.backpack.elixirCount)")
    print("\nPress Enter to continue to continue.")
       guard readLine() != nil else {
           print("Invalid input.")
           journeyScreen()
           return
       }
}


// choose enemy to fight
func chooseEnemyScreen() {
    print("\nWhich enemy do you want to fight?")
    print("[1] Troll")
    print("[2] Golem")
    print("[3] Wyvern")
    print("[4] Siren")
    print("[5] Basilisk")
    print("[Q] Quit to Journey Screen")
    
    var enemyChoice = ""
    repeat {
        enemyChoice = readLine()?.lowercased() ?? ""
        switch enemyChoice {
        case "1":
            print("As you enter the forest, you feel a sense of unease wash over you.")
            print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.")
            startBattle(enemy: troll)
        case "2":
            print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
            print("Suddenly, you hear the sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
            startBattle(enemy: golem)
        case "3":
            print("You find yourself standing at the entrance of a dark and ominous cave. You can hear the echoing screeches of a wyvern from deep within. Suddenly, it lounges at you and is ready to attack you.")
            startBattle(enemy: wyvern)
        case "4":
            print("You sail through treacherous waters, guided by the haunting melody of the sirens. As you approach their cove, their enchanting voices grow louder.")
            startBattle(enemy: siren)
        case "5":
            print("The ground trembles beneath your feet as you approach a cavernous chamber. Inside, the menacing gaze of a basilisk awaits.")
            startBattle(enemy: basilisk)
        case "q":
            return
        default:
            print("Invalid choice. Please select again.")
        }
    } while enemyChoice != "q"
}

// start battle with seletcted enemy
func startBattle(enemy: Enemy) {
    let battle = Battle(player: player, enemy: enemy)
    battle.startBattle()
}

func quitGame() {
    print("You abandoned your duty as a wizard and chose to go on a path of peace in a quiet little village.")
    print("Thank you for playing! Goodbye.")
    exit(0)
}

// view backpack items
func seeBackpack(player: Player) {
    print("\nBackpack Contents:")
    print("Health Potions: \(player.backpack.potionCount)")
    print("Mana Elixirs: \(player.backpack.elixirCount)")
}

// visit the shop
func visitShop() {
    var shop = Shop()
    print("\nWelcome to the Shop!")
    print("You have \(player.golds) golds.")
    print("What would you like to buy?")
    print("[1] Health Potion (25 golds) you have \(player.golds) golds.")
    print("[2] Mana Elixir (25 golds) you have \(player.golds) golds.")
    print("[3] Leave Shop")
    
    var shopChoice = ""
    while shopChoice != "3" {
        shopChoice = readLine()?.lowercased() ?? ""
        switch shopChoice {
        case "1":
            buyItem(itemType: .potion, shop: &shop)
        case "2":
            buyItem(itemType: .elixir, shop: &shop)
        case "3":
            print("Leaving shop.")
        default:
            print("Invalid choice. Please select again.")
        }
    }
}

// buy items from the shop
func buyItem(itemType: ItemType, shop: inout Shop) {
    if player.golds < 25 {
        print("You don't have enough golds to buy this item.")
        return
    }
    switch itemType {
    case .potion:
        if let potion = shop.buyPotion(player: &player) {
            player.backpack.potionCount += 1
            print("You bought a \(potion.name) for 25 golds. you have \(player.golds) golds left")
        }
    case .elixir:
        if let elixir = shop.buyElixir(player: &player) {
            player.backpack.elixirCount += 1
            print("You bought a \(elixir.name) for 25 golds. you have \(player.golds) golds left")
        }
    }
}
//start game
openingScreen()
