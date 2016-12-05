# Configuration file for ipython-qtconsole.
#`ipython qtconsole -h` will show all style names pygments can find on the system

c = get_config()

c.JupyterWidget.font_family = u'DejaVu Sans Mono'
c.JupyterWidget.font_size = 14
c.JupyterWidget.clear_on_kernel_restart=True
c.JupyterWidget.confirm_restart=True
c.JupyterWidget.banner=''
c.ZMQInteractiveShell.colors = 'Linux'
c.JupyterWidget.buffer_size = 1000
c.JupyterWidget.width=95
c.JupyterWidget.height=30
c.JupyterQtConsoleApp.hide_menubar=True
c.JupyterQtConsoleApp.maximize=False
c.JupyterQtConsole.display_banner=False
c.JupyterQtConsoleApp.display_banner=False
c.JupyterQtConsoleApp.confirm_exit=False
c.JupyterWidget.syntax_style = u'monokai'

#c.JupyterWidget.syntax_style = u'trac'
#c.JupyterWidget.syntax_style = u'fruity'
#c.JupyterWidget.syntax_style = u'manni'
#c.JupyterWidget.syntax_style = u'monokai'
#c.TerminalInteractiveShell.confirm_exit = False
#c.JupyterQtConsoleApp.stylesheet=u"E:/programming/pyprog/IPython/LightBG_style_sheet.css"

# c.IPythonWidget.in_prompt = 'In [<span class="in-prompt-number">%i</span>]: '
# c.IPythonWidget.out_prompt = 'Out[<span class="out-prompt-number">%i</span>]: '
