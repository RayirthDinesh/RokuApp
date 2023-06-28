
' Initializes the game board and variables
sub init()
    'making nodes
    cards = m.top.findNode("cards")
    selectedCards = m.top.findNode("selectedCards")
    board = m.top.findNode("board")
    deck = m.top.findNode("deck")

    card00 = m.top.findNode("card00")
    card01 = m.top.findNode("card01")
    card02 = m.top.findNode("card02")
    card10 = m.top.findNode("card10")
    card11 = m.top.findNode("card11")
    card12 = m.top.findNode("card12")
    card20 = m.top.findNode("card20")
    card21 = m.top.findNode("card21")
    card22 = m.top.findNode("card22")

    gridCards = m.top.findNode("gridCards")

    ' Global variables
    m.global.addField({cards: cards})
    m.global.addFields({selectedCards: selectedCards})
    m.global.addFields({board: board})
    m.global.addFields({deck: deck})


    m.global.addFields({card00: card00})
    m.global.addFields({card01: card01})
    m.global.addFields({card02: card02})
    m.global.addFields({card10: card10})
    m.global.addFields({card11: card11})
    m.global.addFields({card12: card12})
    m.global.addFields({card20: card20})
    m.global.addFields({card21: card21})
    m.global.addFields({card22: card22})

    m.global.addFields({gridCards: gridCards})

    card00Called = false
    card01Called = false
    card02Called = false

    card10Called = false
    card11Called = false
    card12Called = false

    card20Called = false
    card21Called = false
    card22Called = false


    m.global.addFields({card00Called: card00Called})
    m.global.addFields({card01Called: card01Called})
    m.global.addFields({card02Called: card02Called})

    m.global.addFields({card10Called: card10Called})
    m.global.addFields({card11Called: card11Called})
    m.global.addFields({card12Called: card12Called})

    m.global.addFields({card20Called: card20Called})
    m.global.addFields({card21Called: card21Called})
    m.global.addFields({card22Called: card22Called})


    m.global.deck = ["ace_of_clubs", "ace_of_diamonds", "ace_of_hearts", "ace_of_spades", 
                    "2_of_clubs", "2_of_diamonds", "2_of_hearts", "2_of_spades",
                    "3_of_clubs", "3_of_diamonds", "3_of_hearts", "3_of_spades",
                    "4_of_clubs", "4_of_diamonds", "4_of_hearts", "4_of_spades",
                    "5_of_clubs", "5_of_diamonds", "5_of_hearts", "5_of_spades",
                    "6_of_clubs", "6_of_diamonds", "6_of_hearts", "6_of_spades",
                    "7_of_clubs", "7_of_diamonds", "7_of_hearts", "7_of_spades",
                    "8_of_clubs", "8_of_of_diamonds", "8_of_hearts", "8_of_spades",
                    "9_of_clubs", "9_of_diamonds", "9_of_hearts", "9_of_spades",
                    "10_of_clubs", "10_of_diamonds", "10_of_hearts", "10_of_spades",
                    "jack_of_clubs", "jack_of_diamonds", "jack_of_hearts", "jack_of_spades",
                    "queen_of_clubs", "queen_of_diamonds", "queen_of_hearts", "queen_of_spades",
                    "king_of_clubs", "king_of_diamonds", "king_of_hearts", "king_of_spades"]

    m.global.gridCards = [card00, card01, card02, card10, card11, card12, card20, card21, card22]

    ' Constants
    m.MAX_CARDS = 9
    m.CARD_WIDTH = 200
    m.CARD_HEIGHT = 300
    
    ' Shuffle the cards and initialize the board
    shuffleCards()
    
    ' Display the initial game board
    displayBoard()
end sub

'Displays the current state of the game board
sub displayBoard()
   screen = CreateObject("roSGScreen")
   scene = screen.CreateScene("ElevensGame")
    
   'Set the board grid
   for i = 0 to 2
       for j = 0 to 2
           card = m.global.board[(i * 3) + j]
           cardNode = scene.GetNode("card" + Str(i) + Str(j))
            
           ' Set the card image and position
            cardNode.SetContent(assignImages()) 'card.image
            cardNode.translation = [j * m.CARD_WIDTH, i * m.CARD_HEIGHT]
            
            ' Add hover and selection events
            cardNode.observeField("focused", "onCardFocused")
            cardNode.observeField("selected", "onCardSelected")
        end for
    end for
    
    ' Update the scene on the screen
   screen.show()

  '  Iterate over the gridCards and assign images from the deck
   for i = 0 to m.global.gridCards.Count() - 1
        ' Get the current card node
       card = m.global.gridCards[i]
   end for
end sub

function assignImages()
    for each card in m.global.deck
        for each gridCard in m.global.gridCard
            if m.global.gridCards = card then
                m.global.gridCard.iconUri = "pkg:/images/" + card + ".png"
            end if
        end for
    end for
end function   

function onKeyEvent(key, press) as Boolean
    ? "[tictactoe] onKeyEvent" key, press
    m.buttonClicked = false
    ' if press
    if m.global.card00.hasFocus() then
        if key = "down" and press then
            m.global.card10.setFocus(true)
        else if key = "right" and press then
            m.global.card01.setFocus(true)
        else if key = "OK" and not m.global.card00called then
            m.buttonClicked = true
            m.global.card00called = true
            'if m.global.card00called = true then
              '  assignImages()
                'm.global.xPlayer = false
              '  checkforEleven()
            'else
                'm.global.r0c0.iconUri = "pkg:/images/O.jpg"
                ' m.global.xPlayer = true
                'end if

        end if
    end if
    '     if m.global.card00called = true then
    '         assignImages()
    '     end if  
    ' end if
    ' function onKeyEvent(key, press) as Boolean
    '     ? "[tictactoe] onKeyEvent" key, press
    '     m.buttonClicked = false
    '     ' if press
    '       if m.global.r0c0.hasFocus() then
    '         if key = "down" and press then
    '           m.global.r0c0.setFocus(false)
    '           m.global.r1c0.setFocus(true)
    '         else if key = "right" and press then
    '           m.global.r0c0.setFocus(false)
    '           m.global.r0c1.setFocus(true)
    '         else if key = "OK" and not m.global.r0c0Called then
    '             m.buttonClicked = true
    '             m.global.r0c0Called = true
    '             if(m.global.xPlayer) then
    '               m.global.r0c0.iconUri = "pkg:/images/X.jpg"
    '               m.global.xPlayer = false
    '             else
    '               m.global.r0c0.iconUri = "pkg:/images/O.jpg"
    '               m.global.xPlayer = true
    '             end if
end function        

' Shuffles the deck of cards and initializes the board
sub shuffleCards()

'   Shuffles the cards in the deck array
   ' `Use the Shuffle() method of roArray to randomize the card order
    
    m.global.deck.Shuffle()

end sub

'Checks if the game is over by evaluating the board for possible moves
function isGameOver() as Boolean
    ' Check if there are any valid moves left
    ' return checkForNoMoves()
end function

' Checks if a move made by the player is valid
function isMoveValid() as Boolean
    ' Check if the selected cards form a valid combination
    return checkForEleven()
end function

' Executes a move made by the player
sub makeMove()
 '  Replace the selected cards with new cards from the deck
  replaceCards()
    
  ' Clear the selected cards
   selectedCards = []
    
  '  Check if the game is over
   if isGameOver() then
   '     Game over logic
   else
  '      Display the updated game board
      displayBoard()
   end if
end sub

'Checks if a combination of selected cards adds up to eleven
function checkForEleven() as Boolean
    ' Calculate the sum of the selected cards' ranks
    sum = 0
    for each card in m.global.selectedCards
        sum += card.rank
    end for
    
    ' Return true if the sum is eleven
    return sum = 11
end function

' Replaces the selected cards with new cards from the deck
sub replaceCards()
    ' Remove the selected cards from the board
    for each card in m.global.selectedCards
        index = m.global.board.find(card)
        if index >= 0 then
            m.global.board.splice(index, 1)
        end if
    end for
    
    ' Fill the empty spaces with new cards from the deck
    for i = 0 to m.global.selectedCards.count() - 1
        if m.global.deck.count() > 0 then
            m.global.board.push(m.global.deck.pop())
        end if
    end for
end sub

' Checks if there are any possible moves left on the board
'function checkForNoMoves() as Boolean
    ' ' Check if there are any pairs of cards that add up to eleven
    ' for i = 0 to board.count() - 2
    '     for j = i + 1 to board.count() - 1
    '         sum = board[i].rank + board[j].rank
    '         if sum = 11 then
    '             return false
    '         end if
    '     end for
    ' end for
    
    ' ' No valid moves left
    ' return true
'end function

'Handles user input and triggers appropriate actions
sub handleUserInput(event as Object)
   if event.GetRoSGNode().id = "ok" then
       ' Check if the move is valid
       if isMoveValid() then
         '   Execute the move
           makeMove()
       else
  '          Display an error message or handle invalid move
       end if
   else if event.GetRoSGNode().id.startsWith("card") then
 '       Handle card selection logic
       cardNode = event.GetRoSGNode()
        
       if cardNode.selected then
  '          Deselect the card
           cardNode.selected = false
           m.global.selectedCards.remove(cardNode.card)
       else
'            Select the card
           cardNode.selected = true
           m.global.selectedCards.push(cardNode.card)
       end if
   end if
end sub

' Creates the deck of cards with their respective images
' sub createDeck()
'    suits = ["hearts", "diamonds", "clubs", "spades"]
'    ranks = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
'     ' Create cards for each suit and rank
'     for each suit in suits
'        for each rank in ranks
'            card = {
'                "suit": suit,
'                "rank": 
'                if rank = "J" or rank = "Q" or rank = "K" then 
'                10 else Int(rank), 
'               "image": ("pkg:/images/" + suit + "_of_"+ rank + ".png") 
'                end if
'            }
'            cards.push(card)
'        end for
'    end for
'   end for
' end sub