package;

import hxDaedalus.graphics.SimpleDrawingContext;

class TestGraphics{

    var g: SimpleDrawingContext;

    public function new( g_: SimpleDrawingContext){
        g = g_;

        // Red Circle with blue border
        g.beginFill( 0xff0000, 1 );
        g.lineStyle( 1, 0x0000ff, 1 );
        g.drawCircle( 100, 100, 30 );
        g.endFill();

    }

}
