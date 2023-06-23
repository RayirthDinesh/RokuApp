' main.brs
sub main()
    ' Create a main scene
    scene = createObject("roSGNode", "Scene")
    scene.setFocus(true)

    ' Load the ElevensGame component
    game = scene.createChild("ElevensGame")

    ' Initialize the game
    game.initGame()

    ' Run the channel
    while true
        ' Handle user input
        while true
            msg = wait(0, game.timer)
            if type(msg) = "roSGScreenEvent" then
                if msg.isScreenClosed() then exit while
            else if type(msg) = "roSGKeyEvent" then
                if msg.isButtonPressed("select") then
                    game.handleUserInput("SELECT")
                end if
            end if
        end while
    end while
end sub
