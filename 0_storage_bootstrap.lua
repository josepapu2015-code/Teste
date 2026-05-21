-- =====================================
-- DonatorFix - Storage Bootstrap
-- Autor: LoboLupus
-- =====================================

storage = storage or {}

-- Subtabelas globais
storage.extras = storage.extras or {}
storage.targetbot = storage.targetbot or {}
storage.combat = storage.combat or {}
storage.ui = storage.ui or {}

-- Defaults seguros
storage.extras.killUnder = storage.extras.killUnder or 30
storage.extras.debug = storage.extras.debug or false

--modules.game_bot.botWindow.contentsPanel:setImageSource("/bot/MADARA1.3/wallpaper/lobolupus")
--Adaptado e criado por LoboLupus
local function doDownloadImage(imageUrl, widget)
  local function callback(filePath, error)
    if error then
      warn(error)
      return
    end
    widget:setImageSource(filePath)
  end
  modules._G.HTTP.downloadImage(imageUrl, callback)
end
--lobolupus
local rootWidget = g_ui.getRootWidget()
if not rootWidget then return end

local botWindow = rootWidget:recursiveGetChildById("botWindow")
if not botWindow then return end

local contents = botWindow:recursiveGetChildById("contentsPanel")
if not contents then return end

local urlImage = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiQHWukTMmd1N03IwC8kCxNXIkSwuaF9m-Q3UpYzfDT-71rpiBXaC6Bb9kGpTuvWovvPnt59yEtSdrgG8UmI2xz3v-2wD_hwa3JW60tbh-3JOg9tz9Q5OV6qiYbRBMbSJxqKzHCtsT4xWhdU2NA4TLNAO27gBnRc7dvX5wDW8vctUiUI8fXGap-NmMdBYQU/s16000/lobolupus.png"
doDownloadImage(urlImage, contents)

local function updateButtonsBot()
  modules.game_bot.botWindow.closeButton:setImageColor("#363434")
  modules.game_bot.botWindow.minimizeButton:setImageColor("#363434")
  modules.game_bot.botWindow.lockButton:setImageColor("#363434")
  modules.game_bot.botWindow:setImageSource()
  modules.game_bot.botWindow:setBackgroundColor("black")
  modules.game_bot.botWindow:setBorderWidth(1)
  modules.game_bot.botWindow:setBorderColor("black")
  modules.game_bot.botWindow:setText("LoboLupus")
  modules.game_bot.botWindow:setFont("verdana-11px-rounded")
  modules.game_bot.botWindow:setColor("white")
end
updateButtonsBot()






