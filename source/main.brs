' main.brs
' Main entry point for the Elevens game app

' Create the Elevens game object
sub main()
    game = ElevensGame()

    ' Initialize the game
    game.initializeGame()

    ' Event loop
    while true
        ' Handle user input
        event = Wait(0)
        if event <> invalid then
            game.handleUserInput(event)
        end if
    end while
end sub
