sub init()
    ? "[tictactoe] init" ' essentially a print statment that is called only once
   
    pillarTop = m.top.findNode("pillarTop")
    pillarBottom = m.Top.findNode("pillarBottom")
    bird = m.top.findNode("bird")

    m.global.bal.bird.addFields({bird : bird})
    m.global.pillarTop.addFields({pillarTop: pillarTop})
    m.global.pillarBottoaddFields({pillarBottom: pillarBottom})
    
    pillarArr = [m.global.pillarTop, m.global.pillarBottom]
    m.global.addFields({pillarArr : pillarArr})
    
    m.global.addFields({playerNotify: m.playerNotify})

    birdImage = CreateObject("roBitmap","https://sthsroku.net/team666/FlappyBird/bird.png")
    birdRegion = CreateObject("roRegion", birdImage, 960, 540, 200, 200)
    birdRegion.SetWrap(true)
    
    compositor = CreateObject("roCompositor")
    black=&hFF'RGBA
    compositor.DetDAllrawTo(birdImage, black)
    birdSprite = compositor.NewSprite(500, 500, birdRegion, 0)
    compositor.DrawAll()
    m.global.addFields({birdSprite : birdSprite})
end sub

'Handles user input from the remote
function onKeyEvent(key, press) as Boolean
    ? "[tictactoe] onKeyEvent"
    if press then
        if key = "up" then
            moveBirdTo(860, 300)
        else if key = "down" then
            moveBirdTo(860, 560)
        end if
    end if
end function

'Moves bird position to param
sub moveBirdTo(x,y)
    m.global.birdSprite.moveTo(x,y)
end sub

'**
'*Checks if the bird collides with the pipe
'*Assumes that the pipe will be Sprite type
'*Untested function
'**/
function pipeCollision() as Boolean
     if (birdSprite.checkCollision() = invalid)
        return false
     end if
     
     return true
end function



'**
'*End the game when the player loses
'*For now, the app will quit
'*Untested function
'**/
sub gameOver()

    end

end sub

