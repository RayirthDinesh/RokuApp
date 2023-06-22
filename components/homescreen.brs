sub init()
    ? "[home] init"


    m.tictactoe = m.top.findNode("tictactoe")
    m.elevens = m.top.findNode("elevens")

    ' m.global.addFields({tictactoe : tictactoe})
    ' m.global.addFields({elevens : elevens})

end sub

function onKeyEvent(key, press) as Boolean
    if key = "OK" then
        if m.global.tictactoe.buttonSelected then
            ' scene  = screen.CreateScene("Scene")
            ' screen.show()
        end if
    end if
end function