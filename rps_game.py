#!/usr/bin/env python3
"""
Rock, Paper, Scissors Game
Just a fun little game to pass the time!
"""

import random
import time

def show_welcome():
    """Show the welcome screen with some personality."""
    print("=" * 50)
    print("ROCK, PAPER, SCISSORS GAME")
    print("=" * 50)
    print("Hey there! Ready to play? Here's how it works:")
    print("• Rock beats Scissors (obviously)")
    print("• Paper beats Rock (paper is sneaky like that)")
    print("• Scissors beats Paper (snip snip!)")
    print("• If you pick the same thing, it's a tie")
    print("=" * 50)

def get_player_move():
    """Get what the player wants to throw."""
    while True:
        print("\nWhat are you going to throw?")
        print("1. Rock (r)")
        print("2. Paper (p)")
        print("3. Scissors (s)")
        print("4. I'm done (q)")
        
        choice = input("\nYour choice: ").lower().strip()
        
        if choice in ['r', 'rock', '1']:
            return 'rock'
        elif choice in ['p', 'paper', '2']:
            return 'paper'
        elif choice in ['s', 'scissors', '3']:
            return 'scissors'
        elif choice in ['q', 'quit', '4', 'done']:
            return 'quit'
        else:
            print("Hmm, that's not a valid choice. Try again!")

def computer_picks():
    """Computer makes its random choice."""
    choices = ['rock', 'paper', 'scissors']
    return random.choice(choices)

def who_wins(player_choice, computer_choice):
    """Figure out who won this round."""
    if player_choice == computer_choice:
        return 'tie'
    
    # The winning combinations
    wins = {
        'rock': 'scissors',
        'paper': 'rock', 
        'scissors': 'paper'
    }
    
    if wins[player_choice] == computer_choice:
        return 'player'
    else:
        return 'computer'

def show_moves(player_choice, computer_choice):
    """Show what everyone picked."""
    print(f"\nYou threw: {player_choice.upper()}")
    print(f"Computer threw: {computer_choice.upper()}")

def show_round_result(result):
    """Show who won this round."""
    print("\n" + "=" * 30)
    if result == 'tie':
        print("It's a tie!")
    elif result == 'player':
        print("You won this round!")
    else:
        print("Computer got this one!")
    print("=" * 30)

def main_game():
    """The main game loop."""
    player_score = 0
    computer_score = 0
    ties = 0
    
    show_welcome()
    
    while True:
        player_choice = get_player_move()
        
        if player_choice == 'quit':
            break
            
        print("\nComputer is thinking...")
        time.sleep(1)  # Build some suspense
        
        computer_choice = computer_picks()
        show_moves(player_choice, computer_choice)
        
        result = who_wins(player_choice, computer_choice)
        show_round_result(result)
        
        # Update the score
        if result == 'player':
            player_score += 1
        elif result == 'computer':
            computer_score += 1
        else:
            ties += 1
            
        # Show current score
        print(f"\nCurrent score:")
        print(f"   You: {player_score}")
        print(f"   Computer: {computer_score}")
        print(f"   Ties: {ties}")
        
        # Ask if they want to keep playing
        play_again = input("\nWant to play another round? (y/n): ").lower().strip()
        if play_again not in ['y', 'yes', 'yeah', 'sure']:
            break
    
    # Show final results
    print("\n" + "=" * 50)
    print("GAME OVER - FINAL SCORE")
    print("=" * 50)
    print(f"You won: {player_score} rounds")
    print(f"Computer won: {computer_score} rounds")
    print(f"Ties: {ties} rounds")
    
    if player_score > computer_score:
        print("Nice job! You beat the computer!")
    elif computer_score > player_score:
        print("Better luck next time! The computer got you this time.")
    else:
        print("It's a tie overall! Good match!")
    
    print("=" * 50)
    print("Thanks for playing!")

if __name__ == "__main__":
    main_game() 