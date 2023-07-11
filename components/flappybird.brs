sub init()
    ? "[flappybird] init end"
    bird = m.top.findNode("bird")
    background = m.top.findNode("background")
    m.timer = m.top.findNode("flappyTimer")
    counterLabel = m.top.findNode("score")

    bird.setFocus(true)

    startButton = m.top.findNode("startButton")
    startButton.observeField("buttonSelected", "startGame")

    compositor = CreateObject("roCompositor")
    birdImage = CreateObject("roBitmap", "pkg:/images/bird.png")
    birdRegion = CreateObject("roRegion", birdImage, 0, 0, 225, 225)

    m.birdSprite = compositor.NewSprite(870, 540, birdRegion, 0)

    m.global.addFields({bird : bird})
    m.global.addFields({birdSprite : m.birdSprite})

    pillarTopImage = CreateObject("roBitmap", "pkg:/images/pillar.png")
    pillarTopRegion = CreateObject("roRegion", pillarTopImage, 0, 0, 65, 400)

    pillarTopSprite = compositor.NewSprite(1000, 500, pillarTopRegion, 0)

    pillarBottomImage = CreateObject("roBitmap", "pkg:/images/pillar.png")
    pillarBottomRegion = CreateObject("roRegion", pillarBottomImage, 0, 0, 65, 400)

    pillarBottomSprite = compositor.NewSprite(1000, 580, pillarBottomRegion, 0)

    m.arraySprites = CreateObject("roArray", 1, true)
    m.arraySprites.push(pillarTopSprite)
    m.arraySprites.push(pillarBottomSprite)

    counter = 0

    m.global.addFields({pillarBottomSprite : pillarBottomSprite})
    m.global.addFields({pillarTopSprite : pillarTopSprite})
    m.global.addFields({counter : counter})


end sub

function onKeyEvent(key, press) as boolean
    ? "onKeyEvent: " key, press
    if key = "OK" and not checkMultipleCollision() then
        moveUp()
        m.global.counter =  m.global.counter + 1
        if m.global.counter < 10 then
            counterLabel.text = "High Score: 0" + m.global.counter
        else
            counterLabel.text = "High Score: " + m.global.counter
        end if
    end if
    return false
end function

sub startGame()
    m.timer.control = "start"
    m.timer.ObserveField("fire", "autoMoveBird")
end sub

sub moveUp()
    m.birdSprite.MoveOffset(0, -100)
    updateBird()
end sub

sub autoMoveBird()
    ' moveRightGround()
    moveDown()
end sub

sub moveDown()
    if not checkMultipleCollision then
        m.birdSprite.MoveOffset(0, 40)
        updateBird()
    end if
end sub

' sub moveRightGround()
'     m.birdSprite.MoveOffset(25, 0)
'     updateBird()
' end sub

function checkInSpriteList(pillerSprite) as Boolean
    print m.birdSprite = m.birdSprite
    for each item in m.arraySprites
        if item = pillerSprite then
            return true
        end if
    end for
    return false
end function

sub updateBird()
    m.global.bird.translation = [m.birdSprite.getX(), m.birdSprite.getY()]
end sub

function checkMultipleCollision() as boolean
    if checkInSpriteList(m.birdSprite.CheckCollision()) then
        return true
    end if
    return false
end function

' sub checkCollision(obj) as Boolean
'if m.birdSprite.GetX() + m.birdSprite.GetWidth() > m.global.pillarTopSprite.GetX() and m.birdSprite.GetX() < m.global.pillarTopSprite.GetX() + m.global.pillarTopSprite.GetWidth and m.global.birdSpriteGetY() + m.global.birdSpriteGetHeight() > m.global.pillarTopSpriteGetHeight() and m.global.birdSpriteGetY() < m.global.pillarTopSpriteGetY() + m.global.pillarTopSpriteGetHeight() then
'return true
'else
'   false
'end if
' end sub