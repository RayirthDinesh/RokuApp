sub main()
	'create a screen when an app is starting up

	screen = createObject("roSGScreen")
	scene = screen.createScene("tictactoe")
	screen.Show()
	port = createObject("roMessagePort")
	screen.setMessagePort(m.port)

'needs this so the screen doesn't close. Every app needs this
	while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
		end if
	end while
end sub
