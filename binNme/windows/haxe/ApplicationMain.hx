// Might have waxe without NME
#if nme
import nme.Assets;
#elseif waxe
import wx.Assets;
#end

#if cpp

#end



#if iosview
@:buildXml("
<files id='__lib__'>
  <file name='FrameworkInterface.mm'>
  </file>
</files>
")
#end
@:cppFileCode("
    
")
class ApplicationMain
{
   static public var engines : Array<Dynamic> = [
      
   ];


   #if waxe
   static public var frame : wx.Frame;
   static public var autoShowFrame : Bool = true;
   #if nme
   static public var nmeStage : wx.NMEStage;
   #end
   #end
   
   public static function main()
   {
      #if cpp
      
      #end


      #if flash

      nme.AssetData.create();

      #elseif nme

      

      nme.app.Application.setPackage("JLM", "Main", "lib.hxDaedalus.simpledrawing", "1.0.0");
      nme.text.Font.useNative = true;

      nme.AssetData.create();

      

      nme.app.Application.setFixedOrientation(
         
            nme.app.Application.OrientationLandscapeAny
         
      );

      #end
   

   
      #if flash
      flash.Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
      flash.Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;

      var load = function() ApplicationBoot.createInstance();

      
         new nme.preloader.Basic(600, 400, 16777215, load);
      


      #elseif waxe

      #if nme
      nme.display.ManagedStage.initSdlAudio();
      #end

      if (ApplicationBoot.canCallMain())
         ApplicationBoot.createInstance();
      else
      {
         wx.App.boot(function()
         {
            var size = { width: 600, height: 400 };
            
               frame = wx.Frame.create(null, null, "Main", null, size);
            

            #if nme
               wx.NMEStage.create(frame, null, null,
               {
                  width: 600,
                  height: 400,
                  fullscreen: false,
                  stencilBuffer: false,
                  depthBuffer: false,
                  antiAliasing: 4,
                  resizable: true,
                  vsync: false,
                  fps : 60 * 1.0,
                  color : 16777215,
                  title : "Main",
                  icon  : Assets.info.get("null")==null ? null : getAsset("null")
               });

               // Show frame before creating instance so context is good.
               frame.shown = true;
               ApplicationBoot.createInstance();
               wx.App.setTopWindow(frame);
   
            #else
               ApplicationBoot.createInstance();
               if (autoShowFrame)
               {
                  wx.App.setTopWindow(frame);
                  frame.shown = true;
               }
            #end

        });
      }
      #elseif cppia
       ApplicationBoot.createInstance();
      #else
         var flags:Int = 
            (true ? nme.app.Application.HARDWARE : 0) |
            (false ? nme.app.Application.DEPTH_BUFFER : 0) |
            (false ? nme.app.Application.STENCIL_BUFFER : 0) |
            (true ? nme.app.Application.RESIZABLE : 0) |
            (false ? nme.app.Application.BORDERLESS : 0) |
            (false ? nme.app.Application.VSYNC : 0) |
            (false ? nme.app.Application.FULLSCREEN : 0) |
            (4 == 4 ? nme.app.Application.HW_AA_HIRES : 0) |
            (4 == 2 ? nme.app.Application.HW_AA : 0);


         #if nme_application

            var params = { flags : flags,
               fps : 60 * 1.0,
               color : 16777215,
               width : 600,
               height : 400,
               title : "Main",
               icon  : Assets.info.get("null")==null ? null : getAsset("null")
            };

            nme.app.Application.createWindow(function(window:nme.app.Window) {
               new Main(window);
            }, params );

         #else

            nme.Lib.create(function() { 
                  nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
                  nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
                  nme.Lib.current.loaderInfo = nme.display.LoaderInfo.create (null);
                  ApplicationBoot.createInstance();
               },
               600, 400, 
               60, 
               16777215,
               flags,
               "Main"
               
            );

         #end
      #end
   }

   @:keep function keepMe() return Reflect.callMethod;

   public static function setAndroidViewHaxeObject(inObj:Dynamic)
   {
      #if androidview
      try
      {
         var setHaxeObject = nme.JNI.createStaticMethod("null.nullBase",
              "setHaxeCallbackObject", "(Lorg/haxe/nme/HaxeObject;)V", true, true );
         if (setHaxeObject!=null)
            setHaxeObject([inObj]);
      }
      catch(e:Dynamic) {  }
      #end
   }

   public static function getAsset(inName:String) : Dynamic
   {
      var i = Assets.info.get(inName);
      if (i==null)
         throw "Asset does not exist: " + inName;
      var cached = i.getCache();
      if (cached!=null)
         return cached;
      switch(i.type)
      {
         case BINARY, TEXT: return Assets.getBytes(inName);
         case FONT: return Assets.getFont(inName);
         case IMAGE: return Assets.getBitmapData(inName);
         case MUSIC, SOUND: return Assets.getSound(inName);
      }

      throw "Unknown asset type: " + i.type;
      return null;
   }
   
   
   public static function __init__ ()
   {
      #if neko
      untyped $loader.path = $array ("@executable_path/", $loader.path);
      #elseif cpp
              
      #end
   }
   
   
}

