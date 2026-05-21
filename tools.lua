-----------------------------
-- DonatorFix
-- Autor: LoboLupus
-- Projeto criado para NTO Ultimate
-- Edited by: LoboLupus
-----------------------------
-- tools tab
setDefaultTab("Hotkeys")

 local scriptsPanelName = "Scriptss"
  local ui = setupUI([[
Panel

  height: 25

  Button
    id: editScript
    color: pink
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 25
    text: - SCRIPTS -


  ]], parent)
  ui:setId(scriptsPanelName)

  if not storage[scriptsPanelName] then
    storage[scriptsPanelName] = { 

    }
  end


rootWidget = g_ui.getRootWidget()
if rootWidget then
    ScriptWindow = UI.createWindow('ScriptsWindow', rootWidget)
    ScriptWindow:hide()
    TabBar = ScriptWindow.tmpTabBar
    TabBar:setContentWidget(ScriptWindow.tmpTabContent)
    for v = 1, 1 do


scpPanel = g_ui.createWidget("sPanel") -- Creates Panel
scpPanel:setId("panelButtons") -- sets ID

scpPanel2 = g_ui.createWidget("sPanel") -- Creates Panel
scpPanel2:setId("panelButtons") -- sets ID

scpPanel3 = g_ui.createWidget("sPanel") -- Creates Panel
scpPanel:setId("panelButtons") -- sets ID

scpPanel4 = g_ui.createWidget("sPanel") -- Creates Panel
scpPanel:setId("panelButtons") -- sets ID

scpPanel5 = g_ui.createWidget("sPanel") -- Creates Panel
scpPanel:setId("panelButtons") -- sets ID

TabBar:addTab("Script", scpPanel)
                cor= UI.Label("Scripts:\nEdited by:@LoboLupus",scpPanel)
cor:setColor("orange")


TabBar:addTab("Summon", scpPanel4)
        cor= UI.Label("Summon:\nEdited by:@LoboLupus",scpPanel4)
cor:setColor("orange")
        UI.Separator(scpPanel4)

TabBar:addTab("Treinar", scpPanel5)
        cor= UI.Label("Treino:\nEdited by:@LoboLupus",scpPanel5)
cor:setColor("orange")
        UI.Separator(scpPanel5)

        UI.Separator(scpPanel5)

if type(storage.manatrainer) ~= "table" then
  storage.manatrainer = {on=false, title="mana%", text="chakradown", min=0, max=90}
end

for _, healingInfos in ipairs({storage.manatrainer}) do
  local healingmacro = macro(100, function()
    local mana = manapercent()
    if healingInfos.max <= mana and mana >= healingInfos.min then
      if TargetBot then 
        TargetBot.saySpell(healingInfos.text) -- sync spell with targetbot if available
      else
        say(healingInfos.text)
      end
    end
  end,scpPanel5)
  healingmacro.setOn(healingInfos.on)

  UI.DualScrollPanel(healingInfos, function(widget, newParams) 
    healingInfos = newParams
    healingmacro.setOn(healingInfos.on)
  end,scpPanel5)
end 

macro(2000, "Dance", function()
    turn(math.random(0, 3))
end,scpPanel5)

macro(200, "Auto Treinar", function()
    if treinar ~= true then
        treinar = true
        yell("!treinar")
    end
end,scpPanel5)
-----------------------------
-- Edited by: LoboLupus
local secondsToIdle = 5
local activeFPS = 60

local afkFPS = 0

local function isSameMousePos(p1, p2)
  return p1.x == p2.x and p1.y == p2.y
end

local function setAfk()
  modules.client_options.setOption("backgroundFrameRate", afkFPS)
  modules.game_interface.gameMapPanel:hide()
end

local function setActive()
  modules.client_options.setOption("backgroundFrameRate", activeFPS)
  modules.game_interface.gameMapPanel:show()
end

local lastMousePos = nil
local finalMousePos = nil
local idleCount = 0
local maxIdle = secondsToIdle * 4
macro(250, "Idle Mode", function()
  local currentMousePos = g_window.getMousePosition()

  if finalMousePos then
    if isSameMousePos(finalMousePos, currentMousePos) then return end
    setActive()
    finalMousePos = nil
  end

  if lastMousePos and isSameMousePos(lastMousePos, currentMousePos) then
    idleCount = idleCount + 1
  else
    lastMousePos = currentMousePos
    idleCount = 0
  end

  if idleCount == maxIdle then
    setAfk()
    finalMousePos = currentMousePos
    idleCount = 0
  end
end,scpPanel5)

        UI.Separator(scpPanel5)

local showhp = macro(20000, "Monstro Vida %", function() end,scpPanel)
onCreatureHealthPercentChange(function(creature, healthPercent)
    if showhp:isOff() then  return end
    if creature:isMonster() or creature:isPlayer() and creature:getPosition() and pos() then
        if getDistanceBetween(pos(), creature:getPosition()) <= 5 then
            creature:setText(healthPercent .. "%")
        else
            creature:clearText()
  

      end
    end
end,scpPanel)

local moneyIds = {3031, 3035} -- gold coin, platinium coin
macro(1000, "Converter Dinheiro", function()
  local containers = g_game.getContainers()
  for index, container in pairs(containers) do
    if not container.lootContainer then -- ignore monster containers
      for i, item in ipairs(container:getItems()) do
        if item:getCount() == 100 then
          for m, moneyId in ipairs(moneyIds) do
            if item:getId() == moneyId then
              return g_game.use(item)            
            end
          end
        end
      end
    end
  end
end,scpPanel)

atkLowhp = macro(200, "Atacar Monstros", function() 
  local battlelist = getSpectators();
  local closest = 10
  local lowesthpc = 101
  for key, val in pairs(battlelist) do
    if val:isMonster() and not val:isPlayer() and not val:isNpc() 
and val:getName():lower() ~= 'emberwing'
and val:getName():lower() ~= 'grovebeast' 
and val:getName():lower() ~= 'skullfrost'
and val:getName():lower() ~= 'thundergiant'
and val:getName():lower() ~= 'zodom'
and val:getName():lower() ~= 'blade' then
      if getDistanceBetween(player:getPosition(), val:getPosition()) <= closest then
        closest = getDistanceBetween(player:getPosition(), val:getPosition())
        if val:getHealthPercent() < lowesthpc then
          lowesthpc = val:getHealthPercent()
        end
      end
    end
  end   for key, val in pairs(battlelist) do
    if val:isMonster() and not val:isPlayer() and not val:isNpc() 
and val:getName():lower() ~= 'emberwing'
and val:getName():lower() ~= 'grovebeast' 
and val:getName():lower() ~= 'skullfrost'
and val:getName():lower() ~= 'thundergiant'
and val:getName():lower() ~= 'zodom'
and val:getName():lower() ~= 'blade' then
      if getDistanceBetween(player:getPosition(), val:getPosition()) <= closest then
        if g_game.getAttackingCreature() ~= val and val:getHealthPercent() <= lowesthpc then
          g_game.attack(val)
          break
        end
      end
    end
  end
end,scpPanel)

    end
end

  ScriptWindow.closeButton.onClick = function(widget)
    ScriptWindow:hide()
  end  
ui.editScript.onClick = function(widget)
    ScriptWindow:show()
    ScriptWindow:raise()
    ScriptWindow:focus()
  end

UI.Separator(scpPanel3)

-- ====== OUTFITS EDITÁVEIS (mude aqui) ======
local ICON_OUTFIT_COMBO   = { mount=849, feet=10, legs=10, body=178, type=350, auxType=0, addons=3, head=48 }
local ICON_OUTFIT_UP      = { mount=849, feet=10, legs=10, body=178, type=351, auxType=0, addons=3, head=48 }
local ICON_OUTFIT_COMBO2  = { mount=849, feet=10, legs=10, body=178, type=292, auxType=0, addons=3, head=48 }
-- ===========================================

local comboPanelName = "listt"
local ui = setupUI([[
Panel
  height: 25

  Button
    id: editCombo
    color: orange
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 25
    text: - COMBO -
]], parent)
ui:setId(comboPanelName)

if not storage[comboPanelName] then
  storage[comboPanelName] = { }
end

rootWidget = g_ui.getRootWidget()
if rootWidget then
  CombosWindow = UI.createWidget('cmbComboWindow', rootWidget)
  CombosWindow:hide()
  TabBar2 = CombosWindow.cmbTabBar
  TabBar2:setContentWidget(CombosWindow.cmbImagem)
  for v = 1, 1 do

    cmbPanel = g_ui.createWidget("cPanel") -- Creates Panel
    cmbPanel:setId("panelButtons") -- sets ID

    cmbPanel2 = g_ui.createWidget("cPanel") -- Creates Panel
    cmbPanel2:setId("panelUP") -- sets ID

    cmbPanel3 = g_ui.createWidget("cPanel") -- Creates Panel
    cmbPanel3:setId("panelButtons3") -- sets ID (corrigido)

    cmbPanel4 = g_ui.createWidget("cPanel") -- Creates Panel
    cmbPanel4:setId("panelButtons4") -- sets ID (corrigido)

    -- ===== TAB: COMBO =====
    TabBar2:addTab("Combo", cmbPanel)
    color = UI.Label("by: @LoboLupus", cmbPanel)
    color:setColor("orange")
    UI.Separator(cmbPanel)

    Comboss = macro(100, "Combo", function()
      if g_game.isAttacking() then
        say(storage.ComboText)
        say(storage.Combo1Text)
        say(storage.Combo2Text)
        say(storage.Combo3Text)
        say(storage.Combo4Text)
        say(storage.Combo55Text)
        say(storage.Combo6Text)
        say(storage.Combo7Text)
        say(storage.Combo8Text)
        say(storage.Combo9Text)
        say(storage.Combo10Text)
        say(storage.Combo11Text)
      end
    end, cmbPanel)

    addTextEdit("ComboText", storage.ComboText or "magia 1", function(widget, text) storage.ComboText = text end, cmbPanel)
    addTextEdit("Combo1Text", storage.Combo1Text or "magia 2", function(widget, text) storage.Combo1Text = text end, cmbPanel)
    addTextEdit("Combo2Text", storage.Combo2Text or "magia 3", function(widget, text) storage.Combo2Text = text end, cmbPanel)
    addTextEdit("Combo3Text", storage.Combo3Text or "magia 4", function(widget, text) storage.Combo3Text = text end, cmbPanel)
    addTextEdit("Combo4Text", storage.Combo4Text or "magia 5", function(widget, text) storage.Combo4Text = text end, cmbPanel)
    addTextEdit("Combo55Text", storage.Combo55Text or "magia 6", function(widget, text) storage.Combo55Text = text end, cmbPanel)
    addTextEdit("Combo6Text", storage.Combo6Text or "magia 7", function(widget, text) storage.Combo6Text = text end, cmbPanel)
    addTextEdit("Combo7Text", storage.Combo7Text or "magia 8", function(widget, text) storage.Combo7Text = text end, cmbPanel)
    addTextEdit("Combo8Text", storage.Combo8Text or "magia 9", function(widget, text) storage.Combo8Text = text end, cmbPanel)
    addTextEdit("Combo9Text", storage.Combo9Text or "magia 10", function(widget, text) storage.Combo9Text = text end, cmbPanel)
    addTextEdit("Combo10Text", storage.Combo10Text or "magia 11", function(widget, text) storage.Combo10Text = text end, cmbPanel)
    addTextEdit("Combo11Text", storage.Combo11Text or "magia 12", function(widget, text) storage.Combo11Text = text end, cmbPanel)

    -- ===== TAB: COMBO UP (mesma lógica do COMBO) =====
    TabBar2:addTab("Combo UP", cmbPanel2)
    color = UI.Label("by: @LoboLupus", cmbPanel2)
    color:setColor("orange")
    UI.Separator(cmbPanel2)

    -- Removida a contagem de monstros; agora dispara igual ao Combo
    up = macro(100, "UP", function()
      if g_game.isAttacking() then
        -- mantém o campo "UP" + a sequência UP1..UP12 para compatibilidade
        say(storage.UP)
        say(storage.UP1)
        say(storage.UP2)
        say(storage.UP3)
        say(storage.UP4)
        say(storage.UP5)
        say(storage.UP6)
        say(storage.UP7)
        say(storage.UP8)
        say(storage.UP9)
        say(storage.UP10)
        say(storage.UP11)
        say(storage.UP12)
      end
    end, cmbPanel2)

    addTextEdit("UP1", storage.UP1 or "magia 1", function(widget, text) storage.UP1 = text end, cmbPanel2)
    addTextEdit("UP2", storage.UP2 or "magia 2", function(widget, text) storage.UP2 = text end, cmbPanel2)
    addTextEdit("UP3", storage.UP3 or "magia 3", function(widget, text) storage.UP3 = text end, cmbPanel2)
    addTextEdit("UP4", storage.UP4 or "magia 4", function(widget, text) storage.UP4 = text end, cmbPanel2)
    addTextEdit("UP5", storage.UP5 or "magia 5", function(widget, text) storage.UP5 = text end, cmbPanel2)
    addTextEdit("UP6", storage.UP6 or "magia 6", function(widget, text) storage.UP6 = text end, cmbPanel2)
    addTextEdit("UP7", storage.UP7 or "magia 7", function(widget, text) storage.UP7 = text end, cmbPanel2)
    addTextEdit("UP8", storage.UP8 or "magia 8", function(widget, text) storage.UP8 = text end, cmbPanel2)
    addTextEdit("UP9", storage.UP9 or "magia 9", function(widget, text) storage.UP9 = text end, cmbPanel2)
    addTextEdit("UP10", storage.UP10 or "magia 10", function(widget, text) storage.UP10 = text end, cmbPanel2)
    addTextEdit("UP11", storage.UP11 or "magia 11", function(widget, text) storage.UP11 = text end, cmbPanel2)
    addTextEdit("UP12", storage.UP12 or "magia 12", function(widget, text) storage.UP12 = text end, cmbPanel2)
    addTextEdit("UP", storage.UP or "magia em area!", function(widget, text) storage.UP = text end, cmbPanel2)

    -- ===== TAB: COMBO 2 =====
    TabBar2:addTab("Combo 2", cmbPanel3)
    color = UI.Label("by: @LoboLupus", cmbPanel3)
    color:setColor("orange")
    UI.Separator(cmbPanel3)

    Combo2 = macro(100, "Combo 2", function()
      if g_game.isAttacking() then
        say(storage.Combo1)
        say(storage.Combo2)
        say(storage.Combo3)
        say(storage.Combo4)
        say(storage.Combo5)
        say(storage.Combo6)
        say(storage.Combo7)
        say(storage.Combo8)
        say(storage.Combo9)
        say(storage.Combo10)
        say(storage.Combo11)
        say(storage.Combo12)
      end
    end, cmbPanel3)

    addTextEdit("Combo1", storage.Combo1 or "magia 1", function(widget, text) storage.Combo1 = text end, cmbPanel3)
    addTextEdit("Combo2", storage.Combo2 or "magia 2", function(widget, text) storage.Combo2 = text end, cmbPanel3)
    addTextEdit("Combo3", storage.Combo3 or "magia 3", function(widget, text) storage.Combo3 = text end, cmbPanel3)
    addTextEdit("Combo4", storage.Combo4 or "magia 4", function(widget, text) storage.Combo4 = text end, cmbPanel3)
    addTextEdit("Combo5", storage.Combo5 or "magia 5", function(widget, text) storage.Combo5 = text end, cmbPanel3)
    addTextEdit("Combo6", storage.Combo6 or "magia 6", function(widget, text) storage.Combo6 = text end, cmbPanel3)
    addTextEdit("Combo7", storage.Combo7 or "magia 7", function(widget, text) storage.Combo7 = text end, cmbPanel3)
    addTextEdit("Combo8", storage.Combo8 or "magia 8", function(widget, text) storage.Combo8 = text end, cmbPanel3)
    addTextEdit("Combo9", storage.Combo9 or "magia 9", function(widget, text) storage.Combo9 = text end, cmbPanel3)
    addTextEdit("Combo10", storage.Combo10 or "magia 10", function(widget, text) storage.Combo10 = text end, cmbPanel3)
    addTextEdit("Combo11", storage.Combo11 or "magia 11", function(widget, text) storage.Combo11 = text end, cmbPanel3)
    addTextEdit("Combo12", storage.Combo12 or "magia 12", function(widget, text) storage.Combo12 = text end, cmbPanel3)

  end
end

CombosWindow.closeButton.onClick = function(widget)
  CombosWindow:hide()
end

ui.editCombo.onClick = function(widget)
  CombosWindow:show()
  CombosWindow:raise()
  CombosWindow:focus()
end

-- ===== ÍCONES NA TELA =====
addIcon("Combo",   { outfit = ICON_OUTFIT_COMBO,  text = "Combo" },   Comboss)
addIcon("UP",      { outfit = ICON_OUTFIT_UP,     text = "UP" },      up)
addIcon("Combo 2", { outfit = ICON_OUTFIT_COMBO2, text = "Combo 2" }, Combo2)

-- Hotkey extra
singlehotkey("shift+space", "Stop/Cave", function()
    if CaveBot.isOn() or TargetBot.isOn() then
        CaveBot.setOff()
        TargetBot.setOff()
    elseif CaveBot.isOff() or TargetBot.isOff() then
        CaveBot.setOn()
        TargetBot.setOn()
    end
end, scpPanel)

local privateTabs = addSwitch("openPMTabs", "Abrir Pm", function(widget) widget:setOn(not widget:isOn()) storage.OpenPrivateTabs = widget:isOn() end, scpPanel, parent,scpPanel)
privateTabs:setOn(storage.OpenPrivateTabs,scpPanel)

onTalk(function(name, level, mode, text, channelId, pos)
    if mode == 4 and privateTabs:isOn() then
        local g_console = modules.game_console
        local privateTab = g_console.getTab(name)
        if privateTab == nil then
            privateTab = g_console.addTab(name, true)
            g_console.addPrivateText(g_console.applyMessagePrefixies(name, level, text), g_console.SpeakTypesSettings['private'], name, false, name)
            playSound("/data/sounds/Private Message.ogg")
        end
        return
    end
end,scpPanel) 

-- ==============================
-- SUMMON TOOL by: LoboLupus
-- ==============================

storage.summonName  = storage.summonName  or ""
storage.summonSpell = storage.summonSpell or ""
storage.maxSummons  = storage.maxSummons  or 1

UI.Separator(scpPanel4)

addTextEdit(
    "summonName",
    storage.summonName ~= "" and storage.summonName or "Nome do summon",
    function(widget, text)
        storage.summonName = text
    end,
scpPanel4):setTooltip("Ex: Gama Bunta, Manda, Katsuyu")

addTextEdit(
    "summonSpell",
    storage.summonSpell ~= "" and storage.summonSpell or "Jutsu de invocacao",
    function(widget, text)
        storage.summonSpell = text
    end,
scpPanel4):setTooltip("Ex: kuchyose gamabunta no jutsu")

addTextEdit(
    "maxSummons",
    tostring(storage.maxSummons),
    function(widget, text)
        local value = tonumber(text)
        if value and value >= 1 then
            storage.maxSummons = math.floor(value)
        else
            storage.maxSummons = 1
            widget:setText("1")
        end
    end,
scpPanel4):setTooltip("Quantidade maxima de summons ativos")

local function countSummons(name)
    local count = 0
    for _, creature in ipairs(getSpectators()) do
        if not creature:isPlayer() and creature:getName() == name then
            count = count + 1
            if count >= storage.maxSummons then
                break
            end
        end
    end
    return count
end

Summon = macro(2000, "Summon", function()

    -- Proteção: não executa se não estiver configurado
    if storage.summonName == ""
    or storage.summonSpell == ""
    or storage.summonName == "Nome do summon"
    or storage.summonSpell == "Jutsu de invocação" then
        return
    end

    if countSummons(storage.summonName) < storage.maxSummons then
        say(storage.summonSpell)
    end
end, scpPanel4)

addIcon("Summon", {
    outfit = {
        mount = 849,
        feet = 10,
        legs = 10,
        body = 178,
        type = 952,
        auxType = 0,
        addons = 3,
        head = 48
    },
    text = "Summon"
}, Summon)

local PainelPanelName = "listt"
  local ui = setupUI([[
Panel

  height: 25

  Button
    id: editPainel
    color: green
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 25
    text: - PAINEL -

  ]], parent)
  ui:setId(PaineltroPanelName)

  if not storage[PainelPanelName] then
    storage[PainelPanelName] = { 

    }
  end

rootWidget = g_ui.getRootWidget()
if rootWidget then
    PainelsWindow = UI.createWidget('PainelWindow', rootWidget)
    PainelsWindow:hide()
    TabBar = PainelsWindow.paTabBar
    TabBar:setContentWidget(PainelsWindow.paImagem)
   for v = 1, 1 do





hpPanel = g_ui.createWidget("hpPanel") -- Creates Panel
hpPanel:setId("panelButtons") -- sets ID

hpPanel2 = g_ui.createWidget("hpPanel") -- Creates Panel
hpPanel2:setId("2") -- sets ID

hpPanel3 = g_ui.createWidget("hpPanel") -- Creates Panel
hpPanel:setId("panelButtons") -- sets ID

hpPanel4 = g_ui.createWidget("hpPanel") -- Creates Panel
hpPanel:setId("panelButtons") -- sets ID

hpPanel5 = g_ui.createWidget("hpPanel") -- Creates Panel
hpPanel:setId("panelButtons") -- sets ID

hpPanel6 = g_ui.createWidget("hpPanel") -- Creates Panel
hpPanel:setId("panelButtons") -- sets ID

hpPanel7 = g_ui.createWidget("hpPanel") -- Creates Panel
hpPanel:setId("panelButtons") -- sets ID

TabBar:addTab("HP", hpPanel)
        color= UI.Label("by: @LoboLupus",hpPanel)
color:setColor("orange")
        UI.Separator(hpPanel)
color= UI.Label("Regeneration:",hpPanel)
color:setColor("red")
        UI.Separator(hpPanel)

if type(storage.heal) ~= "table" then
  storage.heal = {on=false, title="HP%", text="big regeneration", min=0, max=99}
end
if type(storage.heal2) ~= "table" then
  storage.heal2 = {on=false, title="HP%", text="regeneration", min=0, max=99}
end

-- create 2 healing widgets
for _, healingInfo in ipairs({storage.heal, storage.heal2}) do
  local healingmacro = macro(100, function()
    local hp = player:getHealthPercent()
    if healingInfo.max >= hp and hp >= healingInfo.min then
      if TargetBot then 
        TargetBot.saySpell(healingInfo.text) -- sync spell with targetbot if available
      else
        say(healingInfo.text)
      end
    end
  end,hpPanel)
  healingmacro.setOn(healingInfo.on)

  UI.DualScrollPanel(healingInfo, function(widget, newParams) 
    healingInfo = newParams
    healingmacro.setOn(healingInfo.on)
  end,hpPanel)
end

TabBar:addTab("Potion", hpPanel2)
        color= UI.Label("by: @LoboLupus",hpPanel2)
color:setColor("orange")
        UI.Separator(hpPanel2)
        color= UI.Label("Positions:",hpPanel2)
color:setColor("red")
        UI.Separator(hpPanel2)
Panels.HealthItem(hpPanel2)
        UI.Separator(hpPanel2)
Panels.HealthItem(hpPanel2)
        UI.Separator(hpPanel2)
Panels.ManaItem(hpPanel2)
        UI.Separator(hpPanel2)
Panels.ManaItem(hpPanel2)

TabBar:addTab("Haste", hpPanel3)
        color= UI.Label("by: @LoboLupus",hpPanel3)
color:setColor("orange")
        UI.Separator(hpPanel3)
        color= UI.Label("Pressa:",hpPanel3)
color:setColor("red")
Panels.Haste(hpPanel3)
        UI.Separator(hpPanel3)
Panels.AntiParalyze(hpPanel3)
        UI.Separator(hpPanel3)


TabBar:addTab("Buff", hpPanel4)
        color= UI.Label("by: @LoboLupus",hpPanel4)
color:setColor("orange")
        UI.Separator(hpPanel4)
        color= UI.Label("Buffs:",hpPanel4)
color:setColor("red")

buffs= macro(1000, "Buff", function()
if not hasPartyBuff() and not isInPz() then
 say(storage.buff)
schedule(2500, function() say(storage.buff2) end)
schedule(4000, function() say(storage.buff3) end)
end
end,hpPanel4)

addIcon("Buff", {outfit={mount=849,feet=10,legs=10,body=178,type=1972,auxType=0,addons=3,head=48}, text="Buff"},buffs)


addTextEdit("buff", storage.buff or "buff", function(widget, text) storage.buff = text
end,hpPanel4)

        color= UI.Label("Buff 2:",hpPanel4)
color:setColor("red")


addTextEdit("buff2", storage.buff2 or "buff 2", function(widget, text) storage.buff2 = text
end,hpPanel4)


        color= UI.Label("Buff 3:",hpPanel4)
color:setColor("red")

addTextEdit("buff3", storage.buff3 or "buff 3", function(widget, text) storage.buff3 = text
end,hpPanel4)

TabBar:addTab("Fuga", hpPanel5)
        color= UI.Label("by: @LoboLupus",hpPanel5)
color:setColor("orange")
        UI.Separator(hpPanel5)
        color= UI.Label("Fugas:",hpPanel5)
color:setColor("red")

if type(storage.fugaa) ~= "table" then
  storage.fugaa = {on=false, title="HP%", text="fuga", min=0, max=20}
end
if type(storage.fugaa2) ~= "table" then
  storage.fugaa2 = {on=false, title="HP%", text="fuga", min=0, max=30}
end
if type(storage.fugaa3) ~= "table" then
  storage.fugaa3 = {on=false, title="HP%", text="fuga", min=0, max=40}
end
if type(storage.fugaa4) ~= "table" then
  storage.fugaa4 = {on=false, title="HP%", text="fuga", min=0, max=40}
end
if type(storage.fugaa5) ~= "table" then
  storage.fugaa5 = {on=false, title="HP%", text="fuga", min=0, max=40}
end

-- create 2 healing widgets
for _, healingInfo2 in ipairs({storage.fugaa, storage.fugaa2, storage.fugaa3, storage.fugaa4,storage.fugaa5}) do
  local healingmacro2 = macro(100, function()
    local hp2 = player:getHealthPercent()
    if healingInfo2.max >= hp2 and hp2 >= healingInfo2.min then
      if TargetBot2 then 
        TargetBot2.saySpell(healingInfo2.text) -- sync spell with targetbot if available
      else
        say(healingInfo2.text)
      end
    end
  end,hpPanel5)
  healingmacro2.setOn(healingInfo2.on)

  UI.DualScrollPanel(healingInfo2, function(widget, newParams) 
    healingInfo2 = newParams
    healingmacro2.setOn(healingInfo2.on)
  end,hpPanel5)
end

TabBar:addTab("Food", hpPanel6)
        color= UI.Label("by: @LoboLupus",hpPanel6)
color:setColor("orange")
        UI.Separator(hpPanel6)
        color= UI.Label("Comidas:",hpPanel6)
color:setColor("red")
Panels.Eating(hpPanel6)
        UI.Separator(hpPanel6)
Panels.Eating(hpPanel6)

end
end

  PainelsWindow.closeButton.onClick = function(widget)
    PainelsWindow:hide()
  end

ui.editPainel.onClick = function(widget)
    PainelsWindow:show()
    PainelsWindow:raise()
    PainelsWindow:focus()
  end

  local loadPanelName = "Loads"
  local ui = setupUI([[
Panel

  height: 25

  Button
    id: editLoad
    color: yellow
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 25
    text: - RELOAD  -
    tooltip: Carregar


  ]], parent)


ui.editLoad.onClick = function(widget)
reload()
end

local sep = UI.Separator()
sep:setHeight(1)
sep:setOpacity(0.05)

-- tools tab
setDefaultTab("Hotkeys")

-- allows to test/edit bot lua scripts ingame, you can have multiple scripts like this, just change storage.ingame_lua
UI.Button("Hotkeys/Macros/Scripts", function(newText)
  UI.MultilineEditorWindow(storage.ingame_hotkeys or "", {title="Hotkeys editor", description="Adicione suas scripts aqui!\nEdited by: @LoboLupus"}, function(text)
    storage.ingame_hotkeys = text
    reload()
  end)
end)

for _, scripts in pairs({storage.ingame_hotkeys}) do
  if type(scripts) == "string" and scripts:len() > 3 then
    local status, result = pcall(function()
      assert(load(scripts, "ingame_editor"))()
    end)
    if not status then 
      error("Ingame edior error:\n" .. result)
    end
  end
end

local sep = UI.Separator()
sep:setHeight(1)
sep:setOpacity(0.05)