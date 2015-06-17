package;

import hxDaedalus.graphics.SimpleDrawingContext;

class TestGraphics{

    var g: SimpleDrawingContext;

    public function new( g_: SimpleDrawingContext #if java, surface: hxDaedalus.swing.Surface #end ){
        g = g_;
        #if java
            surface.paintFunction =  function( g2D: java.awt.Graphics2D ){
                g.graphics = g2D;
                draw();
            }
        #else
            draw();
        #end
    }

    inline private function draw(){
        // Red Circle with blue border
        trace( 'draw red circle' );
        g.beginFill( 0xff0000, 1 );
        g.lineStyle( 1, 0x0000ff, 1 );
        g.drawCircle( 100, 100, 30 );
        g.endFill();
    }

}
