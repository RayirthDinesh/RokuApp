sub init()
  ? "[tictactoe] init" ' essentially a print statment that is called only once
  m.top.backgroundURI = "https://sthsroku.net/team666/tictactoe/background.png"
  m.gamename = m.top.findNode("gamename")
  m.poster = m.top.findNode("tictactoe")
  ' m.playerNotify = m.top.findNode("playerNotify")
  ' m.global.addFields({playerNotify: m.playerNotify})
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

  lineArray = [Horizontal_Line_Top, Horizontal_Line_Middle, Horizontal_Line_Bottom, Vertical_Line_Top, Vertical_Line_Middle, Vertical_Line_Bottom, diagonalWin1, diagonalWin2]
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

  arrayButtons = [[r0c0, r0c1, r0c2], 
                  [r1c0, r1c1, r1c2], 
                  [r2c0, r2c1, r2c2]]
  listButtons = [r0c0, r0c1, r0c2, r1c0, r1c1, r1c2, r2c0, r2c1, r2c2]
  victoryCombos = [[r0c0, r0c1, r0c2], [r1c0, r1c1, r1c2], [r2c0, r2c1, r2c2], [r0c0, r1c0, r2c0], [r0c1, r1c1, r2c1], [r0c2, r1c2, r2c2], [r0c0, r1c1, r2c2], [r0c2, r1c1, r2c0]]
  rightButtons = [r0c0, r1c0, r2c0, r0c1, r1c1, r2c1]
  leftButtons = [r0c2, r1c2, r2c2, r0c1, r1c1, r2c1]
  upButtons = [r2c0, r2c1, r2c2, r1c0, r1c1, r1c2]
  downButtons = [r0c0, r0c1, r0c2, r1c0, r1c1, r1c2]

  m.global.addFields({arrayButtons : arrayButtons})
  m.global.addFields({victorycombos : victorycombos})
  m.global.addFields({listButtons : listButtons})
  m.global.addFields({rightButtons : rightButtons})
  m.global.addFields({leftButtons : leftButtons})
  m.global.addFields({upButtons : upButtons})
  m.global.addFields({downButtons : downButtons})
  m.global.addFields({leftButtons : leftButtons})

  easyOptionRandomCol = 0
  easyOptionRandomRow = 0

  m.global.addFields({easyOptionRandomRow : easyOptionRandomRow})
  m.global.addFields({easyOptionRandomCol : easyOptionRandomCol})

  easy = m.top.findNode("easy")
  medium = m.top.findNode("medium")
  ' hard = m.top.findNode("hard")

  level = easy

  m.global.addFields({easy : easy})
  m.global.addFields({medium : medium})
  ' m.global.addFields({hard : hard})
  m.global.addFields({level : level})

  rowIndex = 1
  colIndex = 1
  m.global.addFields({rowIndex : rowIndex})
  m.global.addFields({colIndex : colIndex})


  xPlayer = true
  m.global.addFields({xPlayer : xPlayer})
   'set focus starts at the middle grid

  Player = m.top.findNode("Player")
  Computer = m.top.findNode("Computer")
  state = 1
  option = Computer
  m.global.addFields({state : state})
  m.global.addFields({option : option})
  m.global.addFields({Player : Player})
  m.global.addFields({Computer : Computer})

  Player.observeField("buttonSelected", "playerOptionButton")
  Computer.observeField("buttonSelected", "computerOptionButton")
  easy.observeField("buttonSelected", "easyOptionButton")
  medium.observeField("buttonSelected", "mediumOptionButton")
  ' hard.observeField("buttonSelected", "hardOptionButton")

  computerWinListX = []
  computerWinListO = []
  computerPairFinderList = []
  m.global.addFields({computerWinListX : computerWinListX})
  m.global.addFields({computerWinListO : computerWinListO})
  m.global.addFields({computerPairFinderList : computerPairFinderList})

  Computer.setFocus(true)
  ' r1c1.setFocus(true)
end sub

function checkinList(list, button) as Boolean
  for each item in list
    if item.isSameNode(button) then
      return true
    end if
  end for
  return false
end function

function playerOptionButton(obj)
  m.global.option = m.global.Player
  m.global.r1c1.setFocus(true)
end function

function computerOptionButton(obj)
  m.global.Player.visible = false
  m.global.option = m.global.Computer
  m.global.easy.visible = true
  m.global.medium.visible = true
  ' m.global.hard.visible = true
  m.global.easy.setFocus(true)
end function

function easyOptionButton(obj)
  m.global.level = m.global.easy
  m.global.state = 3
  m.global.r1c1.setFocus(true)
end function

function mediumOptionButton(obj)
  m.global.level = m.global.medium
  m.global.state = 3
  m.global.r1c1.setFocus(true)
end function

' function hardOptionButton(obj)
'   m.global.level = m.global.hard
'   m.global.state = 3
'   m.global.r1c1.setFocus(true)
' end function

'Computer Movement Functions
function easyModeComputer()
  m.global.easyOptionRandomRow = Fix(rnd(0) * 3)
  m.global.easyOptionRandomCol = Fix(rnd(0) * 3)
  while m.global.arrayButtons[m.global.easyOptionRandomRow][m.global.easyOptionRandomCol].iconUri <> "https://sthsroku.net/team666/tictactoe/blank.png"
    m.global.easyOptionRandomRow = Fix(rnd(0) * 3)
    m.global.easyOptionRandomCol = Fix(rnd(0) * 3)
  end while
  m.global.xPlayer = false
  m.global.arrayButtons[m.global.easyOptionRandomRow][m.global.easyOptionRandomCol].iconUri = "https://sthsroku.net/team666/tictactoe/whiteX.jpg"
  m.global.state = 4
end function

function mediumModeComputer()
  searchForWin()
  if m.global.computerWinListX.Count() <> 0 then
    m.global.computerWinListX[0].iconUri = "https://sthsroku.net/team666/tictactoe/whiteX.jpg"
  else if m.global.computerWinListO.Count() <> 0 then
    m.global.computerWinListO[0].iconUri = "https://sthsroku.net/team666/tictactoe/whiteX.jpg"
  else
    m.global.easyOptionRandomRow = Fix(rnd(0) * 3)
    m.global.easyOptionRandomCol = Fix(rnd(0) * 3)
    while m.global.arrayButtons[m.global.easyOptionRandomRow][m.global.easyOptionRandomCol].iconUri <> "https://sthsroku.net/team666/tictactoe/blank.png"
      m.global.easyOptionRandomRow = Fix(rnd(0) * 3)
      m.global.easyOptionRandomCol = Fix(rnd(0) * 3)
    end while
  end if
    m.global.arrayButtons[m.global.easyOptionRandomRow][m.global.easyOptionRandomCol].iconUri = "https://sthsroku.net/team666/tictactoe/whiteX.jpg"
  m.global.xPlayer = false
  m.global.state = 4
end function

'Computer Win Functions
function searchForWin()
  m.global.computerWinListX.clear()
  m.global.computerWinListO.clear()
  tempComputerWinListX = []
  tempComputerWinListO = []
  countX = 0
  countO = 0
  for each combo in m.global.victorycombos
    for each item in combo
      if item.iconUri = "https://sthsroku.net/team666/tictactoe/whiteX.jpg" then
        countX = countX + 1
      end if
      if item.iconUri = "https://sthsroku.net/team666/tictactoe/whiteO.jpg" then
        countO = countO + 1
      end if
    end for
      for each item in combo
        if countX = 2 then
          if item.iconUri = "https://sthsroku.net/team666/tictactoe/blank.png" then
            tempComputerWinListX.push(item)

          end if
          else if countO = 2
            if item.iconUri = "https://sthsroku.net/team666/tictactoe/blank.png" then
              tempComputerWinListO.push(item)
            end if
          end if
      end for
  end for
  m.global.setFields({computerWinListX : tempComputerWinListX})
  m.global.setFields({computerWinListO : tempComputerWinListO})
end function

'function deals with the different types of presses and when the user moves to different buttons and hover following conditionals will also deal with how a user will move to different grids, then what happens if they do
function onKeyEvent(key, press) as Boolean
  if m.global.state = 1 and not m.global.skipFirst then
    if key = "down" and press then
      m.global.Player.setFocus(true)
    else if key = "up" and press then
      m.global.Computer.setFocus(true)
    else if key = "OK" and not press then
      m.global.state = 2
    end if
  else if m.global.skipFirst then
    m.global.skipFirst = false
  else if m.global.state = 2 then
    if m.global.option.isSameNode(m.global.Computer) then
      if key = "down" and press and m.global.easy.hasFocus() then
        m.global.medium.setFocus(true)
      else if key = "up" and press and m.global.medium.hasFocus() then
        m.global.easy.setFocus(true)
      ' else if key = "down" and press and m.global.medium.hasFocus() then
      '   m.global.hard.setFocus(true)
      ' else if key = "up" and press and m.global.hard.hasFocus() then
      '   m.global.medium.setFocus(true)
      end if
    else
      m.global.state = 4
    end if
  else if m.global.state = 3 then
    if m.global.xPlayer then
      if m.global.level.isSameNode(m.global.easy)  then
        easyModeComputer()
      else if m.global.level.isSameNode(m.global.medium) then
        mediumModeComputer()
      end if
      winGame()
    end if
  else if not m.global.playerWin and m.global.state = 4 then
    if press then
      if key = "right" then
        if checkinList(m.global.rightButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
          m.global.colIndex = m.global.colIndex + 1
        end if
      else if key = "up" then
        if checkinList(m.global.upButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
          m.global.rowIndex = m.global.rowIndex - 1
        end if
      else if key = "down" then
        if checkinList(m.global.downButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
          m.global.rowIndex = m.global.rowIndex + 1
        end if
      else if key = "left" then
        if checkinList(m.global.leftButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
          m.global.colIndex = m.global.colIndex - 1
        end if
      end if
      if m.global.xPlayer and m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "https://sthsroku.net/team666/tictactoe/blank.png" then
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "https://sthsroku.net/team666/tictactoe/redX.jpg"
      else if (not m.global.xPlayer) and m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "https://sthsroku.net/team666/tictactoe/blank.png" then
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "https://sthsroku.net/team666/tictactoe/redO.jpg"
      end if
      m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
    else
      if key = "OK" then
        if m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "https://sthsroku.net/team666/tictactoe/blank.png" then
          if m.global.xPlayer and m.global.option.isSameNode(m.global.Player) then
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "https://sthsroku.net/team666/tictactoe/whiteX.jpg"
            m.global.xPlayer = false
            ' m.global.playerNotify.text = "Player O's Turn"
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "https://sthsroku.net/team666/tictactoe/redX.jpg"
            winGame()
          else
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "https://sthsroku.net/team666/tictactoe/whiteO.jpg"
            m.global.xPlayer = true
            ' m.global.playerNotify.text = "Player X's Turn"
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "https://sthsroku.net/team666/tictactoe/redO.jpg"
            winGame()
            if not m.global.playerWin and m.global.option.isSameNode(m.global.Computer) then
              m.global.state = 3
            end if
          end if
        end if
      end if
    end if
  end if
end function

function winGame()
  tempCounter = 0
  for each row in m.global.victoryCombos
    tempXCount = 0
    tempOCount = 0
    for each col in row
      if col.iconUri = "https://sthsroku.net/team666/tictactoe/whiteX.jpg" then
        tempXCount = tempXCount + 1
      else if col.iconUri = "https://sthsroku.net/team666/tictactoe/whiteO.jpg" then
        tempOCount = tempOCount + 1
      end if
    end for
    if tempXCount = 3 or tempOCount = 3 then
      m.global.playerWin = true
      m.global.lineArray[tempCounter].visible = true
    end if
    if tempXCount = 3 then
      ' m.global.playerNotify.text = "Player X wins"
      exit for
    else if tempOCount = 3 then
      ' m.global.playerNotify.text = "Player O wins"
      exit for
    end if
    if m.global.playerWin then
      exit for
    end if
    tempCounter = tempCounter + 1
  end for
  checkTie()
  if m.global.playerWin then
    m.global.playAgain.visible = true
    m.global.playAgainPoster.visible = true
    m.global.playAgain.setFocus(true)
  end if
end function

sub checkTie()
  for each row in m.global.arrayButtons
    for each col in row
      if col.iconUri = "https://sthsroku.net/team666/tictactoe/blank.png" then
        return
      end if
    end for
  end for
  ' m.global.playerNotify.text = "It's a tie!"
  m.global.playerWin = true
end sub

sub onResetButtonSelected(obj)
  resetGame()
  m.global.playerWin = false
end sub

function resetGame()
  m.global.xPlayer = true
  ' m.global.playerNotify.text = "Player X's Turn"
  for each r in m.global.arrayButtons
    for each c in r
      c.iconUri = "https://sthsroku.net/team666/tictactoe/blank.png"
      c.focusedIconUri = "https://sthsroku.net/team666/tictactoe/blank.png"
      c.setFocus(true)
    end for
  end for

  m.global.r1c1.focusedIconUri = "https://sthsroku.net/team666/tictactoe/redX.jpg"
  m.global.rowIndex = 1
  m.global.colIndex = 1
  m.global.easy.visible = false
  m.global.medium.visible = false
  ' m.global.hard.visible = false
  m.global.Player.visible = true
  m.global.skipFirst = true
  m.global.state = 1
  m.global.Computer.setFocus(true)

  for each item in m.global.lineArray
    item.visible = false
  end for
  m.global.playAgain.visible = false
  m.global.playAgainPoster.visible = false
end function