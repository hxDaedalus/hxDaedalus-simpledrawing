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

        trace( 'draw red circle with a blue outline' );
        g.beginFill( 0xff0000, 1 );
        g.lineStyle( 1, 0x0000ff, 2 );
        g.drawCircle( 100, 100, 30 );
        g.endFill();

        trace( 'draw a yellow equilateral triangle with green outline' );
        g.beginFill( 0xffff00, 1 );
        g.lineStyle( 1, 0x00ff00, 2 );
        g.drawEquilaterialTri( 300, 100, 30, -Math.PI/2 );
        g.endFill();

        trace( 'draw a purple rectangle with orange outline' );
        g.beginFill( 0x551a8b, 1 );
        g.lineStyle( 1, 0xffa500, 2 );
        g.drawRect( 100-30, 300-30, 60, 60 );
        g.endFill();

        trace( 'heart quadratic curves' );
        g.beginFill( 0xC1D208, 1 );
        g.lineStyle( 1, 0x34DDDD, 5 );
        var cx = 300;
        var cy = 300;
        g.moveTo( cx - 27, cy - 20 );
        g.quadTo( cx - 15, cy - 30, cx, cy - 15 );
        g.quadTo( cx + 15, cy - 30, cx + 27, cy - 20 );
        g.quadTo( cx + 34, cy - 5, cx + 20, cy + 6 );
        g.quadTo( cx + 25, cy, cx, cy + 30 );
        g.quadTo( cx - 25, cy, cx - 20, cy + 6 );
        g.quadTo( cx - 34, cy - 5, cx - 28, cy - 20 );
        g.endFill();

    }

}
