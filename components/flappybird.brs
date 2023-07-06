sub init()
    ? "[tictactoe] init" ' essentially a print statment that is called only once
   
    pillarTop = m.top.findNode("pillarTop")
    pillarBottom = m.Top.findNode("pillarBottom")
    bird = m.top.findNode("bird")

    bird.addFields({"bird":"bird"})
    pillarTop.addFields({"pillarTop":"pillarTop"})
    pillarBottom.addFields({"pillarBottom":"pillarBottom"})
    
    m.global.addFields({playerNotify: m.playerNotify})
end sub

function onKeyEvent(key, press) as Boolean
    ? "[tictactoe] onKeyEvent"
    if press then
        if key = "up" then
            m.global.bird.translation = "[860, 560]"
        else if key = "down" then
            m.global.bird.translation = "[860, 560]"
        end if
    end if
end function
' function checkImages()
'     if  
' end function

