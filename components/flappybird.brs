sub init()
    ? "[flappybird] init end"
    bird = m.top.findNode("bird")
    pillarTop = m.top.findNode("pillarTop")
    pillarBottom = m.top.findNode("pillarBottom")
    pillarTopSecond = m.top.findNode("pillarTopSecond")
    pillarBottomSecond = m.top.findNode("pillarBottomSecond")

    background = m.top.findNode("background")
    m.timer = m.top.findNode("flappyTimer")
    m.uptimer = m.top.findNode("UpTimer")
    counterLabel = m.top.findNode("score")
    title = m.top.findNode("title")

    birdMoveUp = false
    m.global.addFields({birdMoveUp: birdMoveUp})

    startButton = m.top.findNode("startButton")
    startButton.setFocus(true)
    m.global.addFields({startButton: startButton})

    compositor = CreateObject("roCompositor")
    birdImage = CreateObject("roBitmap", "pkg:/images/bird.png")
    birdRegion = CreateObject("roRegion", birdImage, 0, 0, 225, 225)

    m.birdSprite = compositor.NewSprite(870, 540, birdRegion, 0)

    ground = m.top.findNode("ground")

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

    m.arraySprites = CreateObject("roArray", 1, true)
    m.arraySprites.push(m.pillarTopSprite)
    m.arraySprites.push(m.pillarBottomSprite)

    m.global.addFields({counterLabel: counterLabel})
    m.global.addFields({title: title})
end sub

function animation()
    scaleAnimation = m.top.FindNode("scaleAnimation")
    transAnimation = m.top.FindNode("transAnimation")
    scaleAnimation.control = "start"
    transAnimation.control = "start"
end function


function onKeyEvent(key, press) as boolean
    ? "onKeyEvent: " key, press
    if key = "OK" and m.global.title.visible then
        startGame()
        m.global.title.visible = false
    else if key = "OK" then' and not checkMultipleCollision()'
        m.global.birdMoveUp = true
        ' m.global.counter =  m.global.counter + 1
        '     if m.global.counter < 10 then
        '         m.global.counterLabel.text = "High Score: 0" + m.global.counter.ToStr()
        '     else
        '         m.global.counterLabel.text = "High Score: " + m.global.counter.ToStr()
        '     end if
        '     m.global.clickCount = m.global.clickCount + 1
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
    move()
    slide()

end sub

sub move()
    if m.global.birdMoveUp and m.birdSprite.getY() >= 0 then
        m.birdSprite.MoveOffset(0, -50)
        m.global.birdMoveUp = false
    else if m.birdSprite.getY() <= 880
        m.birdSprite.MoveOffset(0, 40)
    end if
    updateBird()
end sub

sub slide()
    if m.pillarBottomSprite.getX() <= 500
        m.pillarBottomSprite.MoveTo(1790, 650)
        m.pillarTopSprite.MoveTo(1790, -10)
    end if

    if m.pillarBottomSpriteSecond.getX() <= 500
        m.pillarBottomSpriteSecond.MoveTo(1790, 650)
        m.pillarTopSpriteSecond.MoveTo(1790, -10)
    end if

    m.pillarBottomSprite.MoveOffset(-50, 0)
    m.pillarTopSprite.MoveOffSet(-50, 0)
    m.pillarBottomSpriteSecond.MoveOffset(-50, 0)
    m.pillarTopSpriteSecond.MoveOffSet(-50, 0)
    updatePillar()
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