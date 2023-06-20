sub main()

	screen = createObject("roSGScreen")
	scene = screen.createScene("tictactoe")
	screen.Show()
	port = createObject("roMessagePort")
	screen.setMessagePort(m.port)

	while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
		end if
	end while
end sub