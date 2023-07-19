sub init()
    ' ? "[flappybird] init end"
    bird = m.top.findNode("bird")
    pillarTop = m.top.findNode("pillarTop")
    pillarBottom = m.top.findNode("pillarBottom")
    pillarTopSecond = m.top.findNode("pillarTopSecond")
    pillarBottomSecond = m.top.findNode("pillarBottomSecond")

    'coded by vikram satesh nandi(July 16, 2023)
    background = m.top.findNode("background")
    m.timer = m.top.findNode("flappyTimer")
    m.global.addFields({timer: m.timer})

    counterLabel = m.top.findNode("score")
    title = m.top.findNode("title")
    playAgainPoster = m.top.findNode("playAgainPoster")

    ' m.playAgainButton = m.top.findNode("playAgainButton")
    ' m.playAgainButton.observeField("buttonSelected", "playAgainButton")
    m.playGameButton = m.top.findNode("playGameButton")
    m.playGameButton.observeField("buttonSelected", "playGameButton")
    m.global.addFields({playGameButton: m.playGameButton})

    birdMoveUp = false
    m.global.addFields({birdMoveUp: birdMoveUp})

    groundOne = m.top.findNode("groundOne")
    m.global.addFields({groundOne: groundOne})
    startButton = m.top.findNode("startButton")
    m.global.addFields({startButton: startButton})
    m.playGameButton.setFocus(true)

    compositor = CreateObject("roCompositor")
    birdImage = CreateObject("roBitmap", "pkg:/images/bird.png")
    birdRegion = CreateObject("roRegion", birdImage, 0, 0, 225, 225)

    m.birdSprite = compositor.NewSprite(700, 425, birdRegion, 0)

    scoreKeeper = 0
    m.global.addFields({scoreKeeper: scoreKeeper})

    groundImage = CreateObject("roBitmap", "pkg:/images/ground1.png")
    groundRegion = CreateObject("roRegion", groundImage, 0, 0, 1796, 268)

    m.groundSprite = compositor.NewSprite(585, 980, groundRegion, 0)

    m.global.addFields({bird : bird})
    m.global.addFields({pillarBottom : pillarBottom})
    m.global.addFields({pillarTop : pillarTop})
    m.global.addFields({pillarBottomSecond : pillarBottomSecond})
    m.global.addFields({pillarTopSecond : pillarTopSecond})

    pillarTopImage = CreateObject("roBitmap", "pkg:/images/pillarTop.png")
    pillarTopRegion = CreateObject("roRegion", pillarTopImage, 0, 0, 65, 400)

    m.pillarTopSprite = compositor.NewSprite(1390, -10, pillarTopRegion, 0)
    m.pillarTopSpriteSecond = compositor.NewSprite(1990, -10, pillarTopRegion, 0)

    pillarBottomImage = CreateObject("roBitmap", "pkg:/images/pillar.png")
    pillarBottomRegion = CreateObject("roRegion", pillarBottomImage, 0, 0, 65, 400)

    m.pillarBottomSprite = compositor.NewSprite(1390, 650, pillarBottomRegion, 0)
    m.pillarBottomSpriteSecond = compositor.NewSprite(1990, 650, pillarBottomRegion, 0)

    m.global.addFields({counterLabel: counterLabel})
    m.global.addFields({title: title})
    m.global.addFields({playAgainPoster : playAgainPoster})

    scoreFirstPillars = true
    scoreSecondPillars = true
    m.global.addFields({scoreFirstPillars: scoreFirstPillars})
    m.global.addFields({scoreSecondPillars: scoreSecondPillars})

    randomPillarTranslation = ((Rnd(0) * 700) + 260)
    m.global.addFields({randomPillarTranslation: randomPillarTranslation})
    m.global.randomPillarTranslation = ((Rnd(0) * 700) + 260)

    m.pillarBottomSprite.MoveTo(1390, m.global.randomPillarTranslation)
    m.pillarTopSprite.MoveTo(1390, -30)
    changeFirstPillar()

    m.global.randomPillarTranslation = ((Rnd(0) * 700) + 260)

    m.pillarBottomSpriteSecond.MoveTo(1990, m.global.randomPillarTranslation)
    m.pillarTopSpriteSecond.MoveTo(1990, -30)
    changeSecondPillar()

    updatePillar()
end sub

' sub playAgainButton()
'     resetGame()
' end sub

sub playGameButton()
    startGame()
end sub

function onKeyEvent(key, press) as boolean
    ' ? "onKeyEvent: " key, press
    if key = "OK" then
        m.global.birdMoveUp = true
    end if

    return false
end function

sub startGame()
    m.global.timer.repeat = true
    m.global.timer.control = "start"
    m.global.timer.ObserveField("fire", "autoMoveBird")
    m.global.startButton.visible = false
    m.global.playGameButton.visible = false
    m.global.bird.setFocus(true)
    m.global.playAgainPoster.visible = false
    m.global.title.visible = false
end sub

sub autoMoveBird()
    moveGround()
    move()
    movePillars()
end sub

sub moveGround()
    if m.groundSprite.getX() < 0 then
        m.groundSprite.MoveTo(585, 980)
    end if
    m.groundSprite.MoveOffSet(-30, 0)

    updateGround()
end sub

sub updateGround()
    m.global.groundOne.translation = [m.groundSprite.getX(), m.groundSprite.getY()]

end sub

sub move()
    if m.global.birdMoveUp and m.birdSprite.getY() >= 0 then
        m.birdSprite.MoveOffset(0, -40)
        m.global.birdMoveUp = false
    else if m.birdSprite.getY() <= 880
        m.birdSprite.MoveOffset(0, 30)
    end if
    updateBird()

    if checkCollision() then
        ' m.global.playAgainPoster.visible = true
        ' m.playAgainButton.visible = true
        ' m.playAgainButton.setFocus(true)
        m.global.title.visible = true
        m.global.timer.control = "stop"
        m.global.timer.repeat = false
        
    end if
end sub

sub movePillars()
    randomizePillarSize()
    if m.pillarBottomSprite.getX() <= 500
        m.pillarBottomSprite.MoveTo(1790, m.global.randomPillarTranslation)
        m.pillarTopSprite.MoveTo(1790, -30)
        changeFirstPillar()
    end if

    if m.pillarBottomSpriteSecond.getX() <= 500
        m.pillarBottomSpriteSecond.MoveTo(1790, m.global.randomPillarTranslation)
        m.pillarTopSpriteSecond.MoveTo(1790, -30)
        changeSecondPillar()
    end if

    m.pillarBottomSprite.MoveOffset(-30, 0)
    m.pillarTopSprite.MoveOffSet(-30, 0)
    m.pillarBottomSpriteSecond.MoveOffset(-30, 0)
    m.pillarTopSpriteSecond.MoveOffSet(-30, 0)
    updatePillar()
    score()
end sub

sub changeFirstPillar()
    m.global.scoreFirstPillars = true
    m.global.pillarTop.Height = m.global.randomPillarTranslation - 200
    m.global.pillarBottom.Height = 1100 - m.pillarBottomSprite.getY()
end sub

sub changeSecondPillar()
    m.global.scoreSecondPillars = true
    m.global.pillarTopSecond.Height = m.global.randomPillarTranslation - 200
    m.global.pillarBottomSecond.Height = 1100 - m.pillarBottomSpriteSecond.getY()
end sub

sub score()
    if m.pillarBottomSpriteSecond.getX() < m.birdSprite.getX() and m.global.scoreSecondPillars
        m.global.scoreKeeper = m.global.scoreKeeper + 1
        m.global.counterLabel.text = "Score: " + m.global.scoreKeeper.ToStr()
        m.global.scoreSecondPillars = false
    end if

    if m.pillarBottomSprite.getX() < m.birdSprite.getX() and m.global.scoreFirstPillars
        m.global.scoreKeeper = m.global.scoreKeeper + 1
        m.global.counterLabel.text = "Score: " + m.global.scoreKeeper.ToStr()
        m.global.scoreFirstPillars = false
    end if
end sub

sub updateBird()
    m.global.bird.translation = [m.birdSprite.getX(), m.birdSprite.getY()]
end sub

sub updatePillar()
    m.global.pillarBottom.translation = [m.pillarBottomSprite.getX(), m.pillarBottomSprite.getY()]
    m.global.pillarTop.translation = [m.pillarTopSprite.getX(), m.pillarTopSprite.getY()]

    m.global.pillarBottomSecond.translation = [m.pillarBottomSpriteSecond.getX(), m.pillarBottomSpriteSecond.getY()]
    m.global.pillarTopSecond.translation = [m.pillarTopSpriteSecond.getX(), m.pillarTopSpriteSecond.getY()]
end sub

sub randomizePillarSize()
    ran = ((Rnd(0) * 700) + 260)
    m.global.setFields({randomPillarTranslation : ran})
end sub

sub checkCollision() as Boolean
    if (m.birdSprite.getX() + 100 > m.pillarBottomSprite.getX() and m.birdSprite.getX() < m.pillarBottomSprite.getX() + 60 and m.birdSprite.getY() + 50 > m.pillarBottomSprite.getY()) then
        return true
    else if m.birdSprite.getX() + 100 > m.pillarTopSprite.getX() and m.birdSprite.getX() < m.pillarTopSprite.getX() + 160 and m.birdSprite.getY() < m.pillarTopSprite.getY() + m.global.pillarTop.Width + 25 then
        return true
    else if m.birdSprite.getX() + 100 > m.pillarBottomSpriteSecond.getX() and m.birdSprite.getX() < m.pillarBottomSpriteSecond.getX() + 60 and m.birdSprite.getY() + 50 > m.pillarBottomSpriteSecond.getY() then
        return true
    else if m.birdSprite.getX() + 100 > m.pillarTopSpriteSecond.getX() and m.birdSprite.getX() < m.pillarTopSpriteSecond.getX() + 160 and m.birdSprite.getY() < m.pillarTopSpriteSecond.getY() + m.global.pillarTopSecond.Width + 25 then
        return true
    else if m.birdSprite.getY() > 880 then
        return true
    end if
    return false
end sub

' sub resetGame()
'     m.global.timer.duration = 0.1

'     m.global.playAgainPoster.visible = false
'     m.global.startButton.visible = true
'     m.global.playGameButton.visible = true
'     m.global.playGameButton.setFocus(true)

'     m.global.birdMoveUp = false
'     m.global.scoreKeeper = 0
'     m.global.counterLabel.text = "Score: " + m.global.scoreKeeper.ToStr()
    
'     m.groundSprite.MoveTo(585, 980)
'     updateGround()

'     randomizePillarSize()

'     m.pillarBottomSprite.MoveTo(1390, m.global.randomPillarTranslation)
'     m.pillarTopSprite.MoveTo(1390, -30)
'     changeFirstPillar()

'     randomizePillarSize()
'     m.pillarBottomSpriteSecond.MoveTo(1990, m.global.randomPillarTranslation)
'     m.pillarTopSpriteSecond.MoveTo(1990, -30)
'     changeSecondPillar()
'     updatePillar()

'     m.birdSprite.MoveTo(700, 425)
'     updateBird()
' end sub