sub init()
    ' Game logic variables
    m.cards = [
        "2_of_clubs",
        "3_of_clubs",
        "4_of_clubs",
        "5_of_clubs",
        "6_of_clubs"
    ]
    m.board = []

    ' Retrieve the card nodes from the XML hierarchy
    card1Group = m.top.findNode("card1Group")
    card1Poster = m.top.findNode("card1Poster")
    card2Group = m.top.findNode("card2Group")
    card2Poster = m.top.findNode("card2Poster")

    ' Initialize the game
    initializeGame()
end sub

sub initializeGame()
    ' Shuffle the m.cards
    shuffleCards()

    ' Set up the initial game board
    for i = 0 to 5
        board[i] = m.cards.pop()
    end for

    ' Display the initial game board
    displayBoard()
end sub

sub displayBoard()
    ' Update card images on the board
    card1Poster.uri = "pkg:/images/" + m.cards[m.board[0]] + ".png"
    card2Poster.uri = "pkg:/images/" + m.cards[m.board[1]] + ".png"
end sub

sub shuffleCards()
    m.cards.shuffle()
end sub

function isGameOver() as Boolean
    ' Check if any moves are possible
    for i = 0 to 5
        if isMoveValid(i) then return false
    end for

    ' No moves are possible, game over
    return true
end function

function isMoveValid(cardIndex as Integer) as Boolean
    ' Check if the card at the given index can be selected for a move
    return cardIndex >= 0 and cardIndex < m.board.count() and m.board[cardIndex] <> -1
end function

sub makeMove(cardIndex as Integer)
    ' Remove the selected card from the board
    board[cardIndex] = -1

    ' Replace the removed card with a new card
    replaceCards(cardIndex)

    ' Check if the game is over
    if isGameOver() then
        ' Game over logic
    else
        ' Continue with the game
    end if
end sub

function checkForEleven(cardIndices as Object) as Boolean
    sum = 0

    ' Calculate the sum of selected cards
    for each index in cardIndices
        sum += index + 1
    end for

    ' Check if the sum is equal to 11
    return sum = 11
end function

sub replaceCards(cardIndex as Integer)
    ' Replace the selected card with a new card from the deck
    if m.cards.count() > 0
        board[cardIndex] = m.cards.pop()
    else
        board[cardIndex] = -1
    end if

    ' Update the displayed card image
    if cardIndex = 0 then
        card1Poster.uri = "pkg:/images/" + m.cards[m.board[cardIndex]] + ".png"
    else if cardIndex = 1 then
        card2Poster.uri = "pkg:/images/" + m.cards[m.board[cardIndex]] + ".png"
    end if
end sub

function checkForNoMoves() as Boolean
    ' Check if any moves are possible
    for i = 0 to 5
        if isMoveValid(i) then return false
    end for

    ' No moves are possible
    return true
end function

sub handleUserInput(cardIndex as Integer)
    ' Check if the selected card is valid for a move
    if isMoveValid(cardIndex) then
        ' Make the move
        makeMove(cardIndex)
    else
        ' Handle invalid move logic
    end if
end sub
