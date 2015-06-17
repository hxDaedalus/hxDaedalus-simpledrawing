package;

import haxe.io.Eof;
import sys.io.File;
import sys.io.FileInput;
import sys.io.FileOutput;

class WebJS
{
  static function main()
  {
    var fname = "Main.html";
    var fout = File.write( fname, false );
    fout.writeString("<!DOCTYPE html><html lang=\"en\">\n" );
    fout.writeString("<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
    fout.writeString("<title>hxDaedalus Simple Drawing example</title>\n" );
    fout.writeString("</head>\n" );
    fout.writeString("<body bgcolor=\"#000000\">\n<script type=\"text/javascript\" src=\"Main.js\"></script>\n</body></html>");
    fout.close();
  }
}
