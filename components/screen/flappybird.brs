sub init()
    ? "[flappybird] init end"
    bird = m.top.findNode("bird")
    pillarTop = m.top.findNode("pillarTop")
    pillarBottom = m.top.findNode("pillarBottom")
    pillarTopSecond = m.top.findNode("pillarTopSecond")
    pillarBottomSecond = m.top.findNode("pillarBottomSecond")

    background = m.top.findNode("background")
    m.timer = m.top.findNode("flappyTimer")
    m.groundTimer = m.top.findNode("groundTimer")

    counterLabel = m.top.findNode("score")
    title = m.top.findNode("title")
    playAgainPoster = m.top.findNode("playAgainPoster")

    birdMoveUp = false
    m.global.addFields({birdMoveUp: birdMoveUp})

    groundOne = m.top.findNode("groundOne")
    ' groundTwo = m.top.findNode("groundTwo")
    ' groundThree = m.top.findNode("groundThree")
    m.global.addFields({groundOne:groundOne})
    ' m.global.addFields({groundTwo:groundTwo})
    ' m.global.addFields({groundThree:groundThree})

    startButton = m.top.findNode("startButton")
    startButton.setFocus(true)
    m.global.addFields({startButton: startButton})

    compositor = CreateObject("roCompositor")
    birdImage = CreateObject("roBitmap", "pkg:/images/bird.png")
    birdRegion = CreateObject("roRegion", birdImage, 0, 0, 225, 225)

    m.birdSprite = compositor.NewSprite(870, 540, birdRegion, 0)

    scoreKeeper = 0
    m.global.addFields({scoreKeeper: scoreKeeper})

    groundImage = CreateObject("roBitmap", "pkg:/images/ground1.png")
    groundRegion = CreateObject("roRegion", groundImage, 0, 0, 1796, 268)

    m.groundSprite = compositor.NewSprite(300, 980, groundRegion, 0) 'originally was (585,980)

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
    ' m.groundTimer.ObserveField("fire", "dollarTreeAnimationGround")

    randomPillarTranslation = ((Rnd(0) * 650) + 200)
    randomPillarTranslationSecond = randomPillarTranslation
    m.global.addFields({randomPillarTranslation: randomPillarTranslation})
    m.global.addFields({randomPillarTranslationSecond: randomPillarTranslationSecond})

    ' m.pillarBottomSprite.MoveTo(1390, m.global.randomPillarTranslationSecond)
    ' m.pillarTopSprite.MoveTo(1390, -10)

    ' m.pillarBottomSpriteSecond.MoveTo(1990, m.global.randomPillarTranslationSecond)
    ' m.pillarTopSpriteSecond.MoveTo(1990, -10)
    
    ' changeFirstPillar()
    ' changeSecondPillar()

    ' updatePillar()
    ' m.groundTimer.control = "start"
    ' m.groundTimer.ObserveField("fire", "dollarTreeAnimationGround")
end sub

' sub dollarTreeAnimationGround()
    
'     m.global.groundThree.visible = false
  
'     '  m.global.groundOne.uri = "pkg:/images/ground1.png"
'     '  m.global.groundTwo.uri = "pkg:/images/ground2.png"
'     '  m.global.groundOne.uri = "pkg:/images/ground3.png"

 
' end sub


function onKeyEvent(key, press) as boolean
    ? "onKeyEvent: " key, press
    if key = "OK" and m.global.title.visible then
        startGame()
        m.global.title.visible = false
    else if key = "OK" then
        m.global.birdMoveUp = true
    end if
    return false
end function

sub startGame()
    m.timer.control = "start"
    m.timer.ObserveField("fire", "autoMoveBird")
    m.global.startButton.visible = false
    m.global.bird.setFocus(true)
    

end sub

sub autoMoveBird()
    moveGround()
    move()
    movePillars()
end sub

sub moveGround() 
    if m.groundSprite.getX() < 50 then
        m.groundSprite.MoveTo(300, 980)
    end if
    m.groundSprite.MoveOffSet(-20,0)
    
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

    if checkCollision() = false then
        m.global.playAgainPoster.visible = true
        m.global.title.visible = true

        resetGame()
    end if
end sub

sub movePillars()
    

    m.global.randomPillarTranslation = ((Rnd(0) * 700) + 200)+10
    m.global.randomPillarTranslationSecond = m.global.randomPillarTranslation+10

    if m.pillarBottomSprite.getX() <= 500
        m.pillarBottomSprite.MoveTo(1790, m.global.randomPillarTranslationSecond)
        m.pillarTopSprite.MoveTo(1790, -10)
        changeFirstPillar()
    end if

    if m.pillarBottomSpriteSecond.getX() <= 500
        m.pillarBottomSpriteSecond.MoveTo(1790, m.global.randomPillarTranslationSecond)
        m.pillarTopSpriteSecond.MoveTo(1790, -10)
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

sub checkCollision() as Boolean
    if m.birdSprite.CheckCollision() = invalid then
        return true
    end if
    return false
end sub

sub resetGame()

end sub