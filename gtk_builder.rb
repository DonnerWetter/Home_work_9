require 'gtk3'

class HelloGlade
  def on_click(sender)
    @builder.get_object('screen').label = sender.label
  end

  def initialize
    Gtk.init

    @builder = Gtk::Builder.new
    @builder.add_from_file('my_hello.glade')
    @builder.connect_signals { |handler| method(handler) }

    window1 = @builder.get_object('window1')
    window1.show_all

    Gtk.main
  end

  def gtk_main_quit
    puts 'Gtk.main_quit'
    Gtk.main_quit
  end
end

hello = HelloGlade.new
