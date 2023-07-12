sub init()
? "[flappybird] init end"
bird = m.top.findNode("bird")
pillarTop = m.top.findNode("pillarTop")
pillarBottom = m.top.findNode("pillarBottom")
background = m.top.findNode("background")
m.timer = m.top.findNode("flappyTimer")
counterLabel = m.top.findNode("score")
title = m.top.findNode("title")

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

pillarTopImage = CreateObject("roBitmap", "pkg:/images/pillarTop.png")
pillarTopRegion = CreateObject("roRegion", pillarTopImage, 0, 0, 65, 400)

m.pillarTopSprite = compositor.NewSprite(1000, 500, pillarTopRegion, 0)

pillarBottomImage = CreateObject("roBitmap", "pkg:/images/pillar.png")
pillarBottomRegion = CreateObject("roRegion", pillarBottomImage, 0, 0, 65, 400)

m.pillarBottomSprite = compositor.NewSprite(1000, 580, pillarBottomRegion, 0)

m.arraySprites = CreateObject("roArray", 1, true)
m.arraySprites.push(m.pillarTopSprite)
m.arraySprites.push(m.pillarBottomSprite)

counter = -1
clickCount = 0


m.global.addFields({counter : counter})
m.global.addFields({counterLabel: counterLabel})
m.global.addFields({clickCount: clickCount})
m.global.addFields({title: title})

end sub

function onKeyEvent(key, press) as boolean
    m.timer.control = "stop"
    ? "onKeyEvent: " key, press
    if key = "OK" and m.global.counter = -1 then
        startGame()
        m.global.title.visible = false
        m.global.counter = 0
        slide()
    else if key = "OK" and m.global.counter > -1  then' and not checkMultipleCollision()'  
        moveUp()
        m.global.counter =  m.global.counter + 1
            if m.global.counter < 10 then
                m.global.counterLabel.text = "High Score: 0" + m.global.counter.ToStr()
            else
                m.global.counterLabel.text = "High Score: " + m.global.counter.ToStr()
            end if    
            m.global.clickCount = m.global.clickCount + 1
    end if
  
    if m.timer.control = "stop" and m.global.clickCount > 0 then
        sleep(100)
        m.timer.control = "start"
    end if
    return false
end function

sub startGame()
    m.timer.control = "start"
    m.timer.ObserveField("fire", "autoMoveBird")
    m.global.startButton.visible = false
    m.global.bird.setFocus(true)
end sub

sub moveUp()
    if m.birdSprite.getY() >= 0 then
        m.birdSprite.MoveOffset(0, -70)
        updateBird()
    end if

    ' m.pillarBottomSprite.MoveOffset(-60,0)
    ' m.pillarTopSprite.MoveOffSet(-60,0)
    ' updatePillar()
end sub

sub autoMoveBird()
    ' moveRightGround()
    moveDown()
    slide()
end sub


sub moveDown()
    ' if not checkMultipleCollision then
    if m.birdSprite.getY() <= 850 then
        m.birdSprite.MoveOffset(0, 40)
        updateBird()
    end if
    ' end if
end sub

sub moveRightGround()
    updatePillar()
end sub

' function checkInSpriteList(pillerSprite) as Boolean
'     for each item in m.arraySprites
'         if item = m.pillerSprite then
'             return true
'         end if

'     end for
'     return false
' end function

sub slide()
    if not m.pillarTopSprite.getX() >= 750 and not m.pillarBottomSprite.getX() >= 750
        m.pillarBottomSprite.MoveOffset(-70,0)
        m.pillarTopSprite.MoveOffSet(-70,0)
        updatePillar()
    end if
end sub

sub updateBird()
    m.global.bird.translation = [m.birdSprite.getX(), m.birdSprite.getY()]
end sub

sub updatePillar()
    m.global.pillarBottom.translation = [m.pillarBottomSprite.getX(), m.pillarBottomSprite.getY()]
    m.global.pillarTop.translation = [m.pillarTopSprite.getX(), m.pillarTopSprite.getY()]
end sub


' function checkMultipleCollision() as boolean
'     if checkInSpriteList(m.birdSprite.CheckCollision()) then
'         return true
'     end if
'     return false
' end function

