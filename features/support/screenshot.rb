
module Screenshots

  if Cucumber::OS_X
    def embed_screenshot(id)
      `screencapture -t png #{id}.png`
      embed("#{id}.png", "image/png")
    end
  elsif Cucumber::WINDOWS
    require 'watir/screen_capture'
    require 'win32/clipboard'

    include Watir::ScreenCapture
    include Win32

    def embed_screenshot(id)
      keybd_event = API.new("keybd_event", 'IILL', 'V', 'user32')
      keybd_event.call(VK_SNAPSHOT,0,0,0)
      File.open("#{id}.bmp", 'wb'){ |fh|
          fh.write Win32::Clipboard.data(Clipboard::DIB)
      }
    end
  else
    # Other platforms...
    def embed_screenshot(id)
      STDERR.puts "Sorry - no screenshots on your platform yet."
    end
  end
end
World(Screenshots)


