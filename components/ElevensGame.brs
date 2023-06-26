' Initializes the game board and variables
sub init()
    ' Global variables
    m.global.addField({cards: cards})
    m.global.addFields({selectedCards: selectedCards})
    m.global.addFields({board: board})
    m.global.addFields({deck: deck})

    ' Constants
    MAX_CARDS = 9
    CARD_WIDTH = 200
    CARD_HEIGHT = 300
    ' Create the deck of cards
    createDeck()
    
    ' Shuffle the cards and initialize the board
    shuffleCards()
    
    ' Display the initial game board
    displayBoard()
end sub

' Displays the current state of the game board
sub displayBoard()
    screen = CreateObject("roSGScreen")
    scene = screen.CreateScene("ElevensGame")
    
    ' Set the board grid
    for i = 0 to 2
        for j = 0 to 2
            card = board[(i * 3) + j]
            cardNode = scene.GetNode("card" + Str(i) + Str(j))
            
            ' Set the card image and position
            cardNode.SetContent(card.image)
            cardNode.translation = [j * CARD_WIDTH, i * CARD_HEIGHT]
            
            ' Add hover and selection events
            cardNode.observeField("focused", "onCardFocused")
            cardNode.observeField("selected", "onCardSelected")
        end for
    end for
    
    ' Update the scene on the screen
    screen.show()
end sub

' Shuffles the deck of cards and initializes the board
sub shuffleCards()
    deck = cards
    board = []
    
    ' Shuffle the deck
    for i = deck.count() - 1 to 1 step -1
        j = Int(Rnd() * (i + 1))
        temp = deck[i]
        deck[i] = deck[j]
        deck[j] = temp
    end for
    
    ' Initialize the board with cards from the deck
    for i = 0 to MAX_CARDS - 1
        board.push(deck.pop())
    end for
end sub

' Checks if the game is over by evaluating the board for possible moves
function isGameOver() as Boolean
    ' Check if there are any valid moves left
    return checkForNoMoves()
end function

' Checks if a move made by the player is valid
function isMoveValid() as Boolean
    ' Check if the selected cards form a valid combination
    return checkForEleven()
end function

' Executes a move made by the player
sub makeMove()
    ' Replace the selected cards with new cards from the deck
    replaceCards()
    
    ' Clear the selected cards
    selectedCards = []
    
    ' Check if the game is over
    if isGameOver() then
        ' Game over logic
    else
        ' Display the updated game board
        displayBoard()
    end if
end sub

' Checks if a combination of selected cards adds up to eleven
function checkForEleven() as Boolean
    ' Calculate the sum of the selected cards' ranks
    sum = 0
    for each card in selectedCards
        sum += card.rank
    end for
    
    ' Return true if the sum is eleven
    return sum = 11
end function

' Replaces the selected cards with new cards from the deck
sub replaceCards()
    ' Remove the selected cards from the board
    for each card in selectedCards
        index = board.find(card)
        if index >= 0 then
            board.splice(index, 1)
        end if
    end for
    
    ' Fill the empty spaces with new cards from the deck
    for i = 0 to selectedCards.count() - 1
        if deck.count() > 0 then
            board.push(deck.pop())
        end if
    end for
end sub

' Checks if there are any possible moves left on the board
function checkForNoMoves() as Boolean
    ' Check if there are any pairs of cards that add up to eleven
    for i = 0 to board.count() - 2
        for j = i + 1 to board.count() - 1
            sum = board[i].rank + board[j].rank
            if sum = 11 then
                return false
            end if
        end for
    end for
    
    ' No valid moves left
    return true
end function

' Handles user input and triggers appropriate actions
sub handleUserInput(event as Object)
    if event.GetRoSGNode().id = "ok" then
        ' Check if the move is valid
        if isMoveValid() then
            ' Execute the move
            makeMove()
        else
            ' Display an error message or handle invalid move
        end if
    else if event.GetRoSGNode().id.startsWith("card") then
        ' Handle card selection logic
        cardNode = event.GetRoSGNode()
        
        if cardNode.selected then
            ' Deselect the card
            cardNode.selected = false
            selectedCards.remove(cardNode.card)
        else
            ' Select the card
            cardNode.selected = true
            selectedCards.push(cardNode.card)
        end if
    end if
end sub

' Creates the deck of cards with their respective images
sub createDeck()
    suits = ["hearts", "diamonds", "clubs", "spades"]
    ranks = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    ' Create cards for each suit and rank
    for each suit in suits
        for each rank in ranks
            card = "suit": suit,
                "rank": 
                    if rank = "J" or rank = "Q" or rank = "K" then 10 else Int(rank),
                        "image": ("pkg:/images/" + suit + "_of_"+ rank + ".png")
                    end if
            }
            cards.push(card)
        end for
    end for

    for 
end sub

