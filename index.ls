const {app, BrowserWindow} = require \electron
require! <[path url]>

# Keep a global reference of the window object, if you don't, the window will
# be closed automatically when the JavaScript object is garbage collected.
var win

function create-window
  # Create the browser window.
  win = new BrowserWindow do
    width: 800
    height: 600
    webPreferences: nodeIntegration: true

  # and load the index.html of the app.
  win.loadURL url.format do
    pathname: path.join __dirname, \index.html
    protocol: \file:
    slashes: true

  # Open the DevTools.
  win.web-contents.open-dev-tools!

  # Emitted when the window is closed.
  win.on \closed' ->
    # Dereference the window object, usually you would store windows
    # in an array if your app supports multi windows, this is the time
    # when you should delete the corresponding element.
    win = null

# This method will be called when Electron has finished
# initialization and is ready to create browser windows.
# Some APIs can only be used after this event occurs.
app.on \ready createWindow

# Quit when all windows are closed.
app.on \window-all-closed ->
  # On macOS it is common for applications and their menu bar
  # to stay active until the user quits explicitly with Cmd + Q
  if process.platform isnt \darwin then app.quit!

app.on \activate ->
  # On macOS it's common to re-create a window in the app when the
  # dock icon is clicked and there are no other windows open.
  if win === null then create-window!

# In this file you can include the rest of your app's specific main process
# code. You can also put them in separate files and require them here.
