# Rock, Paper, Scissors Game

Just a fun little Rock, Paper, Scissors game I made in both Python and R! Nothing fancy, just something to pass the time and practice coding.

## What it does

- You play against the computer
- Computer picks randomly (no cheating!)
- Keeps track of who's winning
- Looks pretty with clean text output
- Has some suspense when the computer is "thinking"
- You can play as many rounds as you want
- Shows you the final score when you're done

## How to play

- **Rock** beats **Scissors** (obviously)
- **Paper** beats **Rock** (paper is sneaky like that)
- **Scissors** beats **Paper** (snip snip!)
- If you pick the same thing, it's a tie

## Python Version

### What you need
- Python 3.6 or higher (probably already have it)

### How to run it
```bash
python3 rps_game.py
```

### What's cool about it
- Clean, easy to read code
- Handles all the weird stuff you might type
- Smooth experience with nice timing

## R Version

### What you need
- R (version 3.5 or higher should work fine)
- Rscript (usually comes with R)

### How to run it
```bash
Rscript rps_game.R
```

### What's cool about it
- Uses R's functional style
- Interactive console input
- Fun dot animation when computer is thinking

## How to play

1. **Start the game** by running either version
2. **Pick your move**:
   - Rock (r, rock, or 1)
   - Paper (p, paper, or 2)
   - Scissors (s, scissors, or 3)
   - Quit (q, quit, or 4)
3. **Watch the computer** make its choice
4. **See who won** and check your score
5. **Keep playing** or quit to see the final results

## Files

```
RPS/
├── rps_game.py      # Python version
├── rps_game.R       # R version
└── README.md        # This file
```

## Example of what it looks like

```
==================================================
ROCK, PAPER, SCISSORS GAME
==================================================
Hey there! Ready to play? Here's how it works:
• Rock beats Scissors (obviously)
• Paper beats Rock (paper is sneaky like that)
• Scissors beats Paper (snip snip!)
• If you pick the same thing, it's a tie
==================================================

What are you going to throw?
1. Rock (r)
2. Paper (p)
3. Scissors (s)
4. I'm done (q)

Your choice: r

Computer is thinking...

You threw: ROCK
Computer threw: SCISSORS

==============================
You won this round!
==============================

Current score:
   You: 1
   Computer: 0
   Ties: 0

Want to play another round? (y/n): n

==================================================
GAME OVER - FINAL SCORE
==================================================
You won: 1 rounds
Computer won: 0 rounds
Ties: 0 rounds
Nice job! You beat the computer!
==================================================
Thanks for playing!
```

## Differences between the versions

| Thing | Python | R |
|-------|--------|---|
| Getting input | `input()` | `readline()` |
| Random stuff | `random.choice()` | `sample()` |
| Waiting | `time.sleep()` | `Sys.sleep()` |
| Text formatting | f-strings | `sprintf()` |
| Data storage | Dictionaries | Lists |

Both versions do the same thing, just written differently!

## Have fun! 