sub init()
  ? "[tictactoe] init" ' essentially a print statment that is called only once
  m.top.backgroundURI = "pkg:/images/background.png"
  m.gamename = m.top.findNode("gamename")
  m.poster = m.top.findNode("tictactoe")
  m.playerNotify = m.top.findNode("playerNotify")
  m.global.addFields({playerNotify: m.playerNotify})
'variables that we call from XML and we want to edit
  r0c0 = m.top.findNode("r0c0")
  r0c1 = m.top.findNode("r0c1")
  r0c2 = m.top.findNode("r0c2")
  r1c0 = m.top.findNode("r1c0")
  r1c1 = m.top.findNode("r1c1")
  r1c2 = m.top.findNode("r1c2")
  r2c0 = m.top.findNode("r2c0")
  r2c1 = m.top.findNode("r2c1")
  r2c2 = m.top.findNode("r2c2")
'makes the functions global
  m.global.addFields({r0c0: r0c0})
  m.global.addFields({r0c1: r0c1})
  m.global.addFields({r0c2: r0c2})
  m.global.addFields({r1c0: r1c0})
  m.global.addFields({r1c1: r1c1})
  m.global.addFields({r1c2: r1c2})
  m.global.addFields({r2c0: r2c0})
  m.global.addFields({r2c1: r2c1})
  m.global.addFields({r2c2: r2c2})

  m.xPlayer = true
  m.global.addFields({xPlayer: m.xPlayer})

  m.skipFirstOKAfterReset = false
  m.global.addFields({skipFirst : m.skipFirstOKAfterReset})

  m.playerWin = false
  m.global.addFields({playerWin : m.playerWin})

  rowIndex = 1
  colIndex = 1
  m.global.addFields({rowIndex : rowIndex})
  m.global.addFields({colIndex : colIndex})

  arrayButtons = [[r0c0,r0c1,r0c2], [r1c0,r1c1,r1c2], [r2c0,r2c1,r2c2]]
  m.global.addFields({arrayButtons : arrayButtons})

  rightButtons = [r0c0,r1c0,r2c0,r0c1,r1c1,r2c1]
  leftButtons = [r0c2,r1c2,r2c2,r0c1,r1c1,r2c1]
  upButtons = [r2c0,r2c1,r2c2,r1c0,r1c1,r1c2]
  downButtons = [r0c0,r0c1,r0c2,r1c0,r1c1,r1c2]
  m.global.addFields({rightButtons : rightButtons})
  m.global.addFields({leftButtons : leftButtons})
  m.global.addfields({upButtons : upButtons})
  m.global.addFields({downButtons : downButtons})

  diagonalWin1 = m.top.findNode("diagonalWin1")
  diagonalWin2 = m.top.findNode("diagonalWin2")
  Horizontal_Line_Top = m.top.findNode("Horizontal_Line_Top")
  Horizontal_Line_Middle = m.top.findNode("Horizontal_Line_Middle")
  Horizontal_Line_Bottom = m.top.findNode("Horizontal_Line_Bottom")
  Vertical_Line_Top = m.top.findNode("Vertical_Line_Top")
  Vertical_Line_Middle = m.top.findNode("Vertical_Line_Middle")
  Vertical_Line_Bottom = m.top.findNode("Vertical_Line_Bottom")

  lineArray = [diagonalWin1, diagonalWin2, Horizontal_Line_Bottom, Horizontal_Line_Top, Horizontal_Line_Middle, Vertical_Line_Top, Vertical_Line_Middle, Vertical_Line_Bottom]
  m.global.addFields({lineArray : lineArray})

  playAgain = m.top.findNode("playAgain")
  m.global.addFields({playAgain : playAgain})
  playAgain.observeField("buttonSelected", "onResetButtonSelected")

  playAgainPoster = m.top.findNode("playAgainPoster")
  m.global.addFields({playAgainPoster : playAgainPoster})

  m.global.addFields({diagonalWin1 : diagonalWin1})
  m.global.addFields({diagonalWin2 : diagonalWin2})
  m.global.addFields({Horizontal_Line_Top : Horizontal_Line_Top})
  m.global.addFields({Horizontal_Line_Middle : Horizontal_Line_Middle})
  m.global.addFields({Horizontal_Line_Bottom : Horizontal_Line_Bottom})
  m.global.addFields({Vertical_Line_Top : Vertical_Line_Top})
  m.global.addFields({Vertical_Line_Middle : Vertical_Line_Middle})
  m.global.addFields({Vertical_Line_Bottom : Vertical_Line_Bottom})


  r1c1.setFocus(true) 'set focus starts at the middle grid
end sub

function checkinList(list, button) as Boolean
  for each item in list
    if item.isSameNode(button) then
      return true
    end if
  end for
  return false
end function

'function deals with the different types of presses and when the user moves to different buttons and hover following conditionals will also deal with how a user will move to different grids, then what happens if they do
function onKeyEvent(key, press) as Boolean
  ? "[tictactoe] onKeyEvent" key, press
  if not m.global.playerWin then
    if press then
      if key = "right" then
        if checkinList(m.global.rightButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
          m.global.colIndex = m.global.colIndex + 1
        end if
      else if key = "up" then
        if checkinList(m.global.upButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
          m.global.rowIndex = m.global.rowIndex - 1
        end if
      else if key = "down" then
        if checkinList(m.global.downButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
          m.global.rowIndex = m.global.rowIndex + 1
        end if
      else if key = "left" then
        if checkinList(m.global.leftButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
          m.global.colIndex = m.global.colIndex - 1
        end if
      end if
      if m.global.xPlayer and m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/blank.png" then
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redX.jpg"
      else if not m.global.xPlayer and m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/blank.png"
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redO.jpg"
      end if
      m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
    else
      if key = "OK" and not m.global.skipFirst then
        if m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/blank.png" then
          if m.global.xPlayer then
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/whiteX.jpg"
            m.global.xPlayer = false
            m.global.playerNotify.text = "Player O's Turn"
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redX.jpg"
          else
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/whiteO.jpg"
            m.global.xPlayer = true
            m.global.playerNotify.text = "Player X's Turn"
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redO.jpg"
          end if
        end if
        Winning()
      else
        m.global.skipFirst = false
      end if
    end if
  end if
end function

function Winning()
'x player
'for each if else if statment, add a reset function after the visible function
  if not m.global.xPlayer then
    if m.global.r0c0.iconUri = "pkg:/images/whiteX.jpg" and m.global.r0c1.iconUri = "pkg:/images/whiteX.jpg" and m.global.r0c2.iconUri = "pkg:/images/whiteX.jpg" then
      m.global.Horizontal_Line_Top.visible = true
      m.global.playerNotify.text = "Player X wins"
      m.global.playerWin = true '-
    else if m.global.r1c0.iconUri = "pkg:/images/whiteX.jpg" and m.global.r1c1.iconUri = "pkg:/images/whiteX.jpg" and m.global.r1c2.iconUri = "pkg:/images/whiteX.jpg" then
      m.global.Horizontal_Line_Middle.visible = true
      m.global.playerNotify.text = "Player X wins"
      m.global.playerWin = true '-
    else if m.global.r2c0.iconUri = "pkg:/images/whiteX.jpg" and m.global.r2c1.iconUri = "pkg:/images/whiteX.jpg" and m.global.r2c2.iconUri = "pkg:/images/whiteX.jpg" then
      m.global.Horizontal_Line_Bottom.visible = true
      m.global.playerNotify.text = "Player X wins"
      m.global.playerWin = true '-
    else if m.global.r0c0.iconUri = "pkg:/images/whiteX.jpg" and m.global.r1c0.iconUri = "pkg:/images/whiteX.jpg" and m.global.r2c0.iconUri = "pkg:/images/whiteX.jpg" then
      m.global.Vertical_Line_Top.visible = true
      m.global.playerNotify.text = "Player X wins"
      m.global.playerWin = true '|
    else if m.global.r0c1.iconUri = "pkg:/images/whiteX.jpg" and m.global.r1c1.iconUri = "pkg:/images/whiteX.jpg" and m.global.r2c1.iconUri = "pkg:/images/whiteX.jpg" then
      m.global.Vertical_Line_Middle.visible = true
      m.global.playerNotify.text = "Player X wins"
      m.global.playerWin = true '|
    else if m.global.r0c2.iconUri = "pkg:/images/whiteX.jpg" and m.global.r1c2.iconUri = "pkg:/images/whiteX.jpg" and m.global.r2c2.iconUri = "pkg:/images/whiteX.jpg" then
      m.global.Vertical_Line_Bottom.visible = true
      m.global.playerNotify.text = "Player X wins"
      m.global.playerWin = true '|
    else if m.global.r0c0.iconUri = "pkg:/images/whiteX.jpg" and m.global.r1c1.iconUri = "pkg:/images/whiteX.jpg" and m.global.r2c2.iconUri = "pkg:/images/whiteX.jpg" then
      m.global.diagonalWin1.visible = true
      m.global.playerNotify.text = "Player X wins"
      m.global.playerWin = true '\
    else if m.global.r0c2.iconUri = "pkg:/images/whiteX.jpg" and m.global.r1c1.iconUri = "pkg:/images/whiteX.jpg" and m.global.r2c0.iconUri = "pkg:/images/whiteX.jpg" then
      m.global.diagonalWin2.visible = true
      m.global.playerNotify.text = "Player X wins"
      m.global.playerWin = true '/
    end if
  end if

'for O player
'for each if else if statment, add a reset function after the visible function
  if m.global.xPlayer then
    if m.global.r0c0.iconUri = "pkg:/images/whiteO.jpg" and m.global.r0c1.iconUri = "pkg:/images/whiteO.jpg" and m.global.r0c2.iconUri = "pkg:/images/whiteO.jpg" then
      m.global.Horizontal_Line_Top.visible = true
      m.global.playerNotify.text = "Player O wins"
      m.global.playerWin = true   '-
    else if m.global.r1c0.iconUri = "pkg:/images/whiteO.jpg" and m.global.r1c1.iconUri = "pkg:/images/whiteO.jpg" and m.global.r1c2.iconUri = "pkg:/images/whiteO.jpg" then
      m.global.Horizontal_Line_Middle.visible = true
      m.global.playerNotify.text = "Player O wins"
      m.global.playerWin = true '-
    else if m.global.r2c0.iconUri = "pkg:/images/whiteO.jpg" and m.global.r2c1.iconUri = "pkg:/images/whiteO.jpg" and m.global.r2c2.iconUri = "pkg:/images/whiteO.jpg" then
      m.global.Horizontal_Line_Bottom.visible = true
      m.global.playerNotify.text = "Player O wins"
      m.global.playerWin = true '-
    else if m.global.r0c0.iconUri = "pkg:/images/whiteO.jpg" and m.global.r1c0.iconUri = "pkg:/images/whiteO.jpg" and m.global.r2c0.iconUri = "pkg:/images/whiteO.jpg" then
      m.global.Vertical_Line_Top.visible = true
      m.global.playerNotify.text = "Player O wins" '|
      m.global.playerWin = true
    else if m.global.r0c1.iconUri = "pkg:/images/whiteO.jpg" and m.global.r1c1.iconUri = "pkg:/images/whiteO.jpg" and m.global.r2c1.iconUri = "pkg:/images/whiteO.jpg" then
      m.global.Vertical_Line_Middle.visible = true
      m.global.playerNotify.text = "Player O wins" '|
      m.global.playerWin = true
    else if m.global.r0c2.iconUri = "pkg:/images/whiteO.jpg" and m.global.r1c2.iconUri = "pkg:/images/whiteO.jpg" and m.global.r2c2.iconUri = "pkg:/images/whiteO.jpg" then
      m.global.Vertical_Line_Bottom.visible = true
      m.global.playerNotify.text = "Player O wins" '|
      m.global.playerWin = true
    else if m.global.r0c0.iconUri = "pkg:/images/whiteO.jpg" and m.global.r1c1.iconUri = "pkg:/images/whiteO.jpg" and m.global.r2c2.iconUri = "pkg:/images/whiteO.jpg" then
      m.global.diagonalWin1.visible = true
      m.global.playerNotify.text = "Player O wins"
      m.global.playerWin = true'\
    else if m.global.r0c2.iconUri = "pkg:/images/whiteO.jpg" and m.global.r1c1.iconUri = "pkg:/images/whiteO.jpg" and m.global.r2c0.iconUri = "pkg:/images/whiteO.jpg" then
      m.global.diagonalWin2.visible = true
      m.global.playerNotify.text = "Player O wins"
      m.global.playerWin = true '/
    end if
  end if

  if m.global.r0c0.iconUri <> "pkg:/images/blank.png" and m.global.r0c1.iconUri <> "pkg:/images/blank.png" and m.global.r0c2.iconUri <> "pkg:/images/blank.png" and m.global.r1c0.iconUri <> "pkg:/images/blank.png" and m.global.r1c1.iconUri <> "pkg:/images/blank.png" and m.global.r1c2.iconUri <> "pkg:/images/blank.png" and m.global.r2c0.iconUri <> "pkg:/images/blank.png" and m.global.r2c1.iconUri <> "pkg:/images/blank.png" and m.global.r2c2.iconUri <> "pkg:/images/blank.png" then
    m.global.playerNotify.text = "It's a tie!"
    m.global.playerWin = true
  end if

  if m.global.playerWin then
    m.global.playAgain.visible = true
    m.global.playAgainPoster.visible = true
    m.global.playAgain.setFocus(true)
  end if
end function

sub onResetButtonSelected(obj)
  resetGame()
  m.global.playerWin = false
end sub

function resetGame()
  m.global.xPlayer = true
  m.global.playerNotify.text = "Player X's Turn"
  for each r in m.global.arrayButtons
    for each c in r
      c.iconUri = "pkg:/images/blank.png"
      c.focusedIconUri = "pkg:/images/blank.png"
      c.setFocus(true)
    end for
  end for

  m.global.r1c1.focusedIconUri = "pkg:/images/redX.jpg"
  m.global.r1c1.setFocus(true)
  m.global.rowIndex = 1
  m.global.colIndex = 1

  m.global.skipFirst = true

  for each item in m.global.lineArray
    item.visible = false
  end for
  m.global.playAgain.visible = false
  m.global.playAgainPoster.visible = false
end function