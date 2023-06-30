' Initializes the game board and variables
function init()
    ' Glabol Constant values
    m.cardValueStart = 3
    m.cardValueLen = 2
    m.cardImgStart = 6
    m.global.addFields({cardValueStart : m.cardValueStart})
    m.global.addFields({cardValueLen : m.cardValueLen})
    m.global.addFields({cardImgStart : m.cardImgStart})

    card00 = m.top.findNode("card00")
    card01 = m.top.findNode("card01")
    card02 = m.top.findNode("card02")
    card10 = m.top.findNode("card10")
    card11 = m.top.findNode("card11")
    card12 = m.top.findNode("card12")
    card20 = m.top.findNode("card20")
    card21 = m.top.findNode("card21")
    card22 = m.top.findNode("card22")
    m.global.addFields({card00 : card00})
    m.global.addFields({card01 : card01})
    m.global.addFields({card02 : card02})
    m.global.addFields({card10 : card10})
    m.global.addFields({card11 : card11})
    m.global.addFields({card12 : card12})
    m.global.addFields({card20 : card20})
    m.global.addFields({card21 : card21})
    m.global.addFields({card22 : card22})

    'Create array gridCards
    gridCards = [m.global.card00, m.global.card01, m.global.card02, m.global.card10, m.global.card11, m.global.card12, m.global.card20, m.global.card21, m.global.card22]
    m.global.addFields({gridCards: gridCards})

    deckCards = [
        "f_01_https://sthsroku.net/team666/elevens/Cards//ace_of_clubs.png", "f_01_https://sthsroku.net/team666/elevens/Cards//ace_of_diamonds.png", "f_01_https://sthsroku.net/team666/elevens/Cards//ace_of_hearts.png", "f_01_https://sthsroku.net/team666/elevens/Cards//ace_of_spades.png",
        "f_02_https://sthsroku.net/team666/elevens/Cards//2_of_clubs.png", "f_02_https://sthsroku.net/team666/elevens/Cards//2_of_diamonds.png", "f_02_https://sthsroku.net/team666/elevens/Cards//2_of_hearts.png", "f_02_https://sthsroku.net/team666/elevens/Cards//2_of_spades.png",
        "f_03_https://sthsroku.net/team666/elevens/Cards//3_of_clubs.png", "f_03_https://sthsroku.net/team666/elevens/Cards//3_of_diamonds.png", "f_03_https://sthsroku.net/team666/elevens/Cards//3_of_hearts.png", "f_03_https://sthsroku.net/team666/elevens/Cards//3_of_spades.png",
        "f_04_https://sthsroku.net/team666/elevens/Cards//4_of_clubs.png", "f_04_https://sthsroku.net/team666/elevens/Cards//4_of_diamonds.png", "f_04_https://sthsroku.net/team666/elevens/Cards//4_of_hearts.png", "f_04_https://sthsroku.net/team666/elevens/Cards//4_of_spades.png",
        "f_05_https://sthsroku.net/team666/elevens/Cards//5_of_clubs.png", "f_05_https://sthsroku.net/team666/elevens/Cards//5_of_diamonds.png", "f_05_https://sthsroku.net/team666/elevens/Cards//5_of_hearts.png", "f_05_https://sthsroku.net/team666/elevens/Cards//5_of_spades.png",
        "f_06_https://sthsroku.net/team666/elevens/Cards//6_of_clubs.png", "f_06_https://sthsroku.net/team666/elevens/Cards//6_of_diamonds.png", "f_06_https://sthsroku.net/team666/elevens/Cards//6_of_hearts.png", "f_06_https://sthsroku.net/team666/elevens/Cards//6_of_spades.png",
        "f_07_https://sthsroku.net/team666/elevens/Cards//7_of_clubs.png", "f_07_https://sthsroku.net/team666/elevens/Cards//7_of_diamonds.png", "f_07_https://sthsroku.net/team666/elevens/Cards//7_of_hearts.png", "f_07_https://sthsroku.net/team666/elevens/Cards//7_of_spades.png",
        "f_08_https://sthsroku.net/team666/elevens/Cards//8_of_clubs.png", "f_08_https://sthsroku.net/team666/elevens/Cards//8_of_diamonds.png", "f_08_https://sthsroku.net/team666/elevens/Cards//8_of_hearts.png", "f_08_https://sthsroku.net/team666/elevens/Cards//8_of_spades.png",
        "f_09_https://sthsroku.net/team666/elevens/Cards//9_of_clubs.png", "f_09_https://sthsroku.net/team666/elevens/Cards//9_of_diamonds.png", "f_09_https://sthsroku.net/team666/elevens/Cards//9_of_hearts.png", "f_09_https://sthsroku.net/team666/elevens/Cards//9_of_spades.png",
        "f_10_https://sthsroku.net/team666/elevens/Cards//10_of_clubs.png", "f_10_https://sthsroku.net/team666/elevens/Cards//10_of_diamonds.png", "f_10_https://sthsroku.net/team666/elevens/Cards//10_of_hearts.png", "f_10_https://sthsroku.net/team666/elevens/Cards//10_of_spades.png",
        "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_clubs.png", "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_diamonds.png", "k_10_https://sthsroku.net/team666/elevens/Cards//king_of_hearts.png", "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_spades.png",
        "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_clubs.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_diamonds.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_hearts.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_spades.png",
        "j_10_https://sthsroku.net/team666/elevens/Cards//jack_of_clubs.png", "j_10_https://sthsroku.net/team666/elevens/Cards//jack_of_diamonds.png", "j_10_https://sthsroku.net/team666/elevens/Cards//jack_of_hearts.png", "j_10_https://sthsroku.net/team666/elevens/Cards//jack_of_spades.png"
    ]
    m.global.addFields({deckCards : deckCards})

    shuffleCards()

    currentBoard = []
    selectedCards = []
    m.global.addFields({currentBoard: currentBoard})
    m.global.addFields({selectedCards: selectedCards})
    dealCards()
    displayCards()
end function

sub shuffleCards()
    arr = m.global.deckCards
    for i = arr.Count() - 1 to 1 step -1
        j = Fix(Rnd(0) * (i + 1))
        temp = arr[i]
        arr.setEntry(i, arr[j])
        arr.setEntry(j, temp)
    end for
    m.global.setFields({deckCards : arr})
end sub

function checkSelectedCards() as Boolean
    if m.global.selectedCards.Count() = 2 then
        if Val(Mid(m.global.selectedCards[0], m.global.cardValueStart, m.global.cardValueLen), 10) + Val(Mid(m.global.selectedCards[1], m.global.cardValueStart, m.global.cardValueLen), 10) = 11 then
            return true
        else
            return false
        end if
    else if m.global.selectedCards.Count() = 3 then
        tempK = false
        tempQ = false
        tempJ = false
        for each item in m.global.selectedCards
            if Left(item, 1) = "k" then
                tempK = true
            else if Left(item, 1) = "q" then
                tempQ = true
            else if Left(item, 1) = "j" then
                tempJ = true
            end if
        end for
        if tempK and tempQ and tempJ then
            return true
        else
            return false
        end if
    else
        return false
    end if
end function

' function checkForEleven() as boolean
'     for i = 0 to m.global.currentBoard.Count() - 1
'         'need to add a on key event or something so program handles two button clicks
'         for each grid1 in m.global.gridCards
'             for each grid2 in m.global.gridCards
'                 if  then
'                     convertInt = Mid(m.global.deckCards.focusedIconUri.substring, 3, 2)
'       ''rid1 = ToInteger(convertInt)
'                 end if
'             end for
'             dealCards()
'         end for
'     end for
' end function

function isEmpty() as Boolean
    if m.global.deckCards.Count() = 0 then
        return true
    else
        return false
    end if
end function

function dealCards()
    arr = m.global.currentBoard
    tempDeck = m.global.deckCards
    while arr.Count() < 9
        arr.push(tempDeck.pop())
    end while
    m.global.setFields({deckCards : tempDeck})
    m.global.setFields({currentBoard : arr})
end function

function displayCards()
    for i = 0 to m.global.currentBoard.Count() - 1
        m.global.gridCards[i].uri = Mid(m.global.currentBoard[i], m.cardImgStart)
    end for
end function

function onKeyEvent(key, press) as Boolean

end function

' ' Shuffles the deck of cards and initializes the board


' 'Checks if the game is over by evaluating the board for possible moves
' ' function isGameOver() as Boolean
' '     ' Check if there are any valid moves left
' '     ' return checkForNoMoves()
' ' end function

' ' ' Checks if a move made by the player is valid
' ' function isMoveValid() as Boolean
' '     ' Check if the selected cards form a valid combination
' '     return checkForEleven()
' ' end function

' ' ' Executes a move made by the player
' ' sub makeMove()
' '  '  Replace the selected cards with new cards from the deck
' '   replaceCards()

' '   ' Clear the selected cards
' '    selectedCards = []

' '   '  Check if the game is over
' '    if isGameOver() then
' '    '     Game over logic
' '    else
' '   '      Display the updated game board
' '  '     displayBoard()
' '    end if
' ' end sub

' ' 'Checks if a combination of selected cards adds up to eleven
' ' function checkForEleven() as Boolean
' '     ' Calculate the sum of the selected cards' ranks
' '     sum = 0
' '     for each card in m.global.selectedCards
' '         sum += card.rank
' '     end for

' '     ' Return true if the sum is eleven
' '     return sum = 11
' ' end function

' ' ' Replaces the selected cards with new cards from the deck
' ' sub replaceCards()
' '     ' Remove the selected cards from the board
' '     for each card in m.global.selectedCards
' '         index = m.global.board.find(card)
' '         if index >= 0 then
' '             m.global.board.splice(index, 1)
' '         end if
' '     end for

' '     ' Fill the empty spaces with new cards from the deck
' '     for i = 0 to m.global.selectedCards.count() - 1
' '         if m.global.deck.count() > 0 then
' '             m.global.board.push(m.global.deck.pop())
' '         end if
' '     end for
' ' end sub

' ' ' Checks if there are any possible moves left on the board
' ' 'function checkForNoMoves() as Boolean
' '     ' ' Check if there are any pairs of cards that add up to eleven
' '     ' for i = 0 to board.count() - 2
' '     '     for j = i + 1 to board.count() - 1
' '     '         sum = board[i].rank + board[j].rank
' '     '         if sum = 11 then
' '     '             return false
' '     '         end if
' '     '     end for
' '     ' end for

' '     ' ' No valid moves left
' '     ' return true
' ' 'end function

' ' 'Handles user input and triggers appropriate actions
' ' sub handleUserInput(event as Object)
' '    if event.GetRoSGNode().id = "ok" then
' '        ' Check if the move is valid
' '        if isMoveValid() then
' '          '   Execute the move
' '            makeMove()
' '        else
' '   '          Display an error message or handle invalid move
' '        end if
' '    else if event.GetRoSGNode().id.startsWith("card") then
' '  '       Handle card selection logic
' '        cardNode = event.GetRoSGNode()

' '        if cardNode.selected then
' '   '          Deselect the card
' '            cardNode.selected = false
' '            m.global.selectedCards.remove(cardNode.card)
' '        else
' ' '            Select the card
' '            cardNode.selected = true
' '            m.global.selectedCards.push(cardNode.card)
' '        end if
' '    end if
' ' end sub

' ' ' Creates the deck of cards with their respective images
' ' ' sub createDeck()
' ' '    suits = ["hearts", "diamonds", "clubs", "spades"]
' ' '    ranks = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

' ' '     ' Create cards for each suit and rank
' ' '     for each suit in suits
' ' '        for each rank in ranks
' ' '            card = {
' ' '                "suit": suit,
' ' '                "rank":
' ' '                if rank = "J" or rank = "Q" or rank = "K" then
' ' '                10 else Int(rank),
' ' '               "image": ("/images/" + suit + "_of_"+ rank + ".png")
' ' '                end if
' ' '            }
' ' '            cards.push(card)
' ' '        end for
' ' '    end for
' ' '   end for
' ' ' end sub