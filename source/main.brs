' main.brs
sub init()
    m.top.backgroundURI = "pkg:/images/7elevenlogo.png"
    
    m.elevens = createObject("roSGNode", "ElevensGame")
    m.elevens.observeField("board", "onBoardChanged")
    
    m.elevens.cards = [
        "card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9",
        "card10", "card11", "card12", "card13", "card14", "card15", "card16", "card17", "card18",
        "card19", "card20", "card21", "card22", "card23", "card24", "card25", "card26", "card27",
        "card28", "card29", "card30", "card31", "card32", "card33", "card34", "card35", "card36",
        "card37", "card38", "card39", "card40", "card41", "card42", "card43", "card44", "card45",
        "card46", "card47", "card48", "card49", "card50", "card51", "card52"
    ]
    
    m.elevens.initializeGame()
end sub

sub onBoardChanged()
    for i = 0 to 8
        cardGroupField = "card" + (i + 1) + "Group"
        cardPosterField = "card" + (i + 1) + "Poster"
        cardIndex = m.elevens.board[i]
        m.top.getChild(cardGroupField).visible = (cardIndex >= 0)
        m.top.getChild(cardPosterField).uri = m.elevens.getCardURI(cardIndex)
    end for
end sub

sub runUserInterface()
    screen = createObject("roSGScreen")
    m.port = createObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("Scene")
    m.top = scene.GetRoot()
    
    init()
    
    while (true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if (msgType = "roSGScreenEvent")
            if (msg.isScreenClosed()) then return
        end if
    end while
end sub

runUserInterface()
