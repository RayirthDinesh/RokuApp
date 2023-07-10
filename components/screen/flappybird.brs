sub init()
    ? "[flappybird] init"
    bird = m.top.findNode("bird")
    pillarTop = m.top.findNode("pillarTop")
    pillarBottom = m.top.findNode("pillarBottom")
    background = m.top.findNode("background")
    m.timer = m.top.findNode("flappyTimer")

    m.timer.ObserveField("fire", "moveDown")

    bird.setFocus(true)

    startButton = m.top.findNode("startButton")
    startButton.observeField("buttonSelected", "startGame")

    compositor = CreateObject("roCompositor")
    birdImage = CreateObject("roBitmap","pkg://images/bird.png")
    birdRegion = CreateObject("roRegion", birdImage, 0, 0, 225, 225)

    m.birdSprite = compositor.NewSprite(960, 540, birdRegion, 0)

    m.global.addFields({bird : bird})
    m.global.addFields({birdSprite : m.birdSprite})

    m.timer.control = "start"


    pillarTopImage = CreateObject("roBitmap","https://sthsroku.net/team666/FlappyBird/pillar.png")
    pillarTopRegion = CreateObject("roRegion", pillarTopImage, 0, 0, 500, 500)

    m.pillarTopSprite = compositor.NewSprite(1000, 500, pillarTopRegion, 0)

    m.global.addFields({pillarTopSprite : m.pillarTopSprite})
    m.global.addFields({pillarTop: m.pillarTop})

    pillarBottomImage = CreateObject("roBitmap","https://sthsroku.net/team666/FlappyBird/pillar.png")
    pillarBottomRegion = CreateObject("roRegion", pillarBottomImage, 0, 0, 500, 500)

    m.pillarBottomSprite = compositor.NewSprite(1000, 500, pillarBottomRegion, 0)

    m.global.addFields({pillarBottomSprite : m.pillarBottomSprite})
    m.global.addFields({pillarBottom: m.pillarBottom})

    startGame()
end sub

'Handles user input from the remote
function onKeyEvent(key, press) as Boolean
    ? "onKeyEvent: " key, press
        if key = "OK" and m.birdSprite.getY() > 0 then
            moveup()
        end if
    return false
end function

sub startGame()

end sub

sub moveUp()
    m.birdSprite.MoveOffset(0, -100)
    updateBird()
end sub

' sub autoMoveBird()
'     moveRightGround()
'     moveDown()
' end sub

sub moveDown()
    if m.birdSprite.getY() < 900 then
        m.birdSprite.MoveOffset(0, 40)
        updateBird()
    end if
end sub

' sub moveRightGround()
'     m.birdSprite.MoveOffset(25, 0)
'     updateBird()
' end sub

sub updateBird()
    m.global.bird.translation = [m.birdSprite.getX(), m.birdSprite.getY()]
end sub

' sub movePillars()
'     m.global.pillarTop.translation = [1000,775]
'     m.global.pillarBottom.translation = [1000,25]
'     m.global.pillarTop.MoveOffset(0,25)
'     m.global.pillarBottom.MoveOffset(0,-25)
' end sub

sub CheckCollision() as Object
    if m.global.birdSprite.getY = m.global.pillarTop.getY
    '.GetBoundingBox().Intersects(pillar.GetBoundingBox()) then
        return gameOver()
    else
        return invalid
    end if
end sub

sub gameOver()

end sub