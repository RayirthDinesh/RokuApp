sub init()
  ? "[tictactoe] init" ' essentially a print statement that is called only once
  m.top.backgroundURI = "pkg:/images/background.png"
  m.gamename = m.top.findNode("gamename")
  m.poster = m.top.findNode("tictactoe")
  m.playerNotify = m.top.findNode("playerNotify")

  ' variables that we call from XML and we want to edit
  r0c0 = m.top.findNode("r0c0")
  r0c1 = m.top.findNode("r0c1")
  r0c2 = m.top.findNode("r0c2")
  r1c0 = m.top.findNode("r1c0")
  r1c1 = m.top.findNode("r1c1")
  r1c2 = m.top.findNode("r1c2")
  r2c0 = m.top.findNode("r2c0")
  r2c1 = m.top.findNode("r2c1")
  r2c2 = m.top.findNode("r2c2")
  Player = m.top.findNode("Player")
  Computer = m.top.findNode("Computer")
  easy = m.top.findNode("easy")
  medium = m.top.findNode("medium")
  hard = m.top.findNode("hard")

  'default variables

  state = 1
  option = Computer
  level = easy
  xPlayer = true
  optionfocus = easy


  easyOptionRandomCol = 0
  easyOptionRandomRow = 0
  indexRemove = 0

  'index variables

  rowIndex = 1
  colIndex = 1

  'button lists

  arrayButtons = [[r0c0, r0c1, r0c2], [r1c0, r1c1, r1c2], [r2c0, r2c1, r2c2]]
  listButtons = [r0c0, r0c1, r0c2, r1c0, r1c1, r1c2, r2c0, r2c1, r2c2]
  victorycombos = [[r0c0, r0c1, r0c2], [r1c0, r1c1, r1c2], [r2c0, r2c1, r2c2], [r0c0, r1c0, r2c0], [r0c1, r1c1, r2c1], [r2c0, r2c1, r2c2], [r0c0, r1c1, r2c2], [r0c2, r1c1, r2c0]]
  rightButtons = [r0c0, r1c0, r2c0, r0c1, r1c1, r2c1]
  leftButtons = [r0c2, r1c2, r2c2, r0c1, r1c1, r2c1]
  upButtons = [r2c0, r2c1, r2c2, r1c0, r1c1, r1c2]
  downButtons = [r0c0, r0c1, r0c2, r1c0, r1c1, r1c2]

  ' Computer Win Lists
  computerWinListX = []
  computerWinListO = []
  computerPairFinderList = []

  ' makes the functions global

  m.global.addFields({listButtons : listButtons})
  m.global.addFields({rightButtons : rightButtons})
  m.global.addFields({leftButtons : leftButtons})
  m.global.addFields({upButtons : upButtons})
  m.global.addFields({downButtons : downButtons})
  m.global.addFields({leftButtons : leftButtons})
  m.global.addFields({level : level })
  m.global.addFields({easyOptionRandomRow : easyOptionRandomRow})
  m.global.addFields({easyOptionRandomCol : easyOptionRandomCol})
  m.global.addFields({arrayButtons : arrayButtons})
  m.global.addFields({victorycombos : victorycombos})

  m.global.addFields({rowIndex : rowIndex })
  m.global.addFields({colIndex : colIndex })

  m.global.addFields({r0c0 : r0c0 })
  m.global.addFields({r0c1 : r0c1 })
  m.global.addFields({r0c2 : r0c2 })
  m.global.addFields({r1c0 : r1c0 })
  m.global.addFields({r1c1 : r1c1 })
  m.global.addFields({r1c2 : r1c2 })
  m.global.addFields({r2c0 : r2c0 })
  m.global.addFields({r2c1 : r2c1 })
  m.global.addFields({r2c2 : r2c2 })

  m.global.addFields({state : state})
  m.global.addFields({option : option})

  m.global.addFields({Player : Player})
  m.global.addFields({Computer : Computer})

  m.global.addFields({easy : easy})
  m.global.addFields({medium : medium})
  m.global.addFields({hard : hard})

  m.global.addFields({playerNotify : m.playerNotify})

  m.global.addFields({xPlayer : xPlayer})

  m.global.addFields({computerWinListX : computerWinListX})
  m.global.addFields({computerWinListO : computerWinListO})
  m.global.addFields({computerPairFinderList : computerPairFinderList})

  m.global.addFields({indexRemove : indexRemove})

  m.global.addFields({optionfocus : optionfocus})

  Player.observeField("buttonSelected", "playerOptionButton")
  Computer.observeField("buttonSelected", "computerOptionButton")
  easy.observeField("buttonSelected", "easyOptionButton")
  medium.observeField("buttonSelected", "mediumOptionButton")
  hard.observeField("buttonSelected", "hardOptionButton")

  Computer.setFocus(true)
end sub

'Button Observe Functions
function playerOptionButton(obj)
  m.global.option = m.global.Player
  m.global.r1c1.setFocus(true)
end function

function computerOptionButton(obj)
  m.global.Player.visible = false
  m.global.option = m.global.Computer
  m.global.easy.visible = true
  m.global.medium.visible = true
  m.global.hard.visible = true
  m.global.easy.setFocus(true)
end function

function easyOptionButton(obj)
  m.global.level = m.global.easy
  m.global.state = 3
  m.global.r1c1.setFocus(true)
end function

function hardOptionButton(obj)
  m.global.level = m.global.hard
  m.global.state = 3
  m.global.r1c1.setFocus(true)
end function

function mediumOptionButton(obj)
  m.global.level = m.global.medium
  m.global.state = 3
  m.global.r1c1.setFocus(true)
end function

'Computer Movement Functions
function easyModeComputer()
  m.global.easyOptionRandomRow = Fix(rnd(3))
  m.global.easyOptionRandomCol = Fix(rnd(3))
  while m.global.arrayButtons[m.global.easyOptionRandomRow][m.global.easyOptionRandomCol].iconUri <> "pkg:/images/blank.png"
    m.global.easyOptionRandomRow = Fix(rnd(3))
    m.global.easyOptionRandomCol = Fix(rnd(3))
  end while
  m.global.xPlayer = false
  m.global.arrayButtons[m.global.easyOptionRandomRow][m.global.easyOptionRandomCol].iconUri = "pkg:/images/whiteX.jpg"
  m.global.state = 4
end function

' function mediumModeComputer()
'   indexRemove = indexRemove + 1
'   m.global.playerNotify.text = "Test 123"
'   computerPairFinder()
'   if searchForWin("X") then
'     m.global.computerWinListX[0].iconUri = "pkg:/images/whiteX.jpg"
'   else if searchForWin("O") then
'     m.global.computerWinListO[0].iconUri = "pkg:/images/whiteX.jpg"
'   else
'     m.global.computerPairFinderList[0].iconUri = "pkg:/images/whiteX.jpg"
'     m.global.computerPairFinderList.removeIndex(indexRemove)
'   end if
'   m.global.state = 4
' end function
' 'Computer Win Functions

' function searchForWin(player)
'   for each combo in m.global.victorycombos
'     countX = 0
'     countO = 0
'     for each item in combo
'       if item.iconUri = "pkg:/images/whiteX.jpg" then
'         countX = countX + 1
'       end if
'       if item.iconUri = "pkg:/images/whiteO.jpg" then
'         countO = countO + 1
'       end if
'     end for
'     if countX = 2 then
'       for each item in combo
'         if not item.iconUri = "pkg:/images/whiteX.jpg" then
'           m.global.computerWinList.append(item)
'           return true
'         else if not item.iconUri = "pkg:/images/whiteO.jpg" then
'           m.global.computerWinList.append(item)
'           return true
'         end if
'       end for
'     end if
'   end for
' end function

' function computerPairFinder()
'   for each combo in m.global.victorycombos
'     countX = 0
'     for each item in combo
'       if item.iconUri = "pkg:/images/whiteX.jpg" then
'         countX = countX + 1
'       end if
'     end for
'     if countX = 1 then
'       for each item in combo
'         if not item.iconUri = "pkg:/images/whiteX.jpg" then
'           m.global.computerPairFinder.append(item)
'           return m.global.computerPairFinder
'         end if
'       end for
'     end if
'   end for
' end function

'Check if argument is in list
function checkInList(list, button) as boolean
  for each item in list
    if item.isSameNode(button) then
      return true
    end if
  end for
  return false
end function

'function deals with the different types of presses and when the user moves to different buttons and hover following conditionals will also deal with how a user will move to different grids, then what happens if they do
function onKeyEvent(key as string, press as boolean)
  ?"[tictactoe] onKeyEvent" key, press
  if m.global.state = 1 then
    if key = "down" and press then
      m.global.Player.setFocus(true)
    else if key = "up" and press then
      m.global.Computer.setFocus(true)
    else if key = "OK" and not press then
      m.global.state = 2
    end if
  'State 2 is where the user chooses between easy, medium, or hard (If they chose computer vs player)
  else if m.global.state = 2 then
    if m.global.option.isSameNode(m.global.Computer) then
      if key = "down" and press and m.global.easy.hasFocus() then
        m.global.medium.setFocus(true)
      else if key = "up" and press and m.global.medium.hasFocus() then
        m.global.easy.setFocus(true)
      else if key = "down" and press and m.global.medium.hasFocus() then
        m.global.hard.setFocus(true)
      else if key = "up" and press and m.global.hard.hasFocus() then
        m.global.medium.setFocus(true)
      end if
    else
      m.global.state = 4
    end if
  'State 3 is where the user plays the game
  else if m.global.state = 3 then
    if m.global.xPlayer then
      if m.global.level.isSameNode(m.global.easy) then
        easyModeComputer()
        m.global.playerNotify.text = "Computer Made Move"
      end if
    end if
  else if m.global.state = 4 then
    if press then
      m.global.playerNotify.text = "Player hasn't made move"
      if key = "right" then
        if checkInList(m.global.rightButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex]) then
          m.global.colIndex = m.global.colIndex + 1
        end if
      else if key = "up" then
        if checkInList(m.global.upButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex]) then
          m.global.rowIndex = m.global.rowIndex - 1
        end if
      else if key = "down" then
        if checkInList(m.global.downButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex]) then
          m.global.rowIndex = m.global.rowIndex + 1
        end if
      else if key = "left" then
        if checkInList(m.global.leftButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex]) then
          m.global.colIndex = m.global.colIndex - 1
        end if
      end if
      if m.global.xPlayer and m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/blank.png" then
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redX.jpg"
      else if not m.global.xPlayer and m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/blank.png" then
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redO.jpg"
      end if
      m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
    else
      if key = "OK" then
        if m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/blank.png" then
          if m.global.xPlayer and m.global.option.isSameNode(m.global.Player) then
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/whiteX.jpg"
            m.global.xPlayer = false
            m.global.playerNotify.text = "Player X's Turn"
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redX.jpg"
          else
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/whiteO.jpg"
            m.global.xPlayer = true
            m.global.playerNotify.text = "Player O's Turn"
            m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redO.jpg"  
            if m.global.option.isSameNode(m.global.Computer) then
              m.global.state = 3
            end if
          end if
        end if
      end if
    end if
  end if
end function