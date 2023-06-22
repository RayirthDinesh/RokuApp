sub init()
  ? "[tictactoe] init" ' essentially a print statment that is called only once
  m.top.backgroundURI = "pkg:/images/background.png"

  m.gamename = m.top.findNode("gamename")
  m.poster = m.top.findNode("tictactoe")

  ' diagonalWin1 = m.top.findNode("diagonalWin1")
  ' diagonalWin2 = m.top.findNode("diagonalWin2")
  ' Horizontal_Line_Top = m.top.findNode("Horizontal_Line_Top")
  ' Horizontal_Line_Middle = m.top.findNode("Horizontal_Line_Middle")
  ' Horizontal_Line_Bottom = m.top.findNode("Horizontal_Line_Bottom")
  ' Vertical_Line_Top = m.top.findNode("Vertical_Line_Top")
  ' Vertical_Line_Middle = m.top.findNode("Vertical_Line_Middle")
  ' Vertical_Line_Bottom = m.top.findNode("Vertical_Line_Bottom")

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

'  m.global.addFields({diagonalWin1: diagonalWin1})
'  m.global.addFields({diagonalWin2: diagonalWin2})
'  m.global.addFields({Horizontal_Line_Top: Horizontal_Line_Top})
'  m.global.addFields({Horizontal_Line_Middle: Horizontal_Line_Middle})
'  m.global.addFields({Horizontal_Line_Bottom: Horizontal_Line_Bottom})
'  m.global.addFields({Vertical_Line_Top: Vertical_Line_Top})
'  m.global.addFields({Vertical_Line_Middle: Vertical_Line_Middle})
'  m.global.addFields({Vertical_Line_Bottom: Vertical_Line_Bottom})

'if player is true
  m.xPlayer = true

  m.global.addFields({xPlayer: m.xPlayer})


  arrayButtonsCalled = [
    [false,false,false],
    [false,false,false],
    [false,false,false]
  ]

  ' r0c0Called = false
  ' r0c1Called = false
  ' r0c2Called = false

  ' r1c0Called = false
  ' r1c1Called = false
  ' r1c2Called = false

  ' r2c0Called = false
  ' r2c1Called = false
  ' r2c2Called = false

  rowIndex = 1
  colIndex = 1


  arrayButtons = [
    [r0c0,r0c1,r0c2],
    [r1c0,r1c1,r1c2],
    [r2c0,r2c1,r2c2]
  ]

  rightButtons = [r0c0,r1c0,r2c0,r0c1,r1c1,r2c1]
  leftButtons = [r0c2,r1c2,r2c2,r0c1,r1c1,r2c1]
  upButtons = [r2c0,r2c1,r2c2,r1c0,r1c1,r1c2]
  downButtons = [r0c0,r0c1,r0c2,r1c0,r1c1,r1c2]

  ' m.global.addFields({r0c0Called: r0c0Called})
  ' m.global.addFields({r0c1Called: r0c1Called})
  ' m.global.addFields({r0c2Called: r0c2Called})

  ' m.global.addFields({r1c0Called: r1c0Called})
  ' m.global.addFields({r1c1Called: r1c1Called})
  ' m.global.addFields({r1c2Called: r1c2Called})

  ' m.global.addFields({r2c0Called: r2c0Called})
  ' m.global.addFields({r2c1Called: r2c1Called})
  ' m.global.addFields({r2c2Called: r2c2Called})

  m.global.addFields({arrayButtonsCalled : arrayButtonsCalled})
  m.global.addFields({arrayButtons : arrayButtons})
  m.global.addFields({rowIndex : rowIndex})
  m.global.addFields({colIndex : colIndex})
  m.global.addFields({rightButtons : rightButtons})
  m.global.addFields({leftButtons : leftButtons})
  m.global.addfields({upButtons : upButtons})
  m.global.addFields({downButtons : downButtons})

  r1c1.setFocus(true) 'setfocus starts at the middle grid
end sub

sub onButtonSelected()
  ? "[tictactoe] onButtonSelected"

end sub

function checkinList(list, button) as Boolean
  for each item in list
    if item.isSameNode(button) then
      return true
    end if
  end for
  return false
end function

function test() as Boolean
  ? "[tictactoe] test"
  return false
end function


'function
'deals with the different types of presses and when the user moves to different buttons and hover

'followingconditionals will also deal with how a user will move to different grids, then what happens if they do
function onKeyEvent(key, press) as Boolean
  ? "[tictactoe] onKeyEvent" key, press
  if press then
    if key = "right" then
      if checkinList(m.global.rightButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
        m.global.colIndex = m.global.colIndex + 1
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
      end if
    else if key = "up" then
      if checkinList(m.global.upButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
        m.global.rowIndex = m.global.rowIndex - 1
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
      end if
    else if key = "down" then
      if checkinList(m.global.downButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
        m.global.rowIndex = m.global.rowIndex + 1
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
      end if
    else if key = "left" then
      if checkinList(m.global.leftButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
        m.global.colIndex = m.global.colIndex - 1
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
      end if
    end if
  else
    if key = "OK" then
      if not m.global.arrayButtonsCalled[m.global.rowIndex][m.global.colIndex] then
        if m.global.xPlayer then
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
          m.global.playerNotify.text = "Player O's Turn"
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/O.jpg"
        else
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
          m.global.playerNotify.text = "Player X's Turn"
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/X.jpg"
        end if
        m.global.arrayButtonsCalled[m.global.rowIndex][m.global.colIndex] = true
      end if
    end if
  end if
end function