sub init()
    ? "[homescreen] init"
    m.top.backgroundURI = "pkg:/images/LinedPaper.jpg"
    m.appHomeScene = m.top.findNode("appHomeScene")
    m.ElevensGame = m.top.findNode("ElevensGame")
    m.flappybird = m.top.findNode("flappybird")
    m.tictactoe = m.top.findNode("tictactoe")

    m.appHomeScene.observeField("tictactoe_button", "onTicTacToeButtonSelected")
    m.appHomeScene.observeField("elevens_button", "onElevensButtonSelected")
    m.appHomeScene.observeField("flappybird_button", "onFlappyBirdButtonSelected")

    m.appHomeScene.setFocus(true)
  end sub
  
  function onTicTacToeButtonSelected(obj)
    ? "[homescreen] onTicTacToeButtonSelected"
    m.appHomeScene.visible = false
    m.tictactoe.visible = true
    m.tictactoe.setFocus(true)
    m.top.backgroundURI = "pkg:/images/background.png"
  end function

  function onElevensButtonSelected(obj)
    ? "[homescreen] onElevensButtonSelected"
    m.appHomeScene.visible = false
    m.ElevensGame.visible = true
    m.ElevensGame.setFocus(true)
  end function

  function onFlappyBirdButtonSelected(obj)
    ? "[homescreen] onflappybirdButtonSelected"
    m.appHomeScene.visible = false
    m.flappybird.visible = true
    m.flappybird.setFocus(true)
  end function
  

  function onKeyEvent(key, press) as Boolean
    ? "[homescreen] onKeyEvent" key, press
  if key = "back" and press
    if m.tictactoe.visible
        m.tictactoe.visible = false
        m.appHomeScene.visible = true
        m.appHomeScene.setFocus(true)
        m.top.backgroundURI = "pkg:/images/LinedPaper.jpg"
        return true
    else if m.ElevensGame.visible
        m.ElevensGame.visible = false
        m.appHomeScene.visible = true
        m.appHomeScene.setFocus(true)
        m.top.backgroundURI = "pkg:/images/LinedPaper.jpg"
        return true
    else if m.flappybird.visible
        m.flappybird.visible = false
        m.appHomeScene.visible = true
        m.appHomeScene.setFocus(true)
        m.top.backgroundURI = "pkg:/images/LinedPaper.jpg"
        return true
    end if
  end if
  return false
  end function