package;

import wings.core.SimpleDrawingContext;
import wings.core.TargetCanvas;
import TestGraphics;

#if (flash || nme || openfl)
    import flash.Lib;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
#elseif java
    import wings.javaSwing.BasicSwing;
    import java.awt.Graphics2D;
    import haxe.Timer;
#elseif luxe
    import luxe.Game;
    import luxe.Input.Key;
    import luxe.Input.KeyEvent;
#elseif flambe
    import flambe.Component;
    import flambe.display.FillSprite;
    import flambe.Entity;
    import flambe.System;
#elseif js
    import wings.jsCanvas.BasicCanvas;
#elseif format
    import wings.pixel.BasicPixel;
#end

#if (flash || nme || openfl)
    class Main extends Sprite
#elseif java
    class Main extends BasicSwing
#elseif luxe
    class Main extends Game
#elseif flambe
    class Main extends Component
#elseif (js || format)
    class Main
#end
{

    var g : SimpleDrawingContext;
    var testGraphic: TestGraphics;

	#if luxe //
	override function ready() {
	#else // not luxe
    public static function main():Void
    {
        trace('main');
        #if (flash || nme || openfl)
            Lib.current.addChild(new Main());
        #elseif flambe
            System.init();
            new Main();
        #elseif ( java || js || format )
            new Main();
        #end
    }

    public function new()
    {
        #if ( flash || nme || openfl || java || flambe )
            super();
        #elseif ( js || format )
        #end

	#end // not luxe

        createViewPort();
        trace('g' );
        testGraphic = new TestGraphics( g #if java, surface #end );

        #if (flash || nme || openfl)
            Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        #end
    }

    public function createViewPort(){
        // create a viewport
        #if (flash || nme || openfl)
            var viewSprite = new Sprite();
            g = new SimpleDrawingContext(viewSprite.graphics);
            addChild( viewSprite );
        #elseif java
            g = new SimpleDrawingContext(this);
        #elseif flambe
			var canvas = new TargetCanvas();
            g = new SimpleDrawingContext( canvas );
            var background = System.root.addChild(new Entity()
            .add(new FillSprite(0xffffff, System.stage.width, System.stage.height).setXY(0, 0))
            .add(this));
            background.addChild( new Entity().add( canvas ) );
        #elseif ( luxe || svg || js )
            g = new SimpleDrawingContext( new TargetCanvas() );
        #elseif ( format )
            trace( ' format ');
            g = new SimpleDrawingContext( new TargetCanvas( 1024, 768 ) );
        #end
    }

    #if( flash || nme || openfl )
    function onKeyDown(event:KeyboardEvent):Void
    {
        if (event.keyCode == 27) { // ESC
            #if flash
                flash.system.System.exit(1);
            #elseif sys
                Sys.exit(1);
            #end
        }
    }
    #end
    #if luxe
    override function onkeyup(e:KeyEvent) {
        if (e.keycode == Key.escape) {
            Luxe.shutdown();
        }
    } // onkeyup
    override function config( config: luxe.AppConfig ) {

        config.render.antialiasing = 4;
        return config;
    }
    #end
}
