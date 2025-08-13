#!/usr/bin/env Rscript
# Rock, Paper, Scissors Game
# Just a fun little game I made to practice R!

# Show the welcome screen with some personality
show_welcome <- function() {
  cat("==================================================\n")
  cat("ROCK, PAPER, SCISSORS GAME\n")
  cat("==================================================\n")
  cat("Hey there! Ready to play? Here's how it works:\n")
  cat("• Rock beats Scissors (obviously)\n")
  cat("• Paper beats Rock (paper is sneaky like that)\n") 
  cat("• Scissors beats Paper (snip snip!)\n")
  cat("• If you pick the same thing, it's a tie\n")
  cat("==================================================\n")
}

# Get what the player wants to throw
get_player_move <- function() {
  while (TRUE) {
    cat("\nWhat are you going to throw?\n")
    cat("1. Rock (r)\n")
    cat("2. Paper (p)\n")
    cat("3. Scissors (s)\n")
    cat("4. I'm done (q)\n")
    
    choice <- tolower(trimws(readline("\nYour choice: ")))
    
    if (choice %in% c("r", "rock", "1")) {
      return("rock")
    } else if (choice %in% c("p", "paper", "2")) {
      return("paper")
    } else if (choice %in% c("s", "scissors", "3")) {
      return("scissors")
    } else if (choice %in% c("q", "quit", "4", "done")) {
      return("quit")
    } else {
      cat("Hmm, that's not a valid choice. Try again!\n")
    }
  }
}

# Computer makes its random choice
computer_picks <- function() {
  choices <- c("rock", "paper", "scissors")
  return(sample(choices, 1))
}

# Figure out who won this round
who_wins <- function(player_choice, computer_choice) {
  if (player_choice == computer_choice) {
    return("tie")
  }
  
  # The winning combinations
  wins <- list(
    rock = "scissors",
    paper = "rock", 
    scissors = "paper"
  )
  
  if (wins[[player_choice]] == computer_choice) {
    return("player")
  } else {
    return("computer")
  }
}

# Show what everyone picked
show_moves <- function(player_choice, computer_choice) {
  cat(sprintf("\nYou threw: %s\n", toupper(player_choice)))
  cat(sprintf("Computer threw: %s\n", toupper(computer_choice)))
}

# Show who won this round
show_round_result <- function(result) {
  cat("\n==============================\n")
  if (result == "tie") {
    cat("It's a tie!\n")
  } else if (result == "player") {
    cat("You won this round!\n")
  } else {
    cat("Computer got this one!\n")
  }
  cat("==============================\n")
}

# Add some suspense with dots
add_suspense <- function() {
  cat("\nComputer is thinking")
  for (i in 1:3) {
    Sys.sleep(0.5)
    cat(".")
  }
  cat("\n")
}

# The main game loop
main_game <- function() {
  player_score <- 0
  computer_score <- 0
  ties <- 0
  
  show_welcome()
  
  while (TRUE) {
    player_choice <- get_player_move()
    
    if (player_choice == "quit") {
      break
    }
    
    add_suspense()
    
    computer_choice <- computer_picks()
    show_moves(player_choice, computer_choice)
    
    result <- who_wins(player_choice, computer_choice)
    show_round_result(result)
    
    # Update the score
    if (result == "player") {
      player_score <- player_score + 1
    } else if (result == "computer") {
      computer_score <- computer_score + 1
    } else {
      ties <- ties + 1
    }
    
    # Show current score
    cat(sprintf("\nCurrent score:\n"))
    cat(sprintf("   You: %d\n", player_score))
    cat(sprintf("   Computer: %d\n", computer_score))
    cat(sprintf("   Ties: %d\n", ties))
    
    # Ask if they want to keep playing
    play_again <- tolower(trimws(readline("\nWant to play another round? (y/n): ")))
    if (!(play_again %in% c("y", "yes", "yeah", "sure"))) {
      break
    }
  }
  
  # Show final results
  cat("\n==================================================\n")
  cat("GAME OVER - FINAL SCORE\n")
  cat("==================================================\n")
  cat(sprintf("You won: %d rounds\n", player_score))
  cat(sprintf("Computer won: %d rounds\n", computer_score))
  cat(sprintf("Ties: %d rounds\n", ties))
  
  if (player_score > computer_score) {
    cat("Nice job! You beat the computer!\n")
  } else if (computer_score > player_score) {
    cat("Better luck next time! The computer got you this time.\n")
  } else {
    cat("It's a tie overall! Good match!\n")
  }
  
  cat("==================================================\n")
  cat("Thanks for playing!\n")
}

# Check if running as script
if (!interactive()) {
  # Set seed for reproducibility (optional)
  set.seed(Sys.time())
  
  # Start the game
  main_game()
} else {
  cat("To run this game, use: Rscript rps_game.R\n")
} 