sub init()
    ? "[flappybird] init end"
    bird = m.top.findNode("bird")
    background = m.top.findNode("background")
    m.timer = m.top.findNode("flappyTimer")

    bird.setFocus(true)

    startButton = m.top.findNode("startButton")
    startButton.observeField("press", "startGame")

    compositor = CreateObject("roCompositor")
    birdImage = CreateObject("roBitmap","pkg:/images/bird.png")
    birdRegion = CreateObject("roRegion", birdImage, 0, 0, 225, 225)

    m.birdSprite = compositor.NewSprite(960, 540, birdRegion, 0)

    m.global.addFields({bird : bird})
    m.global.addFields({birdSprite : m.birdSprite})


    pillarTopImage = CreateObject("roBitmap","pkg:/images/pillar.png")
    pillarTopRegion = CreateObject("roRegion", pillarTopImage, 0, 0, 500, 500)

    m.pillarTopSprite = compositor.NewSprite(1000, 500, pillarTopRegion, 0)

    m.global.addFields({pillarTopSprite : m.pillarTopSprite})


end sub

'Handles user input from the remote
function onKeyEvent(key, press) as Boolean
    ? "onKeyEvent: " key, press
        if key = "OK" then
            moveup()
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
    moveRightGround()
    moveDown()
end sub

sub moveDown()
    m.birdSprite.MoveOffset(0, 40)
    updateBird()
end sub

sub moveRightGround()
    m.birdSprite.MoveOffset(25, 0)
    updateBird()
end sub

sub updateBird()
    m.global.bird.translation = [m.birdSprite.getX(), m.birdSprite.getY()]
end sub

' sub checkCollision(obj)
'     if m.birdSprite
' end sub