' Initializes the game board and variables
sub init()
    ?"[Elevens]init"
    ' Glabol Constant values

    m.cardValueStart = 3
    m.cardValueLen = 2
    m.cardImgStart = 6
    m.global.addFields({cardValueStart : m.cardValueStart})
    m.global.addFields({cardValueLen : m.cardValueLen})
    m.global.addFields({cardImgStart : m.cardImgStart})

    resetGameButton = m.top.findNode("resetGameButton")
    m.global.addFields({resetGameButton : resetGameButton})
    resetGameButton.observeField("buttonSelected", "onResetButtonSelected")

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

    'cardPoster grid are used for the border displaying the focused card on that grid
    cardPoster00 = m.top.findNode("cardPoster00")
    cardPoster01 = m.top.findNode("cardPoster01")
    cardPoster02 = m.top.findNode("cardPoster02")
    cardPoster10 = m.top.findNode("cardPoster10")
    cardPoster11 = m.top.findNode("cardPoster11")
    cardPoster12 = m.top.findNode("cardPoster12")
    cardPoster20 = m.top.findNode("cardPoster20")
    cardPoster21 = m.top.findNode("cardPoster21")
    cardPoster22 = m.top.findNode("cardPoster22")
    m.global.addFields({cardPoster00 : cardPoster00})
    m.global.addFields({cardPoster01 : cardPoster01})
    m.global.addFields({cardPoster02 : cardPoster02})
    m.global.addFields({cardPoster10 : cardPoster10})
    m.global.addFields({cardPoster11 : cardPoster11})
    m.global.addFields({cardPoster12 : cardPoster12})
    m.global.addFields({cardPoster20 : cardPoster20})
    m.global.addFields({cardPoster21 : cardPoster21})
    m.global.addFields({cardPoster22 : cardPoster22})

    cardSelectedPoster00 = m.top.findNode("cardSelectedPoster00")
    cardSelectedPoster01 = m.top.findNode("cardSelectedPoster01")
    cardSelectedPoster02 = m.top.findNode("cardSelectedPoster02")
    cardSelectedPoster10 = m.top.findNode("cardSelectedPoster10")
    cardSelectedPoster11 = m.top.findNode("cardSelectedPoster11")
    cardSelectedPoster12 = m.top.findNode("cardSelectedPoster12")
    cardSelectedPoster20 = m.top.findNode("cardSelectedPoster20")
    cardSelectedPoster21 = m.top.findNode("cardSelectedPoster21")
    cardSelectedPoster22 = m.top.findNode("cardSelectedPoster22")
    m.global.addFields({cardSelectedPoster00 : cardSelectedPoster00})
    m.global.addFields({cardSelectedPoster01 : cardSelectedPoster01})
    m.global.addFields({cardSelectedPoster02 : cardSelectedPoster02})
    m.global.addFields({cardSelectedPoster10 : cardSelectedPoster10})
    m.global.addFields({cardSelectedPoster11 : cardSelectedPoster11})
    m.global.addFields({cardSelectedPoster12 : cardSelectedPoster12})
    m.global.addFields({cardSelectedPoster20 : cardSelectedPoster20})
    m.global.addFields({cardSelectedPoster21 : cardSelectedPoster21})
    m.global.addFields({cardSelectedPoster22 : cardSelectedPoster22})

    rowIndex = 1
    colIndex = 1
    m.global.addFields({rowIndex : rowIndex})
    m.global.addFields({colIndex : colIndex})


    playAgain = m.top.findNode("playAgain")
    m.global.addFields({playAgain : playAgain})
    playAgain.observeField("buttonSelected", "onResetButtonSelected")

    playAgainPoster = m.top.findNode("playAgainPoster")
    m.global.addFields({playAgainPoster : playAgainPoster})

'card00, card01, card02, card10, card11, card12, card20, card21, card22
'arrayButtons holds card poster that are used for the border displaying the focused card
    arrayButtons = [[cardPoster00,cardPoster01,cardPoster02],
                    [cardPoster10,cardPoster11,cardPoster12],
                    [cardPoster20,cardPoster21,cardPoster22]]
    m.global.addFields({arrayButtons : arrayButtons})

    arraySelectedButtons = [[cardSelectedPoster00,cardSelectedPoster01,cardSelectedPoster02],
                            [cardSelectedPoster10,cardSelectedPoster11,cardSelectedPoster12],
                            [cardSelectedPoster20,cardSelectedPoster21,cardSelectedPoster22]]
    m.global.addFields({arraySelectedButtons : arraySelectedButtons})
'
    rightButtons = [cardPoster00,cardPoster10,cardPoster20,cardPoster01,cardPoster11,cardPoster21]
    leftButtons = [cardPoster02,cardPoster12,cardPoster22,cardPoster01,cardPoster11,cardPoster21]
    upButtons = [cardPoster20,cardPoster21,cardPoster22,cardPoster10,cardPoster11,cardPoster12]
    downButtons = [cardPoster00,cardPoster01,cardPoster02,cardPoster10,cardPoster11,cardPoster12]
    m.global.addFields({rightButtons : rightButtons})
    m.global.addFields({leftButtons : leftButtons})
    m.global.addfields({upButtons : upButtons})
    m.global.addFields({downButtons : downButtons})

    'Create array gridCards
    gridCards = [m.global.card00, m.global.card01, m.global.card02, m.global.card10, m.global.card11, m.global.card12, m.global.card20, m.global.card21, m.global.card22]
    gridCards2DArray = [[m.global.card00, m.global.card01, m.global.card02],
                        [m.global.card10, m.global.card11, m.global.card12],
                        [m.global.card20, m.global.card21, m.global.card22]]
    m.global.addFields({gridCards: gridCards})
    m.global.addFields({gridCards2DArray: gridCards2DArray})

    'array that initilaizes 52 cards to the deck
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
        "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_clubs.png", "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_diamonds.png", "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_hearts.png", "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_spades.png",
        "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_clubs.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_diamonds.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_hearts.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_spades.png",
        "j_00_https://sthsroku.net/team666/elevens/Cards//jack_of_clubs.png", "j_00_https://sthsroku.net/team666/elevens/Cards//jack_of_diamonds.png", "j_00_https://sthsroku.net/team666/elevens/Cards//jack_of_hearts.png", "j_00_https://sthsroku.net/team666/elevens/Cards//jack_of_spades.png"
    ]
    m.global.addFields({deckCards : deckCards})

    shuffleCards()

    currentBoard = []
    selectedCards = []
    m.global.addFields({currentBoard: currentBoard})
    m.global.addFields({selectedCards: selectedCards})
    dealCards()
    displayCards()

    m.top.observeField("visible", "onVisibleChange")
    'arrayButtons[1][1].visible = true
    
end sub

function onVisibleChange()
    ? "[ElevensGame] onVisibleChanged"
    if m.top.visible = true then
        resetGame()
    end if
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

function checkStringInList(list, string) as boolean
    for i = 0 to list.Count() - 1
        if list[i] = string then
            return true
        end if
    end for
    return false
end function

function replaceCards()
    arr = m.global.currentBoard
    tempArr = m.global.selectedCards
    for i = arr.Count() - 1 to 0 step -1
        if checkStringInList(m.global.selectedCards, arr[i]) then
            arr.delete(i)
        end if
    end for

    m.global.setFields({currentBoard : arr})
    dealCards()

    tempArr = []
    m.global.setFields({selectedCards : tempArr})

    displayCards()
end function

function checkSelectedCards() as Boolean
    if m.global.selectedCards.Count() = 2 then
        print (Val(Mid(m.global.selectedCards[0], m.global.cardValueStart, m.global.cardValueLen), 10) + Val(Mid(m.global.selectedCards[1], m.global.cardValueStart, m.global.cardValueLen), 10))
        if (Val(Mid(m.global.selectedCards[0], m.global.cardValueStart, m.global.cardValueLen), 10) + Val(Mid(m.global.selectedCards[1], m.global.cardValueStart, m.global.cardValueLen), 10)) = 11 then
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

sub onResetButtonSelected(obj)
    resetGame()
  end sub

function resetGame()
    for each r in m.global.arraySelectedButtons
        for each c in r
            c.visible = true
        end for
    end for

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
        "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_clubs.png", "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_diamonds.png", "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_hearts.png", "k_00_https://sthsroku.net/team666/elevens/Cards//king_of_spades.png",
        "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_clubs.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_diamonds.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_hearts.png", "q_00_https://sthsroku.net/team666/elevens/Cards//queen_of_spades.png",
        "j_00_https://sthsroku.net/team666/elevens/Cards//jack_of_clubs.png", "j_00_https://sthsroku.net/team666/elevens/Cards//jack_of_diamonds.png", "j_00_https://sthsroku.net/team666/elevens/Cards//jack_of_hearts.png", "j_00_https://sthsroku.net/team666/elevens/Cards//jack_of_spades.png"
    ]

    m.global.setFields({deckCards : deckCards})
    shuffleCards()
    m.global.rowIndex = 1
    m.global.colIndex = 1

    m.global.cardPoster11.visible = true
    m.global.cardPoster11.setFocus(true)

    m.global.playAgain.visible = false
    m.global.playAgainPoster.visible = false
    tempArr = []
    m.global.setFields({currentBoard : tempArr})
    dealCards()
    displayCards()
    'm.global.arrayButtons[1][1].visible = true
end function

function isEmpty() as Boolean
    if m.global.deckCards.Count() = 0 then
        return true
    else
        return false
    end if
end function

function dealCards()
    for each r in m.global.arraySelectedButtons
        for each c in r
            c.visible = false
        end for
    end for
    arr = m.global.currentBoard
    tempDeck = m.global.deckCards
    while arr.Count() < 9 and not isEmpty()
        arr.push(tempDeck.pop())
    end while
    m.global.setFields({deckCards : tempDeck})
    m.global.setFields({currentBoard : arr})
end function

function displayCards()
    for i = 0 to m.global.currentBoard.Count() - 1
        print m.global.currentBoard[i]
        print Mid(m.global.currentBoard[i], m.cardImgStart)
        m.global.gridCards[i].uri = Mid(m.global.currentBoard[i], m.cardImgStart)
    end for
end function

function checkinList(list, button) as Boolean
    for each item in list
        if item.isSameNode(button) then
            return true
        end if
    end for
    return false
end function

function getSelectedCards()
    tempSelectedCards = []
    for each r in m.global.arraySelectedButtons
        for each card in r
            if card.visible then
                if card.id = "cardSelectedPoster00"
                    tempSelectedCards.push(m.global.currentBoard[0])
                else if card.id = "cardSelectedPoster01"
                    tempSelectedCards.push(m.global.currentBoard[1])
                else if card.id = "cardSelectedPoster02"
                    tempSelectedCards.push(m.global.currentBoard[2])
                else if card.id = "cardSelectedPoster10"
                    tempSelectedCards.push(m.global.currentBoard[3])
                else if card.id = "cardSelectedPoster11"
                    tempSelectedCards.push(m.global.currentBoard[4])
                else if card.id = "cardSelectedPoster12"
                    tempSelectedCards.push(m.global.currentBoard[5])
                else if card.id = "cardSelectedPoster20"
                    tempSelectedCards.push(m.global.currentBoard[6])
                else if card.id = "cardSelectedPoster21"
                    tempSelectedCards.push(m.global.currentBoard[7])
                else if card.id = "cardSelectedPoster22"
                    tempSelectedCards.push(m.global.currentBoard[8])
                end if
            end if
        end for
    end for
    m.global.setFields({selectedCards : tempSelectedCards})
end function

function onKeyEvent(key, press) as Boolean
    ? "onKeyEvent: " key, press
    
    if press then
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].visible = false
        if key = "right" and m.global.colIndex = 2 and m.global.rowIndex = 1 then
            m.global.resetGameButton.setFocus(true)
        else if key = "right" then
            if checkinList(m.global.rightButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
                m.global.colIndex = m.global.colIndex + 1
                m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].visible = true
            end if
        else if key = "up" then
            if checkinList(m.global.upButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
                m.global.rowIndex = m.global.rowIndex - 1
                m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].visible = true
            end if
        else if key = "down" then
            if checkinList(m.global.downButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
                m.global.rowIndex = m.global.rowIndex + 1
                m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].visible = true
            end if
        else if key = "left" then
            if checkinList(m.global.leftButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
                if not m.global.resetGameButton.hasFocus() then
                    m.global.colIndex = m.global.colIndex - 1
                    m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].visible = true
                else
                    m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].visible = true
                    m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
                end if
            end if
        end if
    end if
    if key = "OK" and press then
        m.global.arraySelectedButtons[m.global.rowIndex][m.global.colIndex].visible = not m.global.arraySelectedButtons[m.global.rowIndex][m.global.colIndex].visible
        getSelectedCards()
        if checkSelectedCards() then
            replaceCards()
        end if
        if isEmpty() then
            m.global.resetGameButton.setFocus(true)
        end if
    end if
    return false
end function