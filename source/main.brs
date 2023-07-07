sub main()
	screen = CreateObject("roSGScreen")
	scene = screen.CreateScene("flappybird")
	screen.show()
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