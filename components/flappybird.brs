sub init()
    ? "[tictactoe] init"
    bird = m.top.findNode("bird")
    background = m.top.findNode("background")

    bird.setFocus(true)
    ? "[flappybird] init end"

    compositor = CreateObject("roCompositor")
    birdImage = CreateObject("roBitmap","pkg:/images/bird.png")
    birdRegion = CreateObject("roRegion", birdImage, 0, 0, 225, 225)

    m.birdSprite = compositor.NewSprite(960, 540, birdRegion, 0)

    m.global.addFields({bird : bird})
    m.global.addFields({birdSprite : m.birdSprite})
end sub

'Handles user input from the remote
function onKeyEvent(key, press) as Boolean
    while m.birdSprite.getY() < 1080
        moveDown()
    end while
    ? "onKeyEvent: " key, press
    if press then
        if key = "up" then
            moveup()
        end if
    end if

    ' m.birdSprite.MoveOffset(0, 10)


    return false
end function

sub moveUp()
    m.birdSprite.MoveOffset(0, -20)
    updateBird()
end sub

sub moveDown()
    m.birdSprite.MoveOffset(0, 1)
    updateBird()
end sub

sub updateBird()
    m.global.bird.translation = [m.birdSprite.getX(), m.birdSprite.getY()]
end sub
